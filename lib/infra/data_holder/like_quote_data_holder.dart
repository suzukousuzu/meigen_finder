import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../domain/collection/quote.dart';
import 'data_holder.dart';

final likeQuotesHolderProvider = Provider((ref) {
  final likeQuotesHolder = LikeQuotesHolder();
  ref.onDispose(likeQuotesHolder.dispose);
  return likeQuotesHolder;
});

class LikeQuotesHolder with DataHolder<List<Quote>> {}
