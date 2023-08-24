import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meigen_finder/domain/collection/emotional_type.dart';

import '../presentation/theme/mf_theme.dart';

extension EmotionalTypeExtension on EmotionalType {
  IconData get icon {
    return switch (this) {
      EmotionalType.superHappy => FontAwesomeIcons.solidFaceLaughSquint,
      EmotionalType.somewhatHappy => FontAwesomeIcons.solidFaceSmile,
      EmotionalType.normal => FontAwesomeIcons.solidFaceMeh,
      EmotionalType.somewhatSad => FontAwesomeIcons.solidFaceFrown,
      EmotionalType.superSad => FontAwesomeIcons.solidFaceSadTear
    };
  }

  Color getColor(BuildContext context) {
    final theme = MfTheme.of(context);
    final colorScheme = theme.colorScheme;
    return switch (this) {
      EmotionalType.superHappy => colorScheme.superHappy,
      EmotionalType.somewhatHappy => colorScheme.someWhatHappy,
      EmotionalType.normal => colorScheme.normal,
      EmotionalType.somewhatSad => colorScheme.someWhatSad,
      EmotionalType.superSad => colorScheme.superSad
    };
  }
}
