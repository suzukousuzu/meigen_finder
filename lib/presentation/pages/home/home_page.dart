import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meigen_finder/application/controller/home_page_controller.dart';
import 'package:meigen_finder/application/controller/quote_detail_page_controller.dart';
import 'package:meigen_finder/application/state/home_page_view_state.dart';
import 'package:meigen_finder/presentation/components/button/primary_button.dart';
import 'package:meigen_finder/presentation/components/selector/emotional_selector.dart';
import 'package:meigen_finder/presentation/routing/router.dart';

import '../../theme/mf_theme.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(homePageControllerProvider.notifier);
    useEffect(() {
      controller.fetch();
      return;
    }, const []);
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          // TODO:既に今日の名言を表示した場合のデザイン
          const _PromptText(),
          const _EmotionalSelector(),
          _Button(
            controller: controller,
          ),
        ],
      ),
    ));
  }
}

class _PromptText extends StatelessWidget {
  const _PromptText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = MfTheme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 64, 20, 16),
      child: Center(
        child: Text(
          '今日はどんな1日でしたか？',
          style: textTheme.h3.copyWith(color: colorScheme.onBackground),
        ),
      ),
    );
  }
}

class _EmotionalSelector extends ConsumerWidget {
  const _EmotionalSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(32, 12, 32, 0),
      child: Center(
        child: EmotionalSelector(onChanged: (emotionalType) {
          ref
              .read(homePageControllerProvider.notifier)
              .updateEmotionalType(emotionalType);
        }),
      ),
    );
  }
}

class _Button extends ConsumerWidget {
  const _Button({Key? key, required this.controller}) : super(key: key);
  final HomePageController controller;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewState = ref.watch(homePageControllerProvider);
    ref.listen(homePageControllerProvider.select((value) => value.todaysQuote),
        (previous, next) {
      if (previous == null && next != null) {
        QuoteDetailRouteFromHome(
                QuoteDetailArgument(next.quote, viewState.isLikedQuoted))
            .go(context);
      }
    });
    return Padding(
      padding: const EdgeInsets.fromLTRB(32, 32, 32, 0),
      child: PrimaryButton(
        label: '今日の名言',
        onPressed: viewState.isButtonEnable
            ? () {
                controller.onUpdateTodayQuote();
              }
            : null,
      ),
    );
  }
}
