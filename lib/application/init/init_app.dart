import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meigen_finder/infra/manager/app_purchase_manager.dart';

import '../../infra/manager/ad_manager.dart';
import '../../infra/manager/preference_manager.dart';

final initAppProvider = Provider<InitApp>(
  (ref) => InitApp(
    ref.read(preferenceManagerProvider),
    ref.read(adManagerProvider),
    ref.read(inAppPurchaseManagerProvider),
  ),
);

class InitApp {
  InitApp(
    this._preferenceManager,
    this._adManager,
    this._inAppPurchaseManager,
  );

  final PreferenceManager _preferenceManager;
  final AdManager _adManager;
  final InAppPurchaseManager _inAppPurchaseManager;

  Future<void> execute() async {
    Future.wait([
      _preferenceManager.init(),
      _adManager.initAdmob(),
      _inAppPurchaseManager.initInAppPurchase(),
    ]);

    _adManager.initBannerAd();
    _adManager.initInterstitialAd();
    _adManager.loadBannerAd();
  }
}
