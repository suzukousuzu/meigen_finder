import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data_holder/like_quote_data_holder.dart';
import '../repository/like_quote_repository.dart';
import 'isar_provider.dart';

part 'like_quote_repository_provider.g.dart';

@Riverpod(keepAlive: true)
Future<LikeQuoteRepository> likeQuoteRepository(
    LikeQuoteRepositoryRef ref) async {
  final isar = await ref.watch(isarProvider.future);
  final likeQuotesHolder = ref.watch(likeQuotesHolderProvider);
  return LikeQuoteRepository(isar, likeQuotesHolder);
}
