import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:isar/isar.dart';
import 'package:meigen_finder/domain/collection/like_quote.dart';
import 'package:meigen_finder/domain/collection/todays_quote.dart';

import '../../domain/collection/emotional_type.dart';
import '../../domain/collection/quote.dart';

class QuoteRepository {
  QuoteRepository(this._isar);

  final Isar _isar;

  // 全ての名言を返す(変更があれば通知される)
  // Stream<List<Quote>> watchAll() async* {
  //   final query = _isar.quotes.buildQuery();
  //   await for (final results in query.watch(fireImmediately: true)) {
  //     if (results.isNotEmpty) {
  //       for (final quote in results) {
  //         await quote.category.load();
  //       }
  //       yield results.cast<Quote>();
  //     } else {
  //       yield [];
  //     }
  //   }
  // }

  // マスターデータを取得する
  Future<List<Quote>> getMasterData() async {
    final bytes = await rootBundle.load('assets/master_data/quotes.json');
    final jsonStr = const Utf8Decoder().convert(bytes.buffer.asUint8List());
    final json = jsonDecode(jsonStr) as List;
    final quotes = json.map((e) {
      final category = EmotionalType.values.byName(e['category']);
      return Quote()
        ..id = e['id']
        ..author = e['author']
        ..emotionalType = category
        ..text = e['text'];
    }).toList();
    return quotes;
  }

  // お気に入りの名言を返す
  Future<List<Quote>> fetchFavoriteQuote() async {
    return [];
    // final query = _isar.quotes.where().filter().isFavoriteEqualTo(true).build();
    // final results = await query.findAll();
    // return results;
  }

  // 名言のお気に入り
  Future<void> like(Quote quote) async {
    await _isar.writeTxn(() async {
      final likeQuote = LikeQuote()
        ..id = quote.id
        ..likeQuotes = quote;
      await _isar.likeQuotes.put(likeQuote);
    });
  }

  // // カテゴリのリストを保存する機能
  // Future<void> saveCategoryList(List<CategoryType> categoryList) async {
  //   // final categories = categoryList.map((e) {
  //   //   return Category()
  //   //     ..id = e.index
  //   //     ..categoryType = e;
  //   // }).toList();
  //   // await _isar.writeTxn(() async {
  //   //   final ids = await _isar.categorys.where().idProperty().findAll();
  //   //   if (ids.isNotEmpty) {
  //   //     await _isar.categorys.deleteAll(ids);
  //   //   }
  //   //   await _isar.categorys.putAll(categories);
  //   // });
  // }

  // Future<List<CategoryType>> fetchCategoryList() async {
  //   final query = _isar.categorys.where().build();
  //   final results = await query.findAll();
  //   return results.map((e) => e.categoryType).toList();
  // }

  Future<void> onUpdateTodayQuote(
      TodaysQuote todaysQuote, EmotionalType emotionalType) async {
    await _isar.writeTxn(() async {
      await _isar.todaysQuotes.put(todaysQuote);
    });
  }

  // TODO:名言の追加機能を書く
}
