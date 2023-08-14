import 'package:flutter/foundation.dart';
import 'package:isar/isar.dart';
import 'package:meigen_finder/domain/collection/like_quote.dart';
import 'package:meigen_finder/domain/collection/todays_quote.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'isar_provider.g.dart';

@Riverpod(keepAlive: true)
Future<Isar> isar(IsarRef isarRef) async {
  var path = '';
  if (!kIsWeb) {
    final dir = await getApplicationSupportDirectory();
    path = dir.path;
  }

  final isar = await Isar.open(
    [
      LikeQuoteSchema,
      TodaysQuoteSchema,
    ],
    directory: path,
  );
  return isar;
}
