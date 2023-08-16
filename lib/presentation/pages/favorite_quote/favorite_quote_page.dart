import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meigen_finder/application/controller/quote_detail_page_controller.dart';
import 'package:meigen_finder/presentation/routing/router.dart';
import 'package:meigen_finder/presentation/theme/mf_theme.dart';

import '../../../application/controller/favorite_quote_page_controller.dart';
import '../../components/tile/favorite_quote_tile.dart';

class FavoriteQuotePage extends HookConsumerWidget {
  const FavoriteQuotePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewState = ref.watch(favoriteQuotePageControllerProvider);
    final favoriteQuotes = viewState.likedQuotes ?? [];

    useEffect(() {
      ref.read(favoriteQuotePageControllerProvider.notifier).fetchLikeQuotes();
      return;
    }, const []);

    final theme = MfTheme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    const isLiked = true;
    return Scaffold(
      body: favoriteQuotes.isNotEmpty
          ? SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // TODO:検索機能をつける
                    ...favoriteQuotes.map((quote) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 8),
                        child: FavoriteQuoteTile(
                          text: quote.text,
                          author: quote.author ?? '',
                          onTap: () => QuoteDetailRoute(
                                  QuoteDetailArgument(quote, isLiked))
                              .push(context),
                        ),
                      );
                    }),
                    const SizedBox(
                      height: 12,
                    ),
                  ],
                ),
              ),
            )
          : Center(
              child: Text(
                'お気に入りの名言はありません',
                style: textTheme.h3.copyWith(color: colorScheme.onBackground),
              ),
            ),
    );
  }
}
