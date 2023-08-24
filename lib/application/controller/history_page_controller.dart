import 'package:flutter/cupertino.dart';
import 'package:meigen_finder/application/state/history_page_view_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../infra/data_holder/like_quote_data_holder.dart';
import '../../infra/providers/quote_repository_provider.dart';

part 'history_page_controller.g.dart';

@riverpod
class HistoryPageController extends _$HistoryPageController {
  @override
  HistoryPageViewState build() {
    final likeQuotesDataHolder = ref.watch(likeQuotesHolderProvider);
    likeQuotesDataHolder.stream.listen((event) {
      state = state.copyWith(likedQuotes: event);
    });
    return HistoryPageViewState(
        focusedDay: DateTime.now(), selectedDate: DateTime.now());
  }

  void onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    state = state.copyWith(selectedDate: selectedDay, focusedDay: focusedDay);
  }

  Future<void> fetchHistory() async {
    try {
      final repository = await ref.read(quoteRepositoryProvider.future);
      final quotes = await repository.fetchHistory();
      state = state.copyWith(quotes: quotes);
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
