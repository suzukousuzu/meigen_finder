import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meigen_finder/domain/collection/like_quote.dart';

import 'data_holder.dart';

final quoteHolderProvider = Provider((ref) {
  final quoteHolder = QuoteHolder();
  ref.onDispose(quoteHolder.dispose);
  return quoteHolder;
});

class QuoteHolder with DataHolder<LikeQuote> {}
