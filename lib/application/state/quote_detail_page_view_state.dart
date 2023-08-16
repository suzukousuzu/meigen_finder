import '../../domain/collection/quote.dart';

class QuoteDetailPageViewState {
  final Quote quote;
  final bool isLiked;

//<editor-fold desc="Data Methods">
  const QuoteDetailPageViewState({
    required this.quote,
    required this.isLiked,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is QuoteDetailPageViewState &&
          runtimeType == other.runtimeType &&
          quote == other.quote &&
          isLiked == other.isLiked);

  @override
  int get hashCode => quote.hashCode ^ isLiked.hashCode;

  @override
  String toString() {
    return 'QuoteDetailPageViewState{' +
        ' quote: $quote,' +
        ' isLiked: $isLiked,' +
        '}';
  }

  QuoteDetailPageViewState copyWith({
    Quote? quote,
    bool? isLiked,
  }) {
    return QuoteDetailPageViewState(
      quote: quote ?? this.quote,
      isLiked: isLiked ?? this.isLiked,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'quote': this.quote,
      'isLiked': this.isLiked,
    };
  }

  factory QuoteDetailPageViewState.fromMap(Map<String, dynamic> map) {
    return QuoteDetailPageViewState(
      quote: map['quote'] as Quote,
      isLiked: map['isLiked'] as bool,
    );
  }

//</editor-fold>
}
