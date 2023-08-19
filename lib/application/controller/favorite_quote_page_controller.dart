import 'package:meigen_finder/infra/data_holder/like_quote_data_holder.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/collection/quote.dart';
import '../state/favorite_quote_page_view_state.dart';

part 'favorite_quote_page_controller.g.dart';

@riverpod
class FavoriteQuotePageController extends _$FavoriteQuotePageController {
  @override
  FavoriteQuotePageViewState build() {
    final likeQuotesDataHolder = ref.watch(likeQuotesHolderProvider);
    likeQuotesDataHolder.stream.listen((event) {
      _completeQuotes = event ?? [];
      state = state.copyWith(likedQuotes: event);
    });
    return const FavoriteQuotePageViewState();
  }

  List<Quote> _completeQuotes = [];

  void searchFavoriteQuote(String value) {
    onClear();
    final searchResult = state.likedQuotes?.where((element) {
      final text = element.text;
      final author = element.author;
      if (author == null) {
        return text.contains(value);
      }
      return text.contains(value) || author.contains(value);
    }).toList();

    state = state.copyWith(likedQuotes: searchResult);
  }

  void onClear() {
    state = state.copyWith(likedQuotes: _completeQuotes);
  }
}
