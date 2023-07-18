import 'package:flutter/material.dart';
import 'package:meigen_finder/presentation/components/app_bar/mf_sliver_app_bar.dart';
import 'package:meigen_finder/presentation/theme/mf_theme.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _AppBar(),
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
    return MfSliverAppBar(
      title: ' ',
      trailing: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.add,
            color: Colors.black,
          )),
    );
  }
}

class _Button extends StatelessWidget {
  const _Button({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
