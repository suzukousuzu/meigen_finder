import '../../domain/collection/todays_quote.dart';

class HistoryPageViewState {
  final DateTime? selectedDate;
  final DateTime focusedDay;
  final List<TodaysQuote>? quotes;

//<editor-fold desc="Data Methods">
  const HistoryPageViewState({
    this.selectedDate,
    required this.focusedDay,
    this.quotes,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HistoryPageViewState &&
          runtimeType == other.runtimeType &&
          selectedDate == other.selectedDate &&
          focusedDay == other.focusedDay &&
          quotes == other.quotes);

  @override
  int get hashCode =>
      selectedDate.hashCode ^ focusedDay.hashCode ^ quotes.hashCode;

  @override
  String toString() {
    return 'HistoryPageViewState{ selectedDate: $selectedDate, focusedDay: $focusedDay, quotes: $quotes,}';
  }

  HistoryPageViewState copyWith({
    DateTime? selectedDate,
    DateTime? focusedDay,
    List<TodaysQuote>? quotes,
  }) {
    return HistoryPageViewState(
      selectedDate: selectedDate ?? this.selectedDate,
      focusedDay: focusedDay ?? this.focusedDay,
      quotes: quotes ?? this.quotes,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'selectedDate': this.selectedDate,
      'focusedDay': this.focusedDay,
      'quotes': this.quotes,
    };
  }

  factory HistoryPageViewState.fromMap(Map<String, dynamic> map) {
    return HistoryPageViewState(
      selectedDate: map['selectedDate'] as DateTime,
      focusedDay: map['focusedDay'] as DateTime,
      quotes: map['quotes'] as List<TodaysQuote>,
    );
  }

//</editor-fold>
}
