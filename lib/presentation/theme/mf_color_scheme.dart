import 'package:flutter/material.dart';

class MfColorScheme {
  const MfColorScheme._({
    required this.primary,
    required this.background,
    required this.onBackground,
    required this.surface,
    required this.onPrimary,
    required this.secondary,
    required this.onSecondary,
    required this.error,
    required this.onError,
    required this.transParent,
  });

  MfColorScheme.light()
      : this._(
          primary: _nero,
          background: _whiteSmoke,
          onBackground: _white,
          surface: _whisper,
          onPrimary: _white,
          secondary: _white,
          onSecondary: _white,
          error: _persianRed,
          onError: _white,
          transParent: Colors.transparent,
        );

  final Color primary;
  final Color background;
  final Color onBackground;
  final Color surface;
  final Color onPrimary;
  final Color secondary;
  final Color onSecondary;
  final Color error;
  final Color onError;
  final Color transParent;
}

/// 色名参考: https://www.htmlcsscolor.com/
const _nero = Color(0XFF181717);
const _white = Color(0XFFFFFFFF);
const _black = Color(0XFF0F0E0E);
const _whiteSmoke = Color(0XFFF5F5F5);
const _whisper = Color(0XFFE7E5E5);
const _persianRed = Color(0XFFD32F2F);
const _sealBrown = Color(0XFF290101);