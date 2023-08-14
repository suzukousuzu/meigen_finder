import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:meigen_finder/application/state/home_page_view_state.dart';
import 'package:meigen_finder/domain/collection/emotional_type.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/collection/todays_quote.dart';
import '../../infra/providers/quote_repository_provider.dart';

part 'home_page_controller.g.dart';

@riverpod
class HomePageController extends _$HomePageController {
  @override
  HomePageViewState build() => HomePageViewState(emotionalType: null);

  Future<void> fetchLikeQuotes() async {
    // TODO:お気に入りの名言を取得
  }

  Future<void> updateEmotionalType(EmotionalType emotionalType) async {
    try {
      final repository = await ref.read(quoteRepositoryProvider.future);
      final masterData = await repository.getMasterData();
      // emotionalTypeと一致するデータのリストを取得
      final matchingData = masterData
          .where((data) => data.emotionalType == emotionalType)
          .toList();

      // TODO:お気に入りに登録してない物の中から選ぶ
      // 一致するデータの中からランダムに1つ選択
      final random = Random();
      final selectedData = matchingData[random.nextInt(matchingData.length)];
      final todaysQuote = TodaysQuote()
        ..id = selectedData.id
        ..emotionalType = emotionalType
        ..quote = selectedData
        ..createdAt = DateTime.now();
      await repository.onUpdateTodayQuote(todaysQuote, emotionalType);
      state = state.copyWith(
        emotionalType: emotionalType,
        todaysQuote: todaysQuote,
      );
    } catch (e) {
      //TODO:エラーハンドリング
      debugPrint(e.toString());
      state = state.copyWith(emotionalType: null);
    }
  }
}
