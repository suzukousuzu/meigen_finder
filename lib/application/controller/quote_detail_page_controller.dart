import 'package:flutter/cupertino.dart';
import 'package:meigen_finder/application/state/quote_detail_view_state.dart';
import 'package:meigen_finder/domain/collection/quote.dart';
import 'package:meigen_finder/domain/collection/todays_quote.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../infra/providers/quote_repository_provider.dart';

part 'quote_detail_page_controller.g.dart';

@immutable
class QuoteDetailArgument {
  final TodaysQuote todaysQuote;
  final bool isLiked;

  const QuoteDetailArgument(this.todaysQuote, this.isLiked);
}

@riverpod
class QuoteDetailController extends _$QuoteDetailController {
  @override
  QuoteDetailViewState build(QuoteDetailArgument quoteDetailArgument) =>
      QuoteDetailViewState(
          todaysQuote: quoteDetailArgument.todaysQuote,
          isLiked: quoteDetailArgument.isLiked);

  Future<void> like(Quote quote, bool isLiked) async {
    try {
      final repository = await ref.read(quoteRepositoryProvider.future);
      await repository.like(quote);
      state = state.copyWith(isLiked: !isLiked);
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
