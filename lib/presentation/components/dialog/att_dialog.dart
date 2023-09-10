import 'package:flutter/material.dart';
import 'package:meigen_finder/presentation/theme/mf_theme.dart';

import '../button/primary_button.dart';

void showAttDialog(
    {required BuildContext context,
    required String title,
    required String content,
    required VoidCallback onPressed}) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => ConfirmDialog(
            title: title,
            content: content,
            onPressed: onPressed,
          ));
}

class ConfirmDialog extends StatelessWidget {
  final String title;
  final String content;
  final VoidCallback onPressed;

  const ConfirmDialog({
    Key? key,
    required this.title,
    required this.content,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = MfTheme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    return AlertDialog(
      insetPadding: const EdgeInsets.all(8),
      contentPadding:
          const EdgeInsets.only(top: 12, left: 28, right: 28, bottom: 12),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      title: Center(
        child: Text(
          title,
          style: textTheme.h3.copyWith(
            color: colorScheme.onBackground,
          ),
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 20,
          ),
          Text(content,
              textAlign: TextAlign.center,
              style: textTheme.textBody.copyWith(
                color: colorScheme.onBackground,
              )),
          const SizedBox(
            height: 36,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              PrimaryButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  onPressed();
                },
                label: '次へ',
              ),
              const SizedBox(
                height: 8,
              ),
            ],
          )
        ],
      ),
    );
  }
}
