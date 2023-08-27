import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meigen_finder/application/controller/quote_detail_page_controller.dart';
import 'package:meigen_finder/presentation/routing/router.dart';
import 'package:meigen_finder/presentation/theme/mf_theme.dart';

import '../../../application/controller/favorite_quote_page_controller.dart';
import '../../components/field/search_text_field.dart';
import '../../components/tile/favorite_quote_tile.dart';

class FavoriteQuotePage extends HookConsumerWidget {
  const FavoriteQuotePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewState = ref.watch(favoriteQuotePageControllerProvider);
    final controller = ref.watch(favoriteQuotePageControllerProvider.notifier);
    final favoriteQuotes = viewState.likedQuotes ?? [];

    final theme = MfTheme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    const isLiked = true;
    return Scaffold(
      body: favoriteQuotes.isNotEmpty
          ? SafeArea(
              child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  backgroundColor: colorScheme.background,
                  title: SearchTextField(
                      onFieldSubmitted: controller.searchFavoriteQuote,
                      onClear: () => controller.onClear()),
                  pinned: true,
                  bottom: PreferredSize(
                    preferredSize: const Size.fromHeight(16.0), // 追加の高さを指定
                    child: Container(), // 空のウィジェット
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final quote = favoriteQuotes[index];
                      return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 8),
                          child: FavoriteQuoteTile(
                            text: quote.text,
                            author: quote.author ?? '',
                            onTap: () => QuoteDetailRouteFromFavorite(
                                    QuoteDetailArgument(quote, isLiked))
                                .push(context),
                          ));
                    },
                    childCount: favoriteQuotes.length,
                  ),
                ),
              ],
            ))
          : Center(
              child: Text(
                'お気に入りの名言はありません',
                style: textTheme.h3.copyWith(color: colorScheme.onBackground),
              ),
            ),
    );
  }
}
