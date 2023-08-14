import 'package:isar/isar.dart';
import 'package:meigen_finder/domain/collection/emotional_type.dart';

part 'quote.g.dart';

@embedded
class Quote {
  late int id;
  @Enumerated(EnumType.ordinal)
  late EmotionalType emotionalType;

  /// 著者
  String? author;

  /// 名言
  late String text;
}
