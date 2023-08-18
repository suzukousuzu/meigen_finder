import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../theme/mf_theme.dart';

class SearchTextField extends HookWidget {
  const SearchTextField({
    Key? key,
    required this.onFieldSubmitted,
    required this.onClear,
  }) : super(key: key);
  final ValueChanged<String> onFieldSubmitted;
  final VoidCallback onClear;

  @override
  Widget build(BuildContext context) {
    final textController = useTextEditingController();
    final theme = MfTheme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    return TextFormField(
      controller: textController,
      onFieldSubmitted: onFieldSubmitted,
      textInputAction: TextInputAction.search,
      decoration: InputDecoration(
          fillColor: colorScheme.surface,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
          hintText: '検索',
          prefixIcon: Icon(
            FontAwesomeIcons.magnifyingGlass,
            color: colorScheme.onBackground,
            size: 20,
          ),
          suffixIcon: textController.text.isNotEmpty
              ? IconButton(
                  onPressed: () {
                    textController.clear();
                    onClear();
                  },
                  icon: Icon(
                    FontAwesomeIcons.circleXmark,
                    color: colorScheme.onBackground,
                    size: 20,
                  ),
                )
              : null),
      style: textTheme.textBody.copyWith(color: colorScheme.onBackground),
    );
  }
}
