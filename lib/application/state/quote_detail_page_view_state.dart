import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../../domain/collection/quote.dart';

class QuoteDetailPageViewState {
  final Quote quote;
  final bool isLiked;
  final BannerAd? bannerAd;
  final bool isPremium;

//<editor-fold desc="Data Methods">
  const QuoteDetailPageViewState({
    required this.quote,
    required this.isLiked,
    this.bannerAd,
    required this.isPremium,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is QuoteDetailPageViewState &&
          runtimeType == other.runtimeType &&
          quote == other.quote &&
          isLiked == other.isLiked &&
          bannerAd == other.bannerAd &&
          isPremium == other.isPremium);

  @override
  int get hashCode =>
      quote.hashCode ^
      isLiked.hashCode ^
      bannerAd.hashCode ^
      isPremium.hashCode;

  @override
  String toString() {
    return 'QuoteDetailPageViewState{ quote: $quote, isLiked: $isLiked, bannerAd: $bannerAd, isPremium: $isPremium,}';
  }

  QuoteDetailPageViewState copyWith({
    Quote? quote,
    bool? isLiked,
    BannerAd? bannerAd,
    bool? isPremium,
  }) {
    return QuoteDetailPageViewState(
      quote: quote ?? this.quote,
      isLiked: isLiked ?? this.isLiked,
      bannerAd: bannerAd ?? this.bannerAd,
      isPremium: isPremium ?? this.isPremium,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'quote': this.quote,
      'isLiked': this.isLiked,
      'bannerAd': this.bannerAd,
      'isPremium': this.isPremium,
    };
  }

  factory QuoteDetailPageViewState.fromMap(Map<String, dynamic> map) {
    return QuoteDetailPageViewState(
      quote: map['quote'] as Quote,
      isLiked: map['isLiked'] as bool,
      bannerAd: map['bannerAd'] as BannerAd,
      isPremium: map['isPremium'] as bool,
    );
  }

//</editor-fold>
}
