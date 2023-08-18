import 'package:meigen_finder/infra/providers/like_quote_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/collection/quote.dart';
import '../state/favorite_quote_page_view_state.dart';

part 'favorite_quote_page_controller.g.dart';

@riverpod
class FavoriteQuotePageController extends _$FavoriteQuotePageController {
  @override
  FavoriteQuotePageViewState build() => const FavoriteQuotePageViewState();

  List<Quote> _completeQuotes = [];

  Future<void> fetchLikeQuotes() async {
    final repository = await ref.read(likeQuoteRepositoryProvider.future);
    final likeQuotes = await repository.fetchLikeQuotes();
    _completeQuotes = likeQuotes;
    state = state.copyWith(likedQuotes: likeQuotes);
  }

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
