import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

enum PurchaseMode {
  donation,
  deleteAd,
}

final inAppPurchaseManagerProvider = Provider<InAppPurchaseManager>(
  (ref) => InAppPurchaseManager(),
);

class InAppPurchaseManager {
  Offerings? _offerings;

  Offerings? get offerings => _offerings;

  Package? get deleteAdPackage => _offerings?.all['delete_ad']?.lifetime;
  Package? get donationPackage =>
      _offerings?.all['donation']?.availablePackages[0];

  bool _isPremiumPlan = false;

  ///初期化処理
  Future<void> initInAppPurchase() async {
    await dotenv.load(fileName: "assets/.env");

    final androidKey = dotenv.get('REVENUECAT_KEY_ANDROID');
    final iosKey = dotenv.get('REVENUECAT_KEY_IOS');

    await Purchases.setLogLevel(LogLevel.debug);

    Purchases.addCustomerInfoUpdateListener(updatePurchases);
    PurchasesConfiguration? configuration;
    if (Platform.isAndroid) {
      configuration = PurchasesConfiguration(androidKey);
    } else if (Platform.isIOS) {
      configuration = PurchasesConfiguration(iosKey);
    }

    await Purchases.configure(configuration!);
    _offerings = await Purchases.getOfferings();
  }

  void updatePurchases(CustomerInfo purchaseInfo) {
    final entitlements = purchaseInfo.entitlements.all;

    if (entitlements.isEmpty) {
      _isPremiumPlan = false;
      return;
    }

    if (!entitlements.containsKey('delete_ad')) {
      _isPremiumPlan = false;
    } else if (entitlements['delete_ad']!.isActive) {
      _isPremiumPlan = true;
    } else {
      _isPremiumPlan = false;
    }
  }

  ///購入処理
  Future<void> makePurchase(PurchaseMode mode) async {
    final package = switch (mode) {
      PurchaseMode.deleteAd => deleteAdPackage,
      PurchaseMode.donation => donationPackage,
    };

    if (package == null) return;
    try {
      await Purchases.purchasePackage(package);
    } on PlatformException catch (e) {
      debugPrint(e.toString());
      final errorCode = PurchasesErrorHelper.getErrorCode(e);
      if (errorCode == PurchasesErrorCode.purchaseCancelledError) {
        debugPrint('userCancel');
      } else if (errorCode == PurchasesErrorCode.purchaseNotAllowedError) {
        debugPrint('purchase not allowed');
      } else if (errorCode == PurchasesErrorCode.purchaseInvalidError) {
        debugPrint('purchase invalid error');
      } else {
        debugPrint('unKnownError');
      }
    }
  }

  ///購入の復元処理
  Future<void> restorePurchase() async {
    try {
      await Purchases.restorePurchases();
    } on PlatformException catch (e) {
      final errorCode = PurchasesErrorHelper.getErrorCode(e);
      debugPrint(errorCode.toString());
    }
  }
}
