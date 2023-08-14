// import 'package:flutter/material.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:meigen_finder/presentation/theme/mf_theme.dart';
// import 'package:meigen_finder/util/extension/category_type_extension.dart';
//
// import '../../../domain/collection/category_type.dart';
//
// class CategoryTile extends HookWidget {
//   const CategoryTile({
//     Key? key,
//     required this.type,
//     required this.selectedTypes,
//     required this.onChanged,
//   }) : super(key: key);
//   final CategoryType type;
//   final List<CategoryType> selectedTypes;
//   final ValueChanged<CategoryType> onChanged;
//
//   @override
//   Widget build(BuildContext context) {
//     final theme = MfTheme.of(context);
//     final colorScheme = theme.colorScheme;
//     final textTheme = theme.textTheme;
//
//     final isSelected = selectedTypes.contains(type);
//     return InkWell(
//       onTap: () {
//         onChanged(type);
//       },
//       child: Container(
//         padding: const EdgeInsets.all(8),
//         decoration: BoxDecoration(
//           color: isSelected ? colorScheme.selectedColor : colorScheme.surface,
//           borderRadius: BorderRadius.circular(8),
//           border: isSelected
//               ? Border.all(
//                   color: colorScheme.border,
//                   width: 2,
//                 )
//               : null,
//         ),
//         child: Center(
//           child: Text(
//             type.categoryText,
//             style: textTheme.textBody
//                 .copyWith(color: colorScheme.onBackgroundBottomSheet),
//           ),
//         ),
//       ),
//     );
//   }
// }
