import 'package:meigen_finder/domain/collection/emotional_type.dart';
import 'package:meigen_finder/domain/collection/todays_quote.dart';

import '../../domain/collection/quote.dart';

class HomePageViewState {
  EmotionalType? emotionalType;
  TodaysQuote? todaysQuote;
  List<Quote>? likedQuotes;

//<editor-fold desc="Data Methods">
  HomePageViewState({
    this.emotionalType,
    this.todaysQuote,
    this.likedQuotes,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HomePageViewState &&
          runtimeType == other.runtimeType &&
          emotionalType == other.emotionalType &&
          todaysQuote == other.todaysQuote &&
          likedQuotes == other.likedQuotes);

  @override
  int get hashCode =>
      emotionalType.hashCode ^ todaysQuote.hashCode ^ likedQuotes.hashCode;

  @override
  String toString() {
    return 'HomePageViewState{' +
        ' emotionalType: $emotionalType,' +
        ' todaysQuote: $todaysQuote,' +
        ' likedQuotes: $likedQuotes,' +
        '}';
  }

  HomePageViewState copyWith({
    EmotionalType? emotionalType,
    TodaysQuote? todaysQuote,
    List<Quote>? likedQuotes,
  }) {
    return HomePageViewState(
      emotionalType: emotionalType ?? this.emotionalType,
      todaysQuote: todaysQuote ?? this.todaysQuote,
      likedQuotes: likedQuotes ?? this.likedQuotes,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'emotionalType': this.emotionalType,
      'todaysQuote': this.todaysQuote,
      'likedQuotes': this.likedQuotes,
    };
  }

  factory HomePageViewState.fromMap(Map<String, dynamic> map) {
    return HomePageViewState(
      emotionalType: map['emotionalType'] as EmotionalType,
      todaysQuote: map['todaysQuote'] as TodaysQuote,
      likedQuotes: map['likedQuotes'] as List<Quote>,
    );
  }

//</editor-fold>
}

extension Computed on HomePageViewState {
  bool get isButtonEnable => emotionalType != null && todaysQuote != null;
  bool get isLikedQuoted => likedQuotes?.contains(todaysQuote?.quote) ?? false;
}
