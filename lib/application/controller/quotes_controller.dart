import 'dart:math';

import 'package:meigen_finder/infra/providers/quote_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/state/quote.dart';

part 'quotes_controller.g.dart';

@riverpod
class QuotesController extends _$QuotesController {
  @override
  Future<List<Quote>> build() {
    final quote = _fetchQuotes();
    // TODO:登録してあるカテゴリを取得する
    return quote;
  }

  Future<List<Quote>> _fetchQuotes() async {
    final repository = await ref.watch(quoteRepositoryProvider.future);
    final quotes = await repository.getMasterData();
    final random = Random();
    quotes.shuffle(random);
    return quotes;
  }
}
