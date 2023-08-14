import 'package:meigen_finder/domain/collection/todays_quote.dart';

class QuoteDetailPageViewState {
  final TodaysQuote todaysQuote;
  final bool isLiked;

//<editor-fold desc="Data Methods">
  const QuoteDetailPageViewState({
    required this.todaysQuote,
    required this.isLiked,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is QuoteDetailPageViewState &&
          runtimeType == other.runtimeType &&
          todaysQuote == other.todaysQuote &&
          isLiked == other.isLiked);

  @override
  int get hashCode => todaysQuote.hashCode ^ isLiked.hashCode;

  @override
  String toString() {
    return 'QuoteDetailViewState{ todaysQuote: $todaysQuote, isLiked: $isLiked,}';
  }

  QuoteDetailPageViewState copyWith({
    TodaysQuote? todaysQuote,
    bool? isLiked,
  }) {
    return QuoteDetailPageViewState(
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

  factory QuoteDetailPageViewState.fromMap(Map<String, dynamic> map) {
    return QuoteDetailPageViewState(
      todaysQuote: map['todaysQuote'] as TodaysQuote,
      isLiked: map['isLiked'] as bool,
    );
  }

//</editor-fold>
}
