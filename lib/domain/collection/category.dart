import 'package:isar/isar.dart';

import 'category_type.dart';

part 'category.g.dart';

/// ユーザーに紐づくカテゴリを保存するためのコレクション
@Collection()
class Category {
  late Id id;
  @Enumerated(EnumType.ordinal)
  late CategoryType categoryType;
}
