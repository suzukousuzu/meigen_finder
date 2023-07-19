import 'package:flutter/material.dart';
import 'package:meigen_finder/presentation/theme/mf_theme.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    Key? key,
    required this.label,
    this.height = 63,
    this.onPressed,
  }) : super(key: key);

  final String label;
  final double height;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = MfTheme.of(context);
    final colorScheme = theme.colorScheme;
    return Opacity(
      opacity: onPressed != null ? 1 : 0.4,
      child: Container(
        height: height,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: colorScheme.primary,
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.24),
              blurRadius: 30,
              offset: Offset(0, 10),
            ),
          ],
        ),
        child: TextButton(
          style: TextButton.styleFrom(
            foregroundColor: colorScheme.onPrimary,
            textStyle: const TextStyle(
                height: 1, fontSize: 18, fontWeight: FontWeight.w400),
            minimumSize: const Size.fromHeight(48),
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
