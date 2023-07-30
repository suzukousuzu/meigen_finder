import 'package:meigen_finder/infra/providers/quote_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/state/quote.dart';

part 'quote_controller.g.dart';

@riverpod
class QuoteController extends _$QuoteController {
  @override
  Future<List<Quote>> build() {
    final quote = _fetchQuote();
    return quote;
  }

  Future<List<Quote>> _fetchQuote() async {
    final repository = await ref.watch(quoteRepositoryProvider.future);
    final quotes = repository.getMasterData();
    return quotes;
  }
}
