import '../../domain/collection/quote.dart';

class FavoriteQuotePageViewState {
  final List<Quote>? likedQuotes;

//<editor-fold desc="Data Methods">
  const FavoriteQuotePageViewState({
    this.likedQuotes,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FavoriteQuotePageViewState &&
          runtimeType == other.runtimeType &&
          likedQuotes == other.likedQuotes);

  @override
  int get hashCode => likedQuotes.hashCode;

  @override
  String toString() {
    return 'FavoriteQuotePageViewState{' + ' likedQuotes: $likedQuotes,' + '}';
  }

  FavoriteQuotePageViewState copyWith({
    List<Quote>? likedQuotes,
  }) {
    return FavoriteQuotePageViewState(
      likedQuotes: likedQuotes ?? this.likedQuotes,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'likedQuotes': this.likedQuotes,
    };
  }

  factory FavoriteQuotePageViewState.fromMap(Map<String, dynamic> map) {
    return FavoriteQuotePageViewState(
      likedQuotes: map['likedQuotes'] as List<Quote>,
    );
  }

//</editor-fold>
}
