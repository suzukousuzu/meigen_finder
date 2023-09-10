import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../../domain/collection/quote.dart';

class QuoteDetailPageViewState {
  final Quote quote;
  final bool isLiked;
  final BannerAd? bannerAd;

//<editor-fold desc="Data Methods">
  const QuoteDetailPageViewState({
    required this.quote,
    required this.isLiked,
    this.bannerAd,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is QuoteDetailPageViewState &&
          runtimeType == other.runtimeType &&
          quote == other.quote &&
          isLiked == other.isLiked &&
          bannerAd == other.bannerAd);

  @override
  int get hashCode => quote.hashCode ^ isLiked.hashCode ^ bannerAd.hashCode;

  @override
  String toString() {
    return 'QuoteDetailPageViewState{ quote: $quote, isLiked: $isLiked, bannerAd: $bannerAd,}';
  }

  QuoteDetailPageViewState copyWith({
    Quote? quote,
    bool? isLiked,
    BannerAd? bannerAd,
  }) {
    return QuoteDetailPageViewState(
      quote: quote ?? this.quote,
      isLiked: isLiked ?? this.isLiked,
      bannerAd: bannerAd ?? this.bannerAd,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'quote': this.quote,
      'isLiked': this.isLiked,
      'bannerAd': this.bannerAd,
    };
  }

  factory QuoteDetailPageViewState.fromMap(Map<String, dynamic> map) {
    return QuoteDetailPageViewState(
      quote: map['quote'] as Quote,
      isLiked: map['isLiked'] as bool,
      bannerAd: map['bannerAd'] as BannerAd,
    );
  }

//</editor-fold>
}
