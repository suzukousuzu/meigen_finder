import '../../domain/collection/todays_quote.dart';

class HistoryPageViewState {
  final DateTime? selectedDate;
  final List<TodaysQuote>? quotes;

//<editor-fold desc="Data Methods">
  const HistoryPageViewState({
    this.selectedDate,
    this.quotes,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HistoryPageViewState &&
          runtimeType == other.runtimeType &&
          selectedDate == other.selectedDate &&
          quotes == other.quotes);

  @override
  int get hashCode => selectedDate.hashCode ^ quotes.hashCode;

  @override
  String toString() {
    return 'HistoryPageViewState{' +
        ' selectedDate: $selectedDate,' +
        ' quotes: $quotes,' +
        '}';
  }

  HistoryPageViewState copyWith({
    DateTime? selectedDate,
    List<TodaysQuote>? quotes,
  }) {
    return HistoryPageViewState(
      selectedDate: selectedDate ?? this.selectedDate,
      quotes: quotes ?? this.quotes,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'selectedDate': this.selectedDate,
      'quotes': this.quotes,
    };
  }

  factory HistoryPageViewState.fromMap(Map<String, dynamic> map) {
    return HistoryPageViewState(
      selectedDate: map['selectedDate'] as DateTime,
      quotes: map['quotes'] as List<TodaysQuote>,
    );
  }

//</editor-fold>
}
