import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meigen_finder/presentation/components/button/primary_button.dart';
import 'package:meigen_finder/presentation/theme/mf_theme.dart';

import '../../../application/controller/premium_page_controller.dart';
import '../../../gen/assets.gen.dart';
import '../../components/loading/execute_while_loading.dart';
import '../../routing/router.dart';

class PremiumPage extends HookConsumerWidget {
  const PremiumPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = MfTheme.of(context);
    final colorScheme = theme.colorScheme;

    final controller = ref.watch(premiumPageControllerProvider.notifier);
    final viewState = ref.watch(premiumPageControllerProvider);

    final priceString = viewState.premiumPriceString;

    useEffect(() {
      Future(() => controller.fetch());
      return null;
    }, const []);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorScheme.transParent,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => context.pop(),
            icon: Icon(
              FontAwesomeIcons.xmark,
              size: 24,
              color: colorScheme.onBackground,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const _PromptText(),
                  const _Image(),
                  if (priceString.isNotEmpty) ...{
                    _DisplayPrice(priceString: priceString),
                  },
                ],
              ),
            ),
          ),
          _BottomButton(
            controller: controller,
            isPremium: viewState.isPremium,
          ),
        ],
      ),
    );
  }
}

class _Image extends StatelessWidget {
  const _Image({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      Assets.images.smileyFace,
      width: 240,
      height: 240,
    );
  }
}

class _PromptText extends StatelessWidget {
  const _PromptText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = MfTheme.of(context).textTheme;
    final colorScheme = MfTheme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 24, 20, 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '広告を削除',
            style: textTheme.h1.copyWith(
              color: colorScheme.superHappy,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            '誰にも邪魔されずに人生を\nもっともっと楽しんでいこう！！',
            textAlign: TextAlign.center,
            style: textTheme.textBold.copyWith(
              color: colorScheme.onBackground,
            ),
          ),
        ],
      ),
    );
  }
}

class _DisplayPrice extends StatelessWidget {
  const _DisplayPrice({
    Key? key,
    required this.priceString,
  }) : super(key: key);

  final String priceString;

  @override
  Widget build(BuildContext context) {
    final textTheme = MfTheme.of(context).textTheme;
    final colorScheme = MfTheme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 6),
              child: Text(
                '買い切り',
                style: textTheme.textBold
                    .copyWith(color: colorScheme.onBackground),
              ),
            ),
            const SizedBox(width: 8),
            Text(
              priceString,
              style: textTheme.h2.copyWith(
                color: colorScheme.superHappy,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BottomButton extends ConsumerWidget {
  const _BottomButton({
    Key? key,
    this.isPremium = false,
    required this.controller,
  }) : super(key: key);
  final bool isPremium;
  final PremiumPageController controller;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = MfTheme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 8),
      child: Column(
        children: [
          if (!isPremium) ...{
            PrimaryButton(
              label: '広告を削除する',
              onPressed: () {
                executeWhileLoading(ref, () {
                  return controller.purchasePremium().whenComplete(() {
                    const HomeRoute().go(context);
                  });
                });
              },
            ),
          } else ...{
            Text(
              'このアイテムは購入済みです',
              style: textTheme.h3.copyWith(
                color: colorScheme.onBackground,
              ),
            )
          },
          TextButton(
            onPressed: () {
              if (Platform.isIOS) {
                executeWhileLoading(
                  ref,
                  () => controller.restore(),
                ).then((_) {
                  const HomeRoute().go(context);
                });
              } else {
                Fluttertoast.showToast(
                    msg: '現在、Androidでは復元機能は利用できません',
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.TOP,
                    textColor: colorScheme.surface,
                    fontSize: 16.0);
              }
            },
            child: Text(
              '購入を復元する',
              style: textTheme.subSubtextBold
                  .copyWith(color: colorScheme.notSelected),
            ),
          ),
        ],
      ),
    );
  }
}
