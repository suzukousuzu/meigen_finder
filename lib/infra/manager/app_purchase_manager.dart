import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

class InAppPurchaseManager {
  Offerings? _offerings;

  @override
  Offerings? get offerings => _offerings;

  bool _isPremiumPlan = false;

  @override
  bool get isPremiumPlan => _isPremiumPlan;

  ///初期化処理
  @override
  Future<void> initInAppPurchase() async {
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
  Future<void> makePurchase() async {
    final package = offerings?.all['delete_ad']?.lifetime;

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
