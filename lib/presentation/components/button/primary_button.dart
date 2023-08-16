import 'package:flutter/material.dart';
import 'package:meigen_finder/presentation/theme/mf_theme.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    Key? key,
    required this.label,
    this.height = 52,
    this.onPressed,
  }) : super(key: key);

  final String label;
  final double height;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = MfTheme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    return Opacity(
      opacity: onPressed != null ? 1 : 0.4,
      child: Container(
        height: height,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: colorScheme.primary,
          boxShadow: [
            BoxShadow(
              color: colorScheme.onBackground.withOpacity(0.25),
              blurRadius: 2,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: TextButton(
          style: TextButton.styleFrom(
            foregroundColor: colorScheme.onPrimary,
            textStyle: textTheme.h3.copyWith(
              color: colorScheme.onPrimary,
            ),
            minimumSize: const Size.fromHeight(36),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ).copyWith(
            foregroundColor: MaterialStateProperty.all(
              colorScheme.onPrimary,
            ),
          ),
          onPressed: onPressed != null
              ? () {
                  FocusManager.instance.primaryFocus?.unfocus();
                  onPressed?.call();
                }
              : null,
          child: Text(label),
        ),
      ),
    );
  }
}
