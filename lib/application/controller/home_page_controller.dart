import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:meigen_finder/application/state/home_page_view_state.dart';
import 'package:meigen_finder/domain/collection/emotional_type.dart';
import 'package:meigen_finder/infra/data_holder/date_time_holder.dart';
import 'package:meigen_finder/infra/providers/like_quote_repository_provider.dart';
import 'package:meigen_finder/util/datetime_extension.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/collection/todays_quote.dart';
import '../../infra/data_holder/is_premium_plan_holder.dart';
import '../../infra/manager/ad_manager.dart';
import '../../infra/manager/preference_manager.dart';
import '../../infra/providers/quote_repository_provider.dart';

part 'home_page_controller.g.dart';

@riverpod
class HomePageController extends _$HomePageController {
  @override
  HomePageViewState build() {
    final dateTimeHolder = ref.watch(dateTimeHolderProvider);
    dateTimeHolder.stream.listen((dateTime) {
      state = state.copyWith(
        lastDateUpdatedTodayQuote: dateTime,
      );
    });

    final isPremiumPlanHolder = ref.watch(isPremiumPlanHolderProvider);
    isPremiumPlanHolder.stream.listen((isPremium) {
      state = state.copyWith(
        isPremium: isPremium,
      );
    });

    return HomePageViewState(
      emotionalType: null,
      todayQuoteResult: TodayQuoteResult(null, false),
      isPremium: false,
      todaysQuoteDisplayCount: 0,
    );
  }

  Future<void> fetch() async {
    _fetchBannerAd();
    _initInterstitialAd();
    Future.wait([
      _fetchLikeQuotes(),
      _fetchTodayQuote(),
      _fetchLastDateUpdatedTodayQuote(),
      _fetchTodaysQuoteDisplayCount(),
    ]);
  }

  Future<void> _fetchLikeQuotes() async {
    final repository = await ref.read(likeQuoteRepositoryProvider.future);
    final likeQuotes = await repository.fetchLikeQuotes();
    state = state.copyWith(likedQuotes: likeQuotes);
  }

  Future<void> _fetchTodayQuote() async {
    final repository = await ref.read(quoteRepositoryProvider.future);
    final todayQuote = await repository.fetchTodayQuote();
    final todayQuoteResult =
        state.todayQuoteResult?.copyWith(todaysQuote: todayQuote);
    state = state.copyWith(todayQuoteResult: todayQuoteResult);
  }

  Future<void> _fetchTodaysQuoteDisplayCount() async {
    final preferenceManager = ref.read(preferenceManagerProvider);
    final todaysQuoteDisplayCount = preferenceManager.getValue(
        PreferenceKey.todaysQuoteDisplayCount, 0) as int;
    state = state.copyWith(todaysQuoteDisplayCount: todaysQuoteDisplayCount);
  }

  void _fetchBannerAd() {
    final adManager = ref.read(adManagerProvider);

    adManager.initBannerAd();
    adManager.loadBannerAd();
    final bannerAd = adManager.bannerAd;
    state = state.copyWith(bannerAd: bannerAd);
  }

  void _initInterstitialAd() {
    final adManager = ref.read(adManagerProvider);
    adManager.initInterstitialAd();
  }

  Future<void> _fetchLastDateUpdatedTodayQuote() async {
    final preferenceManager = ref.read(preferenceManagerProvider);
    final lastDateUpdatedTodayQuoteText =
        preferenceManager.getValue(PreferenceKey.todayQuotes, '').toString();
    if (lastDateUpdatedTodayQuoteText.isEmpty) return;
    final date = DateTime.parse(lastDateUpdatedTodayQuoteText).date;
    state = state.copyWith(lastDateUpdatedTodayQuote: date);
  }

  void updateEmotionalType(EmotionalType emotionalType) async {
    state = state.copyWith(emotionalType: emotionalType);
  }

  Future<void> onUpdateTodayQuote() async {
    try {
      final emotionalType = state.emotionalType;
      if (emotionalType == null) {
        throw StateError('emotionalType is null');
      }

      final repository = await ref.read(quoteRepositoryProvider.future);
      final masterData = await repository.getMasterData();
      // emotionalTypeと一致するデータのリストを取得
      final matchingData = masterData
          .where((data) => data.emotionalType == emotionalType)
          .toList();

      final likedQuotes = state.likedQuotes ?? [];

      // お気に入りに登録してない物の中から選ぶ
      final unlikedMatchingData =
          matchingData.where((data) => !likedQuotes.contains(data)).toList();

      // 一致するデータの中からランダムに1つ選択
      final random = Random();
      final selectedData =
          unlikedMatchingData[random.nextInt(unlikedMatchingData.length)];
      final todaysQuote = TodaysQuote()
        ..id = selectedData.id
        ..emotionalType = emotionalType
        ..quote = selectedData
        ..createdAt = DateTime.now().date;

      await repository.onUpdateTodayQuote(todaysQuote, emotionalType);
      state = state.copyWith(
        todayQuoteResult: TodayQuoteResult(todaysQuote, true),
      );
      // 今日の名言の表示回数を保存
      final preferenceManager = ref.read(preferenceManagerProvider);
      if (state.todaysQuoteDisplayCount <= 2) {
        preferenceManager.setValue(PreferenceKey.todaysQuoteDisplayCount,
            state.todaysQuoteDisplayCount + 1);
        final adManager = ref.read(adManagerProvider);
        if (!state.isPremium && state.todaysQuoteDisplayCount == 2) {
          adManager.showInterstitialAd();
        }
      } else {
        preferenceManager.setValue(PreferenceKey.todaysQuoteDisplayCount, 0);
      }
    } catch (e) {
      //TODO:エラーハンドリング
      debugPrint(e.toString());
      state = state.copyWith(
        todayQuoteResult: TodayQuoteResult(null, false),
      );
    }
  }
}
