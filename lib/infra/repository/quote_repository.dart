import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:isar/isar.dart';
import 'package:meigen_finder/domain/state/category_type.dart';
import 'package:meigen_finder/domain/state/quote.dart';

class QuoteRepository {
  QuoteRepository(this._isar);

  final Isar _isar;

  // マスターデータの投入
  // Future<void> insertMasterData() async {
  //   final bytes = await rootBundle.load('assets/master_data/quotes.json');
  //   final jsonStr = const Utf8Decoder().convert(bytes.buffer.asUint8List());
  //   final json = jsonDecode(jsonStr) as List;
  // }

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
      final category = CategoryType.values.byName(e['category']);
      return Quote()
        ..id = e['id']
        ..author = e['author']
        ..categoryType = category
        ..quote = e['text'];
    }).toList();
    return quotes;
  }

  // TODO:名言のお気に入り機能をかく
  // TODO:名言の追加機能を書く
}
