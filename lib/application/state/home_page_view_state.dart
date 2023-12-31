import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:meigen_finder/domain/collection/emotional_type.dart';
import 'package:meigen_finder/domain/collection/todays_quote.dart';

import '../../domain/collection/quote.dart';

class TodayQuoteResult {
  final TodaysQuote? todaysQuote;
  final bool quoteRetrievalSuccess;

  TodayQuoteResult(this.todaysQuote, this.quoteRetrievalSuccess);

  TodayQuoteResult copyWith({
    TodaysQuote? todaysQuote,
    bool? quoteRetrievalSuccess,
  }) {
    return TodayQuoteResult(
      todaysQuote ?? this.todaysQuote,
      quoteRetrievalSuccess ?? this.quoteRetrievalSuccess,
    );
  }
}

class HomePageViewState {
  EmotionalType? emotionalType;
  TodayQuoteResult? todayQuoteResult;
  List<Quote>? likedQuotes;
  DateTime? lastDateUpdatedTodayQuote;
  BannerAd? bannerAd;
  bool isPremium;
  int todaysQuoteDisplayCount;
  bool shouldShowReviewDialog;

//<editor-fold desc="Data Methods">
  HomePageViewState({
    this.emotionalType,
    this.todayQuoteResult,
    this.likedQuotes,
    this.lastDateUpdatedTodayQuote,
    this.bannerAd,
    required this.isPremium,
    required this.todaysQuoteDisplayCount,
    required this.shouldShowReviewDialog,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HomePageViewState &&
          runtimeType == other.runtimeType &&
          emotionalType == other.emotionalType &&
          todayQuoteResult == other.todayQuoteResult &&
          likedQuotes == other.likedQuotes &&
          lastDateUpdatedTodayQuote == other.lastDateUpdatedTodayQuote &&
          bannerAd == other.bannerAd &&
          isPremium == other.isPremium &&
          todaysQuoteDisplayCount == other.todaysQuoteDisplayCount &&
          shouldShowReviewDialog == other.shouldShowReviewDialog);

  @override
  int get hashCode =>
      emotionalType.hashCode ^
      todayQuoteResult.hashCode ^
      likedQuotes.hashCode ^
      lastDateUpdatedTodayQuote.hashCode ^
      bannerAd.hashCode ^
      isPremium.hashCode ^
      todaysQuoteDisplayCount.hashCode ^
      shouldShowReviewDialog.hashCode;

  @override
  String toString() {
    return 'HomePageViewState{ emotionalType: $emotionalType, todayQuoteResult: $todayQuoteResult, likedQuotes: $likedQuotes, lastDateUpdatedTodayQuote: $lastDateUpdatedTodayQuote, bannerAd: $bannerAd, isPremium: $isPremium, todaysQuoteDisplayCount: $todaysQuoteDisplayCount, shouldShowReviewDialog: $shouldShowReviewDialog,}';
  }

  HomePageViewState copyWith({
    EmotionalType? emotionalType,
    TodayQuoteResult? todayQuoteResult,
    List<Quote>? likedQuotes,
    DateTime? lastDateUpdatedTodayQuote,
    BannerAd? bannerAd,
    bool? isPremium,
    int? todaysQuoteDisplayCount,
    bool? shouldShowReviewDialog,
  }) {
    return HomePageViewState(
      emotionalType: emotionalType ?? this.emotionalType,
      todayQuoteResult: todayQuoteResult ?? this.todayQuoteResult,
      likedQuotes: likedQuotes ?? this.likedQuotes,
      lastDateUpdatedTodayQuote:
          lastDateUpdatedTodayQuote ?? this.lastDateUpdatedTodayQuote,
      bannerAd: bannerAd ?? this.bannerAd,
      isPremium: isPremium ?? this.isPremium,
      todaysQuoteDisplayCount:
          todaysQuoteDisplayCount ?? this.todaysQuoteDisplayCount,
      shouldShowReviewDialog:
          shouldShowReviewDialog ?? this.shouldShowReviewDialog,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'emotionalType': this.emotionalType,
      'todayQuoteResult': this.todayQuoteResult,
      'likedQuotes': this.likedQuotes,
      'lastDateUpdatedTodayQuote': this.lastDateUpdatedTodayQuote,
      'bannerAd': this.bannerAd,
      'isPremium': this.isPremium,
      'todaysQuoteDisplayCount': this.todaysQuoteDisplayCount,
      'shouldShowReviewDialog': this.shouldShowReviewDialog,
    };
  }

  factory HomePageViewState.fromMap(Map<String, dynamic> map) {
    return HomePageViewState(
      emotionalType: map['emotionalType'] as EmotionalType,
      todayQuoteResult: map['todayQuoteResult'] as TodayQuoteResult,
      likedQuotes: map['likedQuotes'] as List<Quote>,
      lastDateUpdatedTodayQuote: map['lastDateUpdatedTodayQuote'] as DateTime,
      bannerAd: map['bannerAd'] as BannerAd,
      isPremium: map['isPremium'] as bool,
      todaysQuoteDisplayCount: map['todaysQuoteDisplayCount'] as int,
      shouldShowReviewDialog: map['shouldShowReviewDialog'] as bool,
    );
  }

//</editor-fold>
}

extension Computed on HomePageViewState {
  bool get isButtonEnable => emotionalType != null;
  bool get isLikedQuoted {
    final likedQuoteTexts = likedQuotes?.map((e) => e.text).toList();
    final todaysQuoteTexts = todayQuoteResult?.todaysQuote?.quote.text;
    return likedQuoteTexts?.contains(todaysQuoteTexts) ?? false;
  }

  bool get canRetrieveQuoteToday {
    return lastDateUpdatedTodayQuote == null ||
        DateTime.now().day != lastDateUpdatedTodayQuote?.day;
  }
}
