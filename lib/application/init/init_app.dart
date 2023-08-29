import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../infra/manager/ad_manager.dart';
import '../../infra/manager/preference_manager.dart';

final initAppProvider = Provider<InitApp>(
  (ref) => InitApp(
    ref.read(preferenceManagerProvider),
    ref.read(adManagerProvider),
  ),
);

class InitApp {
  InitApp(
    this._preferenceManager,
    this._adManager,
  );

  final PreferenceManager _preferenceManager;
  final AdManager _adManager;

  Future<void> execute() async {
    _preferenceManager.init();
    _adManager.initAdmob().whenComplete(() {
      _adManager.initBannerAd();
      _adManager.initInterstitialAd();
      _adManager.loadBannerAd();
    });
  }
}
