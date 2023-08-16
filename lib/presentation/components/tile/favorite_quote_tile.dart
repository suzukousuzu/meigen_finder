import 'package:flutter/material.dart';
import 'package:meigen_finder/presentation/components/card/mf_card.dart';
import 'package:meigen_finder/presentation/theme/mf_theme.dart';

class FavoriteQuoteTile extends StatelessWidget {
  const FavoriteQuoteTile({
    Key? key,
    required this.text,
    required this.author,
    this.onTap,
  }) : super(key: key);
  final String text;
  final String author;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = MfTheme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    return MfCard(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        width: double.infinity,
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Text(
              text,
              textAlign: TextAlign.center,
              style: textTheme.textBold
                  .copyWith(color: colorScheme.onBackgroundBottomSheet),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              '-$author-',
              style: textTheme.textBody
                  .copyWith(color: colorScheme.onBackgroundBottomSheet),
            ),
          ],
        ),
      ),
    );
  }
}
