import 'package:flutter/material.dart';
import 'package:meigen_finder/presentation/theme/mf_theme.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    Key? key,
    this.onTap,
    this.height = 54,
    required this.label,
  }) : super(key: key);
  final VoidCallback? onTap;
  final double height;
  final String label;

  @override
  Widget build(BuildContext context) {
    final theme = MfTheme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height,
        decoration: BoxDecoration(
          color: colorScheme.primary,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          label,
          style: textTheme.textBold.copyWith(
            color: colorScheme.onPrimary,
          ),
        ),
      ),
    );
  }
}
