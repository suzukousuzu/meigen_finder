import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meigen_finder/presentation/theme/mf_theme.dart';
import 'package:share_plus/share_plus.dart';

import '../../../application/controller/quote_detail_page_controller.dart';
import '../../../domain/collection/quote.dart';

class QuoteDetailPage extends HookConsumerWidget {
  const QuoteDetailPage({
    Key? key,
    required this.quoteDetailArgument,
  }) : super(key: key);

  final QuoteDetailArgument quoteDetailArgument;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = MfTheme.of(context);
    final colorScheme = theme.colorScheme;

    final viewState =
        ref.watch(quoteDetailControllerProvider(quoteDetailArgument));
    final controller =
        ref.watch(quoteDetailControllerProvider(quoteDetailArgument).notifier);

    final bannerAd = viewState.bannerAd;

    useEffect(() {
      Future(() => controller.fetchBannerAd());
      return;
    }, const []);

    final quote = viewState.quote;
    final isLiked = viewState.isLiked;
    return Scaffold(
      extendBodyBehindAppBar: true,
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
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _MeigenText(
                quote: quote,
              ),
              _ShareAndLike(
                quote: quote,
                isLiked: isLiked,
                controller: controller,
              ),
            ],
          ),
          if (bannerAd != null && !viewState.isPremium) ...{
            _Banner(bannerAd: bannerAd),
          },
        ],
      ),
    );
  }
}

class _MeigenText extends StatelessWidget {
  const _MeigenText({
    Key? key,
    required this.quote,
  }) : super(key: key);
  final Quote quote;

  @override
  Widget build(BuildContext context) {
    final theme = MfTheme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    final quote = this.quote;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: colorScheme.transParent,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: colorScheme.secondary.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 4,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          children: [
            Text(
              quote.text,
              textAlign: TextAlign.center,
              style: textTheme.h1.copyWith(
                color: colorScheme.primary,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              '-${quote.author}',
              textAlign: TextAlign.center,
              style: textTheme.textBody.copyWith(
                color: colorScheme.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ShareAndLike extends StatelessWidget {
  const _ShareAndLike({
    Key? key,
    required this.quote,
    required this.isLiked,
    required this.controller,
  }) : super(key: key);
  final Quote quote;
  final bool isLiked;
  final QuoteDetailController controller;

  @override
  Widget build(BuildContext context) {
    final theme = MfTheme.of(context);
    final colorScheme = theme.colorScheme;

    final quote = this.quote;
    final isLiked = this.isLiked;
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {
              Share.share(quote.text);
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
              controller.like(quote, isLiked);
            },
            icon: Icon(
              isLiked ? FontAwesomeIcons.solidHeart : FontAwesomeIcons.heart,
              size: 32,
              color: colorScheme.onBackground,
            ),
          )
        ],
      ),
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
