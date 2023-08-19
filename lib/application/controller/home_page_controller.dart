import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:meigen_finder/application/state/home_page_view_state.dart';
import 'package:meigen_finder/domain/collection/emotional_type.dart';
import 'package:meigen_finder/infra/providers/like_quote_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/collection/todays_quote.dart';
import '../../infra/preference/shared_preference.dart';
import '../../infra/providers/quote_repository_provider.dart';

part 'home_page_controller.g.dart';

@riverpod
class HomePageController extends _$HomePageController {
  @override
  HomePageViewState build() => HomePageViewState(
        emotionalType: null,
      );

  Future<void> fetch() async {
    await _fetchLikeQuotes();
    await _fetchLastDateUpdatedTodayQuote();
  }

  Future<void> _fetchLikeQuotes() async {
    final repository = await ref.read(likeQuoteRepositoryProvider.future);
    final likeQuotes = await repository.fetchLikeQuotes();
    state = state.copyWith(likedQuotes: likeQuotes);
  }

  Future<void> _fetchLastDateUpdatedTodayQuote() async {
    final preferenceManager = ref.read(preferenceManagerProvider);
    final lastDateUpdatedTodayQuoteText =
        preferenceManager.getValue(PreferenceKey.todayQuotes, '').toString();
    print(lastDateUpdatedTodayQuoteText);
    if (lastDateUpdatedTodayQuoteText.isEmpty) return;
    final date = DateTime.parse(lastDateUpdatedTodayQuoteText);
    state = state.copyWith(lastDateUpdatedTodayQuote: date);
  }

  void updateEmotionalType(EmotionalType emotionalType) async {
    state = state.copyWith(emotionalType: emotionalType);
  }

  Future<void> onUpdateTodayQuote() async {
    try {
      final emotionalType = state.emotionalType;
      if (emotionalType == null) return;
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
        ..createdAt = DateTime.now();

      await repository.onUpdateTodayQuote(todaysQuote, emotionalType);
      state = state.copyWith(
        todaysQuote: todaysQuote,
      );
    } catch (e) {
      //TODO:エラーハンドリング
      debugPrint(e.toString());
      state = state.copyWith(
        todaysQuote: null,
      );
    }
  }
}
