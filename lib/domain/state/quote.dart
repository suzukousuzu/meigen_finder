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

  /// お気に入り
  bool isFavorite = false;

  Quote copyWith({
    Id? id,
    CategoryType? categoryType,
    String? author,
    String? quote,
    bool? isFavorite,
  }) {
    return Quote()
      ..id = id ?? this.id
      ..categoryType = categoryType ?? this.categoryType
      ..author = author ?? this.author
      ..quote = quote ?? this.quote
      ..isFavorite = isFavorite ?? this.isFavorite;
  }
}
