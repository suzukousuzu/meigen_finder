import 'package:flutter/material.dart';

class MfColorScheme {
  const MfColorScheme._({
    required this.primary,
    required this.background,
    required this.onBackgroundBottomSheet,
    required this.onBackground,
    required this.surface,
    required this.onPrimary,
    required this.secondary,
    required this.onSecondary,
    required this.error,
    required this.onError,
    required this.transParent,
    required this.border,
    required this.selectedColor,
    required this.superHappy,
    required this.someWhatHappy,
    required this.normal,
    required this.someWhatSad,
    required this.superSad,
    required this.notSelected,
    required this.notEmotionalTypeColor,
    required this.calenderSelectedDay,
    required this.linkColor,
  });

  MfColorScheme.light()
      : this._(
          primary: _nero,
          background: _whiteSmoke,
          onBackgroundBottomSheet: _black,
          onBackground: _nero,
          surface: _white,
          onPrimary: _white,
          secondary: _white,
          onSecondary: _white,
          error: _persianRed,
          onError: _white,
          transParent: Colors.transparent,
          border: _orangePeel,
          selectedColor: _caramel,
          superHappy: _orangePeel,
          someWhatHappy: _tangerine,
          normal: _mangoTango,
          someWhatSad: _tenne,
          superSad: _goldenBrown,
          notSelected: _gray,
          notEmotionalTypeColor: _gainsboro,
          calenderSelectedDay: _orangePeel,
          linkColor: _ultramarine,
        );

  final Color primary;
  final Color background;
  final Color onBackground;
  final Color onBackgroundBottomSheet;
  final Color surface;
  final Color onPrimary;
  final Color secondary;
  final Color onSecondary;
  final Color error;
  final Color onError;
  final Color transParent;
  final Color border;
  final Color selectedColor;

  final Color superHappy;
  final Color someWhatHappy;
  final Color normal;
  final Color someWhatSad;
  final Color superSad;
  final Color notSelected;

  final Color notEmotionalTypeColor;

  final Color calenderSelectedDay;

  final Color linkColor;
}

/// 色名参考: https://www.htmlcsscolor.com/
const _nero = Color(0XFF181717);
const _white = Color(0XFFFFFFFF);
const _black = Color(0XFF0F0E0E);
const _whiteSmoke = Color(0XFFF5F5F5);
const _whisper = Color(0XFFE7E5E5);
const _persianRed = Color(0XFFD32F2F);
const _caramel = Color(0XFFFDD394);
const _orangePeel = Color(0XFFFF9900);

const _tangerine = Color(0XFFE88800);
const _gray = Color(0XFF808080);
const _mangoTango = Color(0XFFD17700);
const _tenne = Color(0XFFBA6600);
const _goldenBrown = Color(0XFFA25500);
const _gainsboro = Color(0XFFDDDDDD);
final _ultramarine = Color(0XFF1A0DAB);
