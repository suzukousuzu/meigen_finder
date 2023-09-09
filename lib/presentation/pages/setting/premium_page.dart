import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:meigen_finder/presentation/components/button/primary_button.dart';
import 'package:meigen_finder/presentation/theme/mf_theme.dart';

import '../../../gen/assets.gen.dart';

class PremiumPage extends StatelessWidget {
  const PremiumPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = MfTheme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

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
      body: const Column(
        children: [
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _PromptText(),
                  _Image(),
                ],
              ),
            ),
          ),
          _BottomButton(),
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
      width: 260,
      height: 260,
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
            '広告を削除！！',
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

class _BottomButton extends StatelessWidget {
  const _BottomButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = MfTheme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
      child: Column(
        children: [
          PrimaryButton(
            label: '広告を削除する',
            onPressed: () {},
          ),
          TextButton(
            onPressed: () {
              // TODO:購入の復元
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
