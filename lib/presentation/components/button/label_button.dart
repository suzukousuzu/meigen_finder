import 'package:flutter/material.dart';
import 'package:meigen_finder/presentation/theme/mf_theme.dart';

class LabelButton extends StatelessWidget {
  const LabelButton({
    Key? key,
    required this.label,
    this.onPressed,
  }) : super(key: key);
  final String label;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = MfTheme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    return TextButton(
        onPressed: onPressed,
        child: Text(
          label,
          style: textTheme.h3.copyWith(
            color: colorScheme.linkColor,
          ),
        ));
  }
}
