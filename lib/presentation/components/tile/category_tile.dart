import 'package:flutter/material.dart';
import 'package:meigen_finder/domain/state/category_type.dart';
import 'package:meigen_finder/presentation/theme/mf_theme.dart';

class CategoryTile extends StatelessWidget {
  const CategoryTile({
    Key? key,
    required this.type,
    this.isSelected = false,
    this.onTap,
  }) : super(key: key);
  final CategoryType type;
  final bool isSelected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = MfTheme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    final typeName = switch (type) {
      CategoryType.like => 'お気に入り',
      CategoryType.life => '人生',
      CategoryType.love => '恋愛',
      CategoryType.work => '仕事',
      CategoryType.time => '時間',
      CategoryType.dream => '夢',
      CategoryType.beYourself => '自分らしさ',
      CategoryType.effort => '努力',
      CategoryType.entrepreneur => '起業',
      CategoryType.funny => '面白い',
      CategoryType.healing => '癒し',
      CategoryType.marriage => '結婚',
      CategoryType.motivation => 'やる気',
      CategoryType.training => 'トレーニング',
      CategoryType.original => 'オリジナル',
      CategoryType.relationship => '人間関係',
      CategoryType.anime => 'アニメ',
      CategoryType.loneliness => '孤独',
    };
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: BorderRadius.circular(8),
          border: isSelected ? Border.all(color: colorScheme.border) : null,
        ),
        child: Center(
          child: Text(
            typeName,
            style: textTheme.textBody
                .copyWith(color: colorScheme.onBackgroundBottomSheet),
          ),
        ),
      ),
    );
  }
}
