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
    this.initialType,
    this.isEnable = true,
  }) : super(key: key);
  final ValueChanged<EmotionalType> onChanged;
  final EmotionalType? initialType;
  final bool isEnable;

  @override
  Widget build(BuildContext context) {
    final theme = MfTheme.of(context);
    final colorScheme = theme.colorScheme;

    final selectedEmotionalType = useState<EmotionalType?>(null);

    useEffect(() {
      selectedEmotionalType.value = initialType;
      return null;
    }, [initialType]);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: isEnable
              ? () {
                  selectedEmotionalType.value = EmotionalType.superHappy;
                  onChanged(EmotionalType.superHappy);
                }
              : null,
          icon: Icon(
            FontAwesomeIcons.solidFaceLaughSquint,
            size: _iconSize,
            color: selectedEmotionalType.value == EmotionalType.superHappy
                ? colorScheme.superHappy
                : colorScheme.notSelected,
          ),
        ),
        IconButton(
          onPressed: isEnable
              ? () {
                  selectedEmotionalType.value = EmotionalType.somewhatHappy;
                  onChanged(EmotionalType.somewhatHappy);
                }
              : null,
          icon: Icon(
            FontAwesomeIcons.solidFaceSmile,
            size: _iconSize,
            color: selectedEmotionalType.value == EmotionalType.somewhatHappy
                ? colorScheme.someWhatHappy
                : colorScheme.notSelected,
          ),
        ),
        IconButton(
          onPressed: isEnable
              ? () {
                  selectedEmotionalType.value = EmotionalType.normal;
                  onChanged(EmotionalType.normal);
                }
              : null,
          icon: Icon(
            FontAwesomeIcons.solidFaceMeh,
            size: _iconSize,
            color: selectedEmotionalType.value == EmotionalType.normal
                ? colorScheme.normal
                : colorScheme.notSelected,
          ),
        ),
        IconButton(
          onPressed: isEnable
              ? () {
                  selectedEmotionalType.value = EmotionalType.somewhatSad;
                  onChanged(EmotionalType.somewhatSad);
                }
              : null,
          icon: Icon(
            FontAwesomeIcons.solidFaceFrown,
            size: _iconSize,
            color: selectedEmotionalType.value == EmotionalType.somewhatSad
                ? colorScheme.someWhatSad
                : colorScheme.notSelected,
          ),
        ),
        IconButton(
          onPressed: isEnable
              ? () {
                  selectedEmotionalType.value = EmotionalType.superSad;
                  onChanged(EmotionalType.superSad);
                }
              : null,
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
