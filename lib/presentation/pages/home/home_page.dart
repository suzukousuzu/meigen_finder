import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meigen_finder/presentation/components/background/background_image.dart';
import 'package:meigen_finder/presentation/routing/router.dart';
import 'package:meigen_finder/presentation/theme/mf_theme.dart';

import '../../../gen/assets.gen.dart';
import '../swipe/swipe_container.dart';

// TODO:後で消す
const meigenList = ['aaaaaaaaaaa', 'bbbbbbbbbbbbb'];

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = MfTheme.of(context);
    final colorScheme = theme.colorScheme;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: colorScheme.transParent,
        actions: [
          IconButton(
            onPressed: () => const CategoryRoute().go(context),
            icon: Icon(
              FontAwesomeIcons.barsStaggered,
              size: 28,
              color: colorScheme.onBackground,
            ),
          ),
          IconButton(
            onPressed: () {
              // TODO:設定画面に遷移
            },
            icon: Icon(
              FontAwesomeIcons.gear,
              size: 28,
              color: colorScheme.onBackground,
            ),
          )
        ],
      ),
      body: SwipeContainer(
          // TODO:後でリストの数を入れる
          itemCount: meigenList.length,
          itemBuilder: (context, index) {
            return BackgroundImage(
              image: Assets.images.space.image().image,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _MeigenText(
                    text: meigenList[index],
                  ),
                  const _ShareAndLike(),
                ],
              ),
            );
          }),
    );
  }
}

class _MeigenText extends StatelessWidget {
  const _MeigenText({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    final theme = MfTheme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        children: [
          Text(
            text,
            textAlign: TextAlign.center,
            style: textTheme.h1.copyWith(
              color: colorScheme.secondary,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            '-オプラ・ウィンフリー',
            textAlign: TextAlign.center,
            style: textTheme.textBody.copyWith(
              color: colorScheme.secondary,
            ),
          ),
        ],
      ),
    );
  }
}

class _ShareAndLike extends StatelessWidget {
  const _ShareAndLike({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = MfTheme.of(context);
    final colorScheme = theme.colorScheme;
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {
              // TODO:名言をシェアする
            },
            icon: Icon(
              FontAwesomeIcons.arrowUpFromBracket,
              size: 32,
              color: colorScheme.onBackground,
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          IconButton(
            onPressed: () {
              // TODO:お気に入り機能
            },
            icon: Icon(
              FontAwesomeIcons.heart,
              size: 32,
              color: colorScheme.onBackground,
            ),
          )
        ],
      ),
    );
  }
}
