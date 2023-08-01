import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/state/category_type.dart';

part 'category_type_list_controller.g.dart';

@Riverpod(keepAlive: true)
class CategoryTypeListController extends _$CategoryTypeListController {
  @override
  List<CategoryType> build() => [CategoryType.life];

  void saveValue(CategoryType value) {
    if (state.contains(value)) {
      state = [
        for (final type in state)
          if (type != value) type,
      ];
    } else {
      state = [...state, value];
    }
  }
}
