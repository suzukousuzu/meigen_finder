import 'dart:math';

import 'package:meigen_finder/application/service_provider/quotes_service_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/collection/category_type.dart';
import '../../domain/collection/quote.dart';

part 'quotes_controller.g.dart';

@riverpod
class QuotesController extends _$QuotesController {
  @override
  Future<List<Quote>> build() {
    final quotes = _fetchQuote();

    return quotes;
  }

  Future<List<Quote>> _fetchQuote() async {
    final initialQuote = await ref.read(initialQuoteProvider.future);

    final random = Random();
    initialQuote.shuffle(random);

    return initialQuote;
  }

  Future<void> sortCategory(List<CategoryType> selectedCategoryTypes) async {
    // final completeQuotes = ref.read(getCompleteQuotesProvider);
    // state = AsyncData(completeQuotes);
    // final sortedQuotes = state.value?.where((quote) {
    //   if (quote.isFavorite) {
    //     return state.value!.contains(quote);
    //   } else {
    //     return selectedCategoryTypes.contains(quote.categoryType);
    //   }
    // }).toList();
    // final random = Random();
    // sortedQuotes?.shuffle(random);
    //
    // state = AsyncData(sortedQuotes ?? []);
  }

  Future<void> like(Quote quote) async {
    // final displayQuote = state.value?.firstWhere((element) {
    //   return element.id == quote.id;
    // });
    // final updatedQuote = quote.copyWith(isFavorite: !quote.isFavorite);
    //
    // state = await AsyncValue.guard(() async {
    //   ref.read(likeProvider(quote));
    //   return state.value!.map((quote) {
    //     if (quote.id == displayQuote?.id) {
    //       return updatedQuote;
    //     }
    //     return quote;
    //   }).toList();
    // });
  }
}
