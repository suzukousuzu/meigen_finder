import 'package:meigen_finder/domain/collection/todays_quote.dart';

class QuoteDetailViewState {
  final TodaysQuote todaysQuote;
  final bool isLiked;

//<editor-fold desc="Data Methods">
  const QuoteDetailViewState({
    required this.todaysQuote,
    required this.isLiked,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is QuoteDetailViewState &&
          runtimeType == other.runtimeType &&
          todaysQuote == other.todaysQuote &&
          isLiked == other.isLiked);

  @override
  int get hashCode => todaysQuote.hashCode ^ isLiked.hashCode;

  @override
  String toString() {
    return 'QuoteDetailViewState{ todaysQuote: $todaysQuote, isLiked: $isLiked,}';
  }

  QuoteDetailViewState copyWith({
    TodaysQuote? todaysQuote,
    bool? isLiked,
  }) {
    return QuoteDetailViewState(
      todaysQuote: todaysQuote ?? this.todaysQuote,
      isLiked: isLiked ?? this.isLiked,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'todaysQuote': todaysQuote,
      'isLiked': isLiked,
    };
  }

  factory QuoteDetailViewState.fromMap(Map<String, dynamic> map) {
    return QuoteDetailViewState(
      todaysQuote: map['todaysQuote'] as TodaysQuote,
      isLiked: map['isLiked'] as bool,
    );
  }

//</editor-fold>
}
