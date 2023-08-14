import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meigen_finder/application/controller/home_page_controller.dart';
import 'package:meigen_finder/application/controller/quote_detail_page_controller.dart';
import 'package:meigen_finder/application/state/home_page_view_state.dart';
import 'package:meigen_finder/presentation/components/button/primary_button.dart';
import 'package:meigen_finder/presentation/components/selector/emotional_selector.dart';
import 'package:meigen_finder/presentation/routing/router.dart';

import '../../theme/mf_theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          _PromptText(),
          _EmotionalSelector(),
          _Button(),
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
  const _Button({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewState = ref.watch(homePageControllerProvider);
    return Padding(
      padding: const EdgeInsets.fromLTRB(32, 32, 32, 0),
      child: PrimaryButton(
        label: '今日の名言',
        onPressed: viewState.isButtonEnable
            ? () => QuoteDetailRoute(
                    QuoteDetailArgument(viewState.todaysQuote!, false))
                .go(context)
            : null,
      ),
    );
  }
}
