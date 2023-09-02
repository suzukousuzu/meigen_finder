import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:meigen_finder/domain/collection/emotional_type.dart';
import 'package:meigen_finder/domain/collection/todays_quote.dart';

import '../../domain/collection/quote.dart';

class HomePageViewState {
  EmotionalType? emotionalType;
  TodaysQuote? todaysQuote;
  List<Quote>? likedQuotes;
  DateTime? lastDateUpdatedTodayQuote;
  bool quoteRetrievalSuccess;
  BannerAd? bannerAd;

//<editor-fold desc="Data Methods">
  HomePageViewState({
    this.emotionalType,
    this.todaysQuote,
    this.likedQuotes,
    this.lastDateUpdatedTodayQuote,
    required this.quoteRetrievalSuccess,
    this.bannerAd,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HomePageViewState &&
          runtimeType == other.runtimeType &&
          emotionalType == other.emotionalType &&
          todaysQuote == other.todaysQuote &&
          likedQuotes == other.likedQuotes &&
          lastDateUpdatedTodayQuote == other.lastDateUpdatedTodayQuote &&
          quoteRetrievalSuccess == other.quoteRetrievalSuccess &&
          bannerAd == other.bannerAd);

  @override
  int get hashCode =>
      emotionalType.hashCode ^
      todaysQuote.hashCode ^
      likedQuotes.hashCode ^
      lastDateUpdatedTodayQuote.hashCode ^
      quoteRetrievalSuccess.hashCode ^
      bannerAd.hashCode;

  @override
  String toString() {
    return 'HomePageViewState{' +
        ' emotionalType: $emotionalType,' +
        ' todaysQuote: $todaysQuote,' +
        ' likedQuotes: $likedQuotes,' +
        ' lastDateUpdatedTodayQuote: $lastDateUpdatedTodayQuote,' +
        ' quoteRetrievalSuccess: $quoteRetrievalSuccess,' +
        ' bannerAd: $bannerAd,' +
        '}';
  }

  HomePageViewState copyWith({
    EmotionalType? emotionalType,
    TodaysQuote? todaysQuote,
    List<Quote>? likedQuotes,
    DateTime? lastDateUpdatedTodayQuote,
    bool? quoteRetrievalSuccess,
    BannerAd? bannerAd,
  }) {
    return HomePageViewState(
      emotionalType: emotionalType ?? this.emotionalType,
      todaysQuote: todaysQuote ?? this.todaysQuote,
      likedQuotes: likedQuotes ?? this.likedQuotes,
      lastDateUpdatedTodayQuote:
          lastDateUpdatedTodayQuote ?? this.lastDateUpdatedTodayQuote,
      quoteRetrievalSuccess:
          quoteRetrievalSuccess ?? this.quoteRetrievalSuccess,
      bannerAd: bannerAd ?? this.bannerAd,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'emotionalType': this.emotionalType,
      'todaysQuote': this.todaysQuote,
      'likedQuotes': this.likedQuotes,
      'lastDateUpdatedTodayQuote': this.lastDateUpdatedTodayQuote,
      'quoteRetrievalSuccess': this.quoteRetrievalSuccess,
      'bannerAd': this.bannerAd,
    };
  }

  factory HomePageViewState.fromMap(Map<String, dynamic> map) {
    return HomePageViewState(
      emotionalType: map['emotionalType'] as EmotionalType,
      todaysQuote: map['todaysQuote'] as TodaysQuote,
      likedQuotes: map['likedQuotes'] as List<Quote>,
      lastDateUpdatedTodayQuote: map['lastDateUpdatedTodayQuote'] as DateTime,
      quoteRetrievalSuccess: map['quoteRetrievalSuccess'] as bool,
      bannerAd: map['bannerAd'] as BannerAd,
    );
  }

//</editor-fold>
}

extension Computed on HomePageViewState {
  bool get isButtonEnable => emotionalType != null;
  bool get isLikedQuoted {
    final likedQuoteTexts = likedQuotes?.map((e) => e.text).toList();
    final todaysQuoteTexts = todaysQuote?.quote.text;
    return likedQuoteTexts?.contains(todaysQuoteTexts) ?? false;
  }

  bool get canRetrieveQuoteToday {
    return lastDateUpdatedTodayQuote == null ||
        DateTime.now().day != lastDateUpdatedTodayQuote?.day;
  }
}
