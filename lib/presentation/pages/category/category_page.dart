import 'package:flutter/material.dart';
import 'package:meigen_finder/presentation/components/app_bar/mf_sliver_app_bar.dart';
import 'package:meigen_finder/presentation/components/button/primary_button.dart';
import 'package:meigen_finder/presentation/theme/mf_theme.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _AppBar(),
          _Button(),
        ],
      ),
    );
  }
}

class _AppBar extends StatelessWidget {
  const _AppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = MfTheme.of(context);
    final textTheme = theme.textTheme;
    return const MfSliverAppBar(
      title: 'カテゴリ',
    );
  }
}

class _Button extends StatelessWidget {
  const _Button({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
        sliver: SliverToBoxAdapter(
          child: PrimaryButton(
            label: '名言を作成する',
            onPressed: () {},
          ),
        ));
  }
}
