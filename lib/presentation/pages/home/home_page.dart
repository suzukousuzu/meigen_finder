import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meigen_finder/application/controller/home_page_controller.dart';
import 'package:meigen_finder/application/controller/quote_detail_page_controller.dart';
import 'package:meigen_finder/application/state/home_page_view_state.dart';
import 'package:meigen_finder/domain/collection/emotional_type.dart';
import 'package:meigen_finder/presentation/components/button/primary_button.dart';
import 'package:meigen_finder/presentation/components/selector/emotional_selector.dart';
import 'package:meigen_finder/presentation/routing/router.dart';

import '../../components/button/label_button.dart';
import '../../components/loading/execute_while_loading.dart';
import '../../theme/mf_theme.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(homePageControllerProvider.notifier);
    final viewState = ref.watch(homePageControllerProvider);

    final bannerAd = viewState.bannerAd;

    final canRetrieveQuoteToday = viewState.canRetrieveQuoteToday;
    useEffect(() {
      executeWhileLoading(ref, () => controller.fetch());
      return;
    }, const []);
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          Column(
            children: [
              _PromptText(
                canRetrieveQuoteToday: canRetrieveQuoteToday,
              ),
              _EmotionalSelector(
                canRetrieveQuoteToday: canRetrieveQuoteToday,
                initialType: viewState.todaysQuote?.emotionalType,
              ),
              _Button(
                controller: controller,
                canRetrieveQuoteToday: canRetrieveQuoteToday,
              ),
            ],
          ),
          if (bannerAd != null) ...{
            _Banner(bannerAd: bannerAd),
          },
        ],
      )),
    );
  }
}

class _PromptText extends StatelessWidget {
  const _PromptText({Key? key, required this.canRetrieveQuoteToday})
      : super(key: key);

  final bool canRetrieveQuoteToday;

  @override
  Widget build(BuildContext context) {
    final theme = MfTheme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 64, 20, 16),
      child: Center(
        child: Text(
          canRetrieveQuoteToday ? '今日はどんな1日でしたか？' : '明日もお待ちしております！',
          style: textTheme.h3.copyWith(color: colorScheme.onBackground),
        ),
      ),
    );
  }
}

class _EmotionalSelector extends ConsumerWidget {
  const _EmotionalSelector({
    Key? key,
    required this.canRetrieveQuoteToday,
    this.initialType,
  }) : super(key: key);
  final bool canRetrieveQuoteToday;
  final EmotionalType? initialType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(32, 12, 32, 0),
      child: Center(
        child: EmotionalSelector(
            initialType: initialType,
            isEnable: canRetrieveQuoteToday,
            onChanged: (emotionalType) {
              ref
                  .read(homePageControllerProvider.notifier)
                  .updateEmotionalType(emotionalType);
            }),
      ),
    );
  }
}

class _Button extends ConsumerWidget {
  const _Button({
    Key? key,
    required this.controller,
    required this.canRetrieveQuoteToday,
  }) : super(key: key);
  final HomePageController controller;
  final bool canRetrieveQuoteToday;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewState = ref.watch(homePageControllerProvider);
    final todaysQuote = viewState.todaysQuote;
    ref.listen(
        homePageControllerProvider
            .select((value) => value.quoteRetrievalSuccess), (previous, next) {
      if (next == true) {
        if (todaysQuote == null) {
          return;
        }
        QuoteDetailRouteFromHome(
                QuoteDetailArgument(todaysQuote.quote, viewState.isLikedQuoted))
            .go(context);
      }
    });
    return Padding(
      padding: const EdgeInsets.fromLTRB(32, 32, 32, 0),
      child: canRetrieveQuoteToday
          ? PrimaryButton(
              label: '今日の名言',
              onPressed: viewState.isButtonEnable
                  ? () {
                      controller.onUpdateTodayQuote();
                    }
                  : null,
            )
          : LabelButton(
              label: '今日の名言を再度みる',
              onPressed: () {
                // TODO:全画面広告の実装
                QuoteDetailRouteFromHome(QuoteDetailArgument(
                        todaysQuote!.quote, viewState.isLikedQuoted))
                    .go(context);
              }),
    );
  }
}

class _Banner extends StatelessWidget {
  const _Banner({
    Key? key,
    required this.bannerAd,
  }) : super(key: key);

  final BannerAd bannerAd;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: SizedBox(
          width: bannerAd.size.width.toDouble(),
          height: bannerAd.size.height.toDouble(),
          child: AdWidget(
            ad: bannerAd,
          ),
        ),
      ),
    );
  }
}
