import 'package:flutter/cupertino.dart';
import 'package:meigen_finder/domain/collection/quote.dart';
import 'package:meigen_finder/infra/providers/like_quote_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../infra/manager/ad_manager.dart';
import '../state/quote_detail_page_view_state.dart';

part 'quote_detail_page_controller.g.dart';

@immutable
class QuoteDetailArgument {
  final Quote quote;
  final bool isLiked;

  const QuoteDetailArgument(this.quote, this.isLiked);
}

@riverpod
class QuoteDetailController extends _$QuoteDetailController {
  @override
  QuoteDetailPageViewState build(QuoteDetailArgument quoteDetailArgument) =>
      QuoteDetailPageViewState(
          quote: quoteDetailArgument.quote,
          isLiked: quoteDetailArgument.isLiked);

  Future<void> like(Quote quote, bool isLiked) async {
    try {
      final repository = await ref.read(likeQuoteRepositoryProvider.future);
      if (isLiked) {
        await repository.unLike(quote);
      } else {
        await repository.like(quote);
      }
      state = state.copyWith(isLiked: !isLiked);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void fetchBannerAd() {
    final adManager = ref.read(adManagerProvider);
    //「This AdWidget is already in the Widget tree」というエラーがでるので、再度bannerIdを初期化する
    adManager.initBannerAd();
    adManager.loadBannerAd();
    final bannerAd = adManager.bannerAd;
    state = state.copyWith(bannerAd: bannerAd);
  }
}
