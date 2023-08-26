import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:isar/isar.dart';
import 'package:meigen_finder/domain/collection/todays_quote.dart';
import 'package:meigen_finder/util/datetime_extension.dart';

import '../../domain/collection/emotional_type.dart';
import '../../domain/collection/quote.dart';
import '../preference/preference_manager.dart';

class QuoteRepository {
  QuoteRepository(this._isar, this._preferenceManager);

  final Isar _isar;
  final PreferenceManager _preferenceManager;

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

  Future<TodaysQuote?> fetchTodayQuote() async {
    final todayQuote = await _isar.todaysQuotes
        .filter()
        .createdAtEqualTo(DateTime.now().date)
        .findAll();
    return todayQuote.firstOrNull;
  }

  Future<void> onUpdateTodayQuote(
      TodaysQuote todaysQuote, EmotionalType emotionalType) async {
    await _isar.writeTxn(() async {
      await _isar.todaysQuotes.put(todaysQuote);
      final now = DateTime.now().date;
      _preferenceManager.setValue(
          PreferenceKey.todayQuotes, now.toIso8601String());
    });
  }

  Future<List<TodaysQuote>> fetchHistory() async {
    final query = _isar.todaysQuotes.where().build();
    final results = await query.findAll();
    return results;
  }
}
