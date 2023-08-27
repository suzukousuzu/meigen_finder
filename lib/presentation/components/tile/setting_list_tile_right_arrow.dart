import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meigen_finder/presentation/theme/mf_theme.dart';

class SettingListTileRightArrow extends StatelessWidget {
  const SettingListTileRightArrow({
    Key? key,
    required this.label,
    this.onTap,
    this.topLeftRadius = 12,
    this.topRightRadius = 12,
    this.bottomLeftRadius = 12,
    this.bottomRightRadius = 12,
    this.trailingWidget,
  }) : super(key: key);

  final String label;
  final VoidCallback? onTap;
  final double topLeftRadius;
  final double topRightRadius;
  final double bottomLeftRadius;
  final double bottomRightRadius;
  final Widget? trailingWidget;

  @override
  Widget build(BuildContext context) {
    final theme = MfTheme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    final trailing = trailingWidget ??
        Icon(
          FontAwesomeIcons.angleRight,
          color: colorScheme.onBackgroundBottomSheet.withOpacity(0.5),
          size: 20.0,
        );
    return ListTile(
      tileColor: colorScheme.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(topLeftRadius),
          topRight: Radius.circular(topRightRadius),
          bottomLeft: Radius.circular(bottomLeftRadius),
          bottomRight: Radius.circular(bottomRightRadius),
        ),
      ),
      title: Text(
        label,
        style: textTheme.textBody
            .copyWith(color: colorScheme.onBackgroundBottomSheet),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 8.0),
      visualDensity: const VisualDensity(horizontal: 0, vertical: -2),
      trailing: trailing,
      onTap: onTap,
    );
  }
}
