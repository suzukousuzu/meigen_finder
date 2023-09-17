import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
    print('selectedEmotionalType: ${selectedEmotionalType.value}');

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
              : () {
                  _showToast(context);
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
          onPressed: isEnable
              ? () {
                  selectedEmotionalType.value = EmotionalType.somewhatHappy;
                  onChanged(EmotionalType.somewhatHappy);
                }
              : () => _showToast(context),
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
              : () => _showToast(context),
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
              : () => _showToast(context),
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
              : () => _showToast(context),
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

_showToast(BuildContext context) {
  final theme = MfTheme.of(context);
  final colorScheme = theme.colorScheme;

  Fluttertoast.showToast(
      msg: "今日の名言はもう取得済みです",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      textColor: colorScheme.onSecondary,
      fontSize: 16.0);
}
