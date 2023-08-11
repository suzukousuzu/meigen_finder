import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/state/quote.dart';
import '../../infra/providers/quote_repository_provider.dart';

part 'quotes_service_provider.g.dart';

List<Quote> _completeQuotes = []; // 元のリストを保存する変数
List<Quote> get completeQuotes => _completeQuotes;

@riverpod
List<Quote> getCompleteQuotes(GetCompleteQuotesRef ref) {
  return _completeQuotes;
}

@riverpod
Future<List<Quote>> initialQuote(InitialQuoteRef ref) async {
  final repository = await ref.read(quoteRepositoryProvider.future);
  final allQuotes = await repository.getMasterData();
  final savedCategoryTypes = await repository.fetchCategoryList();
  final favoriteQuotes = await repository.fetchFavoriteQuote();

  // allQuotesとfavoriteQuotesでidが同じものはisFavoriteをtrueにする。
  final updatedQuotes = allQuotes.map((quote) {
    // favoriteQuotes内で一致するIDを持つquoteを探す
    if (favoriteQuotes.any((favQuote) => favQuote.id == quote.id)) {
      return quote.copyWith(isFavorite: true);
    }
    return quote;
  }).toList();

  final initialQuote = updatedQuotes.where((quote) {
    if (quote.isFavorite) {
      return updatedQuotes.contains(quote);
    } else {
      return savedCategoryTypes.contains(quote.categoryType);
    }
  }).toList();
  _completeQuotes = updatedQuotes;

  return initialQuote;
}

@riverpod
Future<void> like(LikeRef ref, Quote quote) async {
  final repository = await ref.read(quoteRepositoryProvider.future);
  await repository.like(quote);
}
