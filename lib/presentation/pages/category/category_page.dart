import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meigen_finder/application/controller/category_type_list_controller.dart';
import 'package:meigen_finder/application/controller/quotes_controller.dart';
import 'package:meigen_finder/presentation/components/app_bar/mf_sliver_app_bar.dart';
import 'package:meigen_finder/presentation/components/button/normal_button.dart';
import 'package:meigen_finder/presentation/components/button/primary_button.dart';

import '../../../domain/state/category_type.dart';
import '../../components/tile/category_tile.dart';
import '../../theme/mf_theme.dart';

class CategoryPage extends ConsumerWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoryTypes = ref.watch(categoryTypeListControllerProvider);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _AppBar(
            selectedCategoryTypes: categoryTypes,
          ),
          const _SearchMeigenButton(),
          const _CreateMeigenButton(),
          _CategoryTiles(
            selectedTypes: categoryTypes,
          ),
        ],
      ),
    );
  }
}

class _AppBar extends ConsumerWidget {
  const _AppBar({
    Key? key,
    required this.selectedCategoryTypes,
  }) : super(key: key);
  final List<CategoryType> selectedCategoryTypes;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = MfTheme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    return MfSliverAppBar(
      title: 'カテゴリ',
      trailing: TextButton(
          onPressed: () {
            ref
                .read(quotesControllerProvider.notifier)
                .sortCategory(selectedCategoryTypes);
            context.pop();
          },
          child: Text(
            '保存',
            style: textTheme.textBold.copyWith(
              color: colorScheme.onBackgroundBottomSheet,
            ),
          )),
    );
  }
}

class _CreateMeigenButton extends StatelessWidget {
  const _CreateMeigenButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
      sliver: SliverToBoxAdapter(
        child: NormalButton(
          label: '作成',
          onPressed: () {},
        ),
      ),
    );
  }
}

class _SearchMeigenButton extends StatelessWidget {
  const _SearchMeigenButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
      sliver: SliverToBoxAdapter(
        child: PrimaryButton(
          label: '検索',
          onPressed: () {},
        ),
      ),
    );
  }
}

class _CategoryTiles extends ConsumerWidget {
  const _CategoryTiles({
    Key? key,
    required this.selectedTypes,
  }) : super(key: key);
  final List<CategoryType> selectedTypes;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverPadding(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
      sliver: SliverGrid.count(
        crossAxisCount: 2,
        mainAxisSpacing: 12.0,
        crossAxisSpacing: 12.0,
        childAspectRatio: 4.0,
        children: <Widget>[
          ...CategoryType.values.map((type) {
            return CategoryTile(
              type: type,
              selectedTypes: selectedTypes,
              onChanged: (value) {
                ref
                    .read(categoryTypeListControllerProvider.notifier)
                    .saveValue(value);
              },
            );
          })
        ],
      ),
    );
  }
}
