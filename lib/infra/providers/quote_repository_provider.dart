import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../manager/preference_manager.dart';
import '../repository/quote_repository.dart';
import 'isar_provider.dart';

part 'quote_repository_provider.g.dart';

@Riverpod(keepAlive: true)
Future<QuoteRepository> quoteRepository(QuoteRepositoryRef ref) async {
  final isar = await ref.watch(isarProvider.future);
  final sharedPreference = ref.read(preferenceManagerProvider);
  return QuoteRepository(isar, sharedPreference);
}
