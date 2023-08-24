import 'package:isar/isar.dart';
import 'package:meigen_finder/domain/collection/emotional_type.dart';
import 'package:meigen_finder/domain/collection/quote.dart';

part 'todays_quote.g.dart';

@Collection()
class TodaysQuote {
  late Id id;
  @Enumerated(EnumType.ordinal)
  late EmotionalType emotionalType;
  late Quote quote;
  @Index()
  late DateTime createdAt;
}

extension Computed on TodaysQuote {
  bool isLiked(List<Quote> likedQuotes) {
    return likedQuotes.any((element) => element.id == quote.id);
  }
}
