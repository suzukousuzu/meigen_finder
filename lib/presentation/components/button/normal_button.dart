import 'package:flutter/material.dart';
import 'package:meigen_finder/presentation/theme/mf_theme.dart';

class NormalButton extends StatelessWidget {
  const NormalButton({
    Key? key,
    required this.label,
    this.height = 52,
    this.onPressed,
    this.icon,
  }) : super(key: key);

  final String label;
  final double height;
  final VoidCallback? onPressed;
  final Icon? icon;

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
          border: Border.all(
            color: colorScheme.surface,
          ),
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
        ),
        child: TextButton(
          style: TextButton.styleFrom(
            foregroundColor: colorScheme.onBackgroundBottomSheet,
            textStyle: textTheme.h3.copyWith(
              color: colorScheme.onBackgroundBottomSheet,
            ),
            minimumSize: const Size.fromHeight(48),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ).copyWith(
            foregroundColor: MaterialStateProperty.all(
              colorScheme.onBackgroundBottomSheet,
            ),
          ),
          onPressed: onPressed,
          child: Text(label),
        ),
      ),
    );
  }
}
