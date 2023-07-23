import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meigen_finder/presentation/components/background/background_image.dart';
import 'package:meigen_finder/presentation/routing/router.dart';
import 'package:meigen_finder/presentation/theme/mf_theme.dart';

import '../../../gen/assets.gen.dart';
import '../swipe/swipe_container.dart';

// TODO:後で消す
const meigenList = ['aaaaaaaaaaagggggggggggggggggghhhhhhhh', 'bbbbbbbbbbbbb'];

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = MfTheme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: colorScheme.transParent,
      ),
      body: Stack(
        children: [
          SwipeContainer(
              // TODO:後でリストの数を入れる
              itemCount: meigenList.length,
              itemBuilder: (context, index) {
                return BackgroundImage(
                  // TODO:カテゴリによって、背景画像を切り替える
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
          const _BottomButtons(),
        ],
      ),
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

class _BottomButtons extends StatelessWidget {
  const _BottomButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = MfTheme.of(context);
    final colorScheme = theme.colorScheme;
    final bottomPadding = MediaQuery.of(context).padding.bottom;
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.fromLTRB(32, 0, 32, bottomPadding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () => const CategoryRoute().go(context),
                  icon: Icon(
                    FontAwesomeIcons.barsStaggered,
                    size: 28,
                    color: colorScheme.onBackground,
                  ),
                ),
                Text(
                  'カテゴリ',
                  style: theme.textTheme.subtext.copyWith(
                    color: colorScheme.onBackground,
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {
                    // TODO:設定画面に遷移
                  },
                  icon: Icon(
                    FontAwesomeIcons.gear,
                    size: 28,
                    color: colorScheme.onBackground,
                  ),
                ),
                Text(
                  '設定',
                  style: theme.textTheme.subtext.copyWith(
                    color: colorScheme.onBackground,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
