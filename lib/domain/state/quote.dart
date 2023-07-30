import 'package:isar/isar.dart';

import 'category_type.dart';

part 'quote.g.dart';

@Collection()
class Quote {
  late Id id;

  @Enumerated(EnumType.ordinal)
  late CategoryType categoryType;

  /// 著者
  String? author;

  /// 名言
  late String quote;
}
