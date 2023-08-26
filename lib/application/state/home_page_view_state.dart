import 'package:meigen_finder/domain/collection/emotional_type.dart';
import 'package:meigen_finder/domain/collection/todays_quote.dart';

import '../../domain/collection/quote.dart';

class HomePageViewState {
  EmotionalType? emotionalType;
  TodaysQuote? todaysQuote;
  List<Quote>? likedQuotes;
  DateTime? lastDateUpdatedTodayQuote;

//<editor-fold desc="Data Methods">
  HomePageViewState({
    this.emotionalType,
    this.todaysQuote,
    this.likedQuotes,
    this.lastDateUpdatedTodayQuote,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HomePageViewState &&
          runtimeType == other.runtimeType &&
          emotionalType == other.emotionalType &&
          todaysQuote == other.todaysQuote &&
          likedQuotes == other.likedQuotes &&
          lastDateUpdatedTodayQuote == other.lastDateUpdatedTodayQuote);

  @override
  int get hashCode =>
      emotionalType.hashCode ^
      todaysQuote.hashCode ^
      likedQuotes.hashCode ^
      lastDateUpdatedTodayQuote.hashCode;

  @override
  String toString() {
    return 'HomePageViewState{ emotionalType: $emotionalType, todaysQuote: $todaysQuote, likedQuotes: $likedQuotes, lastDateUpdatedTodayQuote: $lastDateUpdatedTodayQuote,}';
  }

  HomePageViewState copyWith({
    EmotionalType? emotionalType,
    TodaysQuote? todaysQuote,
    List<Quote>? likedQuotes,
    DateTime? lastDateUpdatedTodayQuote,
    bool? isUpdatedTodayQuoteSuccessfully,
  }) {
    return HomePageViewState(
      emotionalType: emotionalType ?? this.emotionalType,
      todaysQuote: todaysQuote ?? this.todaysQuote,
      likedQuotes: likedQuotes ?? this.likedQuotes,
      lastDateUpdatedTodayQuote:
          lastDateUpdatedTodayQuote ?? this.lastDateUpdatedTodayQuote,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'emotionalType': emotionalType,
      'todaysQuote': todaysQuote,
      'likedQuotes': likedQuotes,
      'lastDateUpdatedTodayQuote': lastDateUpdatedTodayQuote,
    };
  }

  factory HomePageViewState.fromMap(Map<String, dynamic> map) {
    return HomePageViewState(
      emotionalType: map['emotionalType'] as EmotionalType,
      todaysQuote: map['todaysQuote'] as TodaysQuote,
      likedQuotes: map['likedQuotes'] as List<Quote>,
      lastDateUpdatedTodayQuote: map['lastDateUpdatedTodayQuote'] as DateTime,
    );
  }

//</editor-fold>
}

extension Computed on HomePageViewState {
  bool get isButtonEnable => emotionalType != null;
  bool get isLikedQuoted => likedQuotes?.contains(todaysQuote?.quote) ?? false;
  bool get canRetrieveQuoteToday {
    return lastDateUpdatedTodayQuote == null ||
        DateTime.now().day != lastDateUpdatedTodayQuote?.day;
  }
}
