import 'package:isar/isar.dart';
import 'package:meigen_finder/domain/collection/like_quote.dart';

import '../../domain/collection/quote.dart';
import '../data_holder/cache.dart';

class LikeQuoteRepository {
  LikeQuoteRepository(this._isar);

  final Isar _isar;
  final Cache<List<Quote>> _quoteCache = Cache<List<Quote>>();

  // 名言のお気に入り
  Future<void> like(Quote quote) async {
    await _isar.writeTxn(() async {
      final likeQuote = LikeQuote()
        ..id = quote.id
        ..likeQuotes = quote;
      await _isar.likeQuotes.put(likeQuote);
    });
  }

  Future<void> unLike(Quote quote) async {
    await _isar.writeTxn(() async {
      await _isar.likeQuotes.delete(quote.id);
    });
  }

  Future<List<Quote>> fetchLikeQuotes() async {
    // キャッシュが存在する場合、それを返す
    if (_quoteCache.hasValue) {
      return _quoteCache.value;
    }
    final query = _isar.likeQuotes.where().build();
    final results = await query.findAll();
    final quotes = results.map((e) => e.likeQuotes).toList();

    // キャッシュに保存
    _quoteCache.add(quotes);
    return quotes;
  }

// TODO:名言の追加機能を書く
}
