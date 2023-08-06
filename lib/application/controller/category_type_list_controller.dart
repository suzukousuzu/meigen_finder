import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/state/category_type.dart';
import '../../infra/providers/quote_repository_provider.dart';

part 'category_type_list_controller.g.dart';

@Riverpod(keepAlive: true)
class CategoryTypeListController extends _$CategoryTypeListController {
  @override
  Future<List<CategoryType>> build() async {
    final categoryTypeList = await _fetchCategoryList();
    return categoryTypeList;
  }

  Future<List<CategoryType>> _fetchCategoryList() async {
    final repository = await ref.read(quoteRepositoryProvider.future);
    final categoryList = await repository.fetchCategoryList();
    return categoryList.isEmpty ? [CategoryType.life] : categoryList;
  }

  Future<void> saveValue(CategoryType value) async {
    if (state.value!.contains(value)) {
      if (state.value!.length == 1) return;
      state = AsyncData([
        for (final type in state.value!)
          if (type != value) type,
      ]);
    } else {
      state = AsyncData([...state.value!, value]);
    }
    // ここでisarに保存する
    final repository = await ref.read(quoteRepositoryProvider.future);
    await repository.saveCategoryList(state.value!);
  }
}
