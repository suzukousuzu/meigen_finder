import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meigen_finder/application/controller/category_type_list_controller.dart';
import 'package:meigen_finder/domain/state/category_type.dart';
import 'package:meigen_finder/presentation/components/background/background_image.dart';
import 'package:meigen_finder/presentation/routing/router.dart';
import 'package:meigen_finder/presentation/theme/mf_theme.dart';
import 'package:meigen_finder/util/extension/category_type_extension.dart';

import '../../../application/controller/quotes_controller.dart';
import '../../../domain/state/quote.dart';
import '../../../gen/assets.gen.dart';
import '../../components/swipe/swipe_container.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = MfTheme.of(context);
    final colorScheme = theme.colorScheme;

    final quotesAsyncValue = ref.watch(quotesControllerProvider);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: colorScheme.transParent,
      ),
      body: quotesAsyncValue.maybeWhen(orElse: () {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }, data: (quotes) {
        return Stack(
          children: [
            SwipeContainer(
                itemCount: quotes.length,
                itemBuilder: (context, index) {
                  return BackgroundImage(
                    // TODO:カテゴリによって、背景画像を切り替える
                    image: Assets.images.space.image().image,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        _MeigenText(
                            text: quotes[index].quote,
                            author: quotes[index].author ?? ''),
                        _ShareAndLike(
                          quote: quotes[index],
                        ),
                      ],
                    ),
                  );
                }),
            _BottomButtons(),
          ],
        );
      }),
    );
  }
}

class _MeigenText extends StatelessWidget {
  const _MeigenText({
    Key? key,
    required this.text,
    required this.author,
  }) : super(key: key);
  final String text;
  final String author;

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
            '-$author',
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

class _ShareAndLike extends ConsumerWidget {
  const _ShareAndLike({Key? key, required this.quote}) : super(key: key);
  final Quote quote;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
              ref.read(quotesControllerProvider.notifier).like(quote);
            },
            icon: Icon(
              quote.isFavorite
                  ? FontAwesomeIcons.solidHeart
                  : FontAwesomeIcons.heart,
              size: 32,
              color: colorScheme.onBackground,
            ),
          )
        ],
      ),
    );
  }
}

class _BottomButtons extends ConsumerWidget {
  const _BottomButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoryTypeList = ref.watch(categoryTypeListControllerProvider);
    final theme = MfTheme.of(context);
    final colorScheme = theme.colorScheme;
    final bottomPadding = MediaQuery.of(context).padding.bottom;
    final categoryList = categoryTypeList.value ?? [CategoryType.life];
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
                  categoryList.length >= 2
                      ? 'ミックス'
                      : categoryList[0].categoryText,
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
