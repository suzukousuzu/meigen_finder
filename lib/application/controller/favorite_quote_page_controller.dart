import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../infra/providers/quote_repository_provider.dart';
import '../state/favorite_quote_page_view_state.dart';

part 'favorite_quote_page_controller.g.dart';

@riverpod
class FavoriteQuotePageController extends _$FavoriteQuotePageController {
  @override
  FavoriteQuotePageViewState build() => const FavoriteQuotePageViewState();

  Future<void> fetchLikeQuotes() async {
    final repository = await ref.read(quoteRepositoryProvider.future);
    final likeQuotes = await repository.fetchLikeQuotes();
    state = state.copyWith(likedQuotes: likeQuotes);
  }
}
