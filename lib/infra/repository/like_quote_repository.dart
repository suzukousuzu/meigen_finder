import 'package:isar/isar.dart';
import 'package:meigen_finder/domain/collection/like_quote.dart';
import 'package:meigen_finder/infra/data_holder/like_quote_data_holder.dart';

import '../../domain/collection/quote.dart';

class LikeQuoteRepository {
  LikeQuoteRepository(this._isar, this.likeQuoteHolder);

  final Isar _isar;
  final LikeQuotesHolder likeQuoteHolder;

  // 名言のお気に入り
  Future<void> like(Quote quote) async {
    await _isar.writeTxn(() async {
      final likeQuote = LikeQuote()
        ..id = quote.id
        ..likeQuotes = quote;
      await _isar.likeQuotes.put(likeQuote);
    });
    // キャッシュを更新
    likeQuoteHolder.update(await fetchLikeQuotes());
  }

  Future<void> unLike(Quote quote) async {
    await _isar.writeTxn(() async {
      await _isar.likeQuotes.delete(quote.id);
    });
    // キャッシュを更新
    likeQuoteHolder.update(await fetchLikeQuotes());
  }

  Future<List<Quote>> fetchLikeQuotes() async {
    final query = _isar.likeQuotes.where().build();
    final results = await query.findAll();
    final quotes = results.map((e) => e.likeQuotes).toList();

    // キャッシュを更新
    likeQuoteHolder.update(quotes);
    return quotes;
  }

// TODO:名言の追加機能を書く
}
