import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../repository/quote_repository.dart';
import 'isar_provider.dart';

part 'quote_repository_provider.g.dart';

@Riverpod(keepAlive: true)
Future<QuoteRepository> quoteRepository(
    QuoteRepositoryRef quoteRepositoryRef) async {
  final isar = await quoteRepositoryRef.watch(isarProvider.future);
  return QuoteRepository(isar);
}
