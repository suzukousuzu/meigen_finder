import 'package:meigen_finder/application/state/history_page_view_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'history_page_controller.g.dart';

@riverpod
class HistoryPageController extends _$HistoryPageController {
  @override
  HistoryPageViewState build() =>
      HistoryPageViewState(focusedDay: DateTime.now());

  void onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    state = state.copyWith(selectedDate: selectedDay, focusedDay: focusedDay);
  }
}