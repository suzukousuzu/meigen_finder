import 'package:isar/isar.dart';
import 'package:meigen_finder/domain/collection/quote.dart';

part 'like_quote.g.dart';

@Collection()
class LikeQuote {
  late Id id;
  late Quote likeQuotes;
}
