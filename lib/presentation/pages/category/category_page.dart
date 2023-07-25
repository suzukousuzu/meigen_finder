import 'package:flutter/material.dart';
import 'package:meigen_finder/presentation/components/app_bar/mf_sliver_app_bar.dart';
import 'package:meigen_finder/presentation/components/button/normal_button.dart';
import 'package:meigen_finder/presentation/components/button/primary_button.dart';

import '../../../domain/state/category_type.dart';
import '../../components/tile/category_tile.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _AppBar(),
          _SearchMeigenButton(),
          _CreateMeigenButton(),
          _CategoryTiles(),
        ],
      ),
    );
  }
}

class _AppBar extends StatelessWidget {
  const _AppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MfSliverAppBar(
      title: 'カテゴリ',
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

class _CategoryTiles extends StatelessWidget {
  const _CategoryTiles({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
      sliver: SliverGrid.count(
        crossAxisCount: 2,
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 10.0,
        childAspectRatio: 4.0,
        children: <Widget>[
          ...CategoryType.values.map((type) {
            return CategoryTile(
              type: type,
              onTap: () {
                // TODO:カテゴリタイルをタップした時の処理をかく
              },
            );
          })
        ],
      ),
    );
  }
}
