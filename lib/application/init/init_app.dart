import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meigen_finder/infra/manager/app_purchase_manager.dart';

import '../../infra/manager/ad_manager.dart';
import '../../infra/manager/local_notification_manager.dart';
import '../../infra/manager/preference_manager.dart';

final initAppProvider = Provider<InitApp>(
  (ref) => InitApp(
    ref.read(preferenceManagerProvider),
    ref.read(adManagerProvider),
    ref.read(inAppPurchaseManagerProvider),
    ref.read(localNotificationManagerProvider),
  ),
);

class InitApp {
  InitApp(
    this._preferenceManager,
    this._adManager,
    this._inAppPurchaseManager,
    this._localNotificationManager,
  );

  final PreferenceManager _preferenceManager;
  final AdManager _adManager;
  final InAppPurchaseManager _inAppPurchaseManager;
  final LocalNotificationManager _localNotificationManager;

  Future<void> execute() async {
    Future.wait([
      _preferenceManager.init(),
      _localNotificationManager.init(),
      _adManager.initAdmob(),
      _inAppPurchaseManager.initInAppPurchase(),
    ]);
    
    _localNotificationManager.scheduleDaily8PMNotification();
    _adManager.initBannerAd();
    _adManager.initInterstitialAd();
    _adManager.loadBannerAd();
  }
}
