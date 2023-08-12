import 'package:flutter/material.dart';
import 'package:meigen_finder/presentation/components/selector/emotional_selector.dart';

import '../../theme/mf_theme.dart';

// TODO:本物のホーム画面になる予定
class HomePage2 extends StatelessWidget {
  const HomePage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          _PromptText(),
          _EmotionalSelector(),
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
      padding: const EdgeInsets.fromLTRB(20, 48, 20, 16),
      child: Center(
        child: Text('今日はどんな1日でしたか？',
            style: textTheme.h3.copyWith(color: colorScheme.onBackground)),
      ),
    );
  }
}

class _EmotionalSelector extends StatelessWidget {
  const _EmotionalSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(32, 20, 32, 0),
        child: Center(child: EmotionalSelector(onChanged: (ff) {})));
  }
}
