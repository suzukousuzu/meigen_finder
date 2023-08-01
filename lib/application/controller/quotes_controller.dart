import 'dart:math';

import 'package:meigen_finder/domain/state/category_type.dart';
import 'package:meigen_finder/infra/providers/quote_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/state/quote.dart';

part 'quotes_controller.g.dart';

@riverpod
class QuotesController extends _$QuotesController {
  @override
  Future<List<Quote>> build() {
    final quotes = _init();

    return quotes;
  }

  Future<List<Quote>> _init() async {
    final repository = await ref.read(quoteRepositoryProvider.future);
    final allQuotes = await repository.getMasterData();
    final favoriteQuotes = await repository.fetchFavoriteQuote();
    final quotes = allQuotes.map((e) {
      final isFavorite = favoriteQuotes.any((element) {
        return element.id == e.id;
      });
      return e.copyWith(isFavorite: isFavorite);
    }).toList();

    final random = Random();
    quotes.shuffle(random);

    return quotes;
  }

  void sortCategory(List<CategoryType> selectedCategoryTypes) {
    final sortedQuotes = state.value?.where((quote) {
      return selectedCategoryTypes.contains(quote.categoryType);
    }).toList();
    state = AsyncData(sortedQuotes ?? []);
  }

  Future<void> like(Quote quote) async {
    final displayQuote = state.value?.firstWhere((element) {
      return element.id == quote.id;
    });
    final updatedQuote = quote.copyWith(isFavorite: !quote.isFavorite);

    state = await AsyncValue.guard(() async {
      final repository = await ref.read(quoteRepositoryProvider.future);
      await repository.like(updatedQuote);
      return state.value!.map((quote) {
        if (quote.id == displayQuote?.id) {
          return updatedQuote;
        }
        return quote;
      }).toList();
    });
  }
}
