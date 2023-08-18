import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../repository/like_quote_repository.dart';
import '../repository/quote_repository.dart';
import 'isar_provider.dart';

part 'like_quote_repository_provider.g.dart';

@Riverpod(keepAlive: true)
Future<LikeQuoteRepository> likeQuoteRepository(
    LikeQuoteRepositoryRef likeQuoteRepositoryRef) async {
  final isar = await likeQuoteRepositoryRef.watch(isarProvider.future);
  return LikeQuoteRepository(isar);
}
