import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meigen_finder/presentation/theme/mf_theme.dart';

import '../../../domain/collection/emotional_type.dart';

const _iconSize = 36.0;

class EmotionalSelector extends HookWidget {
  const EmotionalSelector({
    Key? key,
    required this.onChanged,
  }) : super(key: key);
  final ValueChanged<EmotionalType> onChanged;

  @override
  Widget build(BuildContext context) {
    final theme = MfTheme.of(context);
    final colorScheme = theme.colorScheme;

    final selectedEmotionalType = useState<EmotionalType?>(null);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            selectedEmotionalType.value = EmotionalType.superHappy;
            onChanged(EmotionalType.superHappy);
          },
          icon: Icon(
            FontAwesomeIcons.solidFaceLaughSquint,
            size: _iconSize,
            color: selectedEmotionalType.value == EmotionalType.superHappy
                ? colorScheme.superHappy
                : colorScheme.notSelected,
          ),
        ),
        IconButton(
          onPressed: () {
            selectedEmotionalType.value = EmotionalType.somewhatHappy;
            onChanged(EmotionalType.somewhatHappy);
          },
          icon: Icon(
            FontAwesomeIcons.solidFaceSmile,
            size: _iconSize,
            color: selectedEmotionalType.value == EmotionalType.somewhatHappy
                ? colorScheme.someWhatHappy
                : colorScheme.notSelected,
          ),
        ),
        IconButton(
          onPressed: () {
            selectedEmotionalType.value = EmotionalType.normal;
            onChanged(EmotionalType.normal);
          },
          icon: Icon(
            FontAwesomeIcons.solidFaceMeh,
            size: _iconSize,
            color: selectedEmotionalType.value == EmotionalType.normal
                ? colorScheme.normal
                : colorScheme.notSelected,
          ),
        ),
        IconButton(
          onPressed: () {
            selectedEmotionalType.value = EmotionalType.somewhatSad;
            onChanged(EmotionalType.somewhatSad);
          },
          icon: Icon(
            FontAwesomeIcons.solidFaceFrown,
            size: _iconSize,
            color: selectedEmotionalType.value == EmotionalType.somewhatSad
                ? colorScheme.someWhatSad
                : colorScheme.notSelected,
          ),
        ),
        IconButton(
          onPressed: () {
            selectedEmotionalType.value = EmotionalType.superSad;
            onChanged(EmotionalType.superSad);
          },
          icon: Icon(
            FontAwesomeIcons.solidFaceSadTear,
            size: _iconSize,
            color: selectedEmotionalType.value == EmotionalType.superSad
                ? colorScheme.superSad
                : colorScheme.notSelected,
          ),
        ),
      ],
    );
  }
}
