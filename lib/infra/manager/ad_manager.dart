import 'dart:io';

import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final adManagerProvider = Provider<AdManager>((ref) => AdManager());

class AdManager {
  BannerAd? bannerAd;
  InterstitialAd? interstitialAd;

  final int _maxFailedToAttempt = 3;
  int _numInterstitialLoadAttempt = 0;

  Future<void> initAdmob() {
    return MobileAds.instance.initialize();
  }

  void initBannerAd() {
    bannerAd = BannerAd(
      adUnitId: bannerAdUnitId,
      size: AdSize.banner,
      request: const AdRequest(),
      listener: const BannerAdListener(),
    );
  }

  void initInterstitialAd() {
    InterstitialAd.load(
      adUnitId: interstitialAdUnitId,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(onAdLoaded: (ad) {
        interstitialAd = ad;
        _numInterstitialLoadAttempt = 0;
      }, onAdFailedToLoad: (error) {
        interstitialAd = null;
        _numInterstitialLoadAttempt++;
        if (_numInterstitialLoadAttempt <= _maxFailedToAttempt) {
          initInterstitialAd();
        }
      }),
    );
  }

  dispose() {
    bannerAd?.dispose();
    interstitialAd?.dispose();
  }

  static String get appId {
    if (Platform.isAndroid) {
      return "ca-app-pub-5327122452999188~5309993198";
    } else if (Platform.isIOS) {
      return "ca-app-pub-5327122452999188~1466024364";
    } else {
      throw UnsupportedError("Unsupported platform");
    }
  }

  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-5327122452999188/6717478900";
    } else if (Platform.isIOS) {
      //test:ca-app-pub-3940256099942544/2934735716
      //本物：ca-app-pub-5327122452999188/1242663086
      return "ca-app-pub-3940256099942544/2934735716";
    } else {
      throw UnsupportedError("Unsupported platform");
    }
  }

  String get interstitialAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-5327122452999188/8928709278";
    } else if (Platform.isIOS) {
      return "ca-app-pub-5327122452999188/6717478900";
    } else {
      throw UnsupportedError("Unsupported platform");
    }
  }

  void showInterstitialAd() {
    if (interstitialAd == null) return;
    interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdDismissedFullScreenContent: (ad) {
        ad.dispose();
        initInterstitialAd();
      },
      onAdFailedToShowFullScreenContent: (ad, error) {
        ad.dispose();
        initInterstitialAd();
      },
    );
    interstitialAd!.show();
    interstitialAd == null;
  }

  void loadBannerAd() {
    bannerAd?.load();
  }
}
