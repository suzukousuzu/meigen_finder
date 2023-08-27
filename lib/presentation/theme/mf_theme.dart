import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meigen_finder/presentation/theme/mf_color_scheme.dart';

import 'mf_text_theme.dart';

final mfThemeProvider = Provider<MfTheme>((ref) {
  return MfTheme.light();
});

class MfTheme {
  MfTheme({
    required this.mode,
    required this.data,
    required this.textTheme,
    required this.colorScheme,
  });

  factory MfTheme.light() {
    const mode = ThemeMode.light;
    final colorScheme = MfColorScheme.light();
    const textTheme = MfTextTheme();

    final baseThemeData = ThemeData(
      colorScheme: _colorSchemeFrom(colorScheme),
    );
    final themeData = baseThemeData.copyWith(
      scaffoldBackgroundColor: colorScheme.background,
      primaryTextTheme: TextTheme(
        titleLarge: textTheme.textBold.copyWith(
          color: colorScheme.onBackground,
        ),
        titleSmall: textTheme.subtext.copyWith(
          color: colorScheme.onBackground,
        ),
      ),
      textTheme: baseThemeData.textTheme.apply(
        bodyColor: colorScheme.onBackground,
        displayColor: colorScheme.onBackground,
      ),
      appBarTheme: AppBarTheme(
        color: colorScheme.primary,
        centerTitle: true,
        iconTheme: IconThemeData(
          size: 24,
          color: colorScheme.onPrimary,
        ),
        actionsIconTheme: IconThemeData(
          size: 24,
          color: colorScheme.onPrimary,
        ),
        titleTextStyle: textTheme.h1.copyWith(
          color: colorScheme.onPrimary,
        ),
        elevation: 0,
      ),
      dividerTheme: DividerThemeData(
        color: colorScheme.onBackground,
        thickness: 1,
        space: 1,
      ),
    );

    return MfTheme(
      mode: mode,
      data: themeData,
      textTheme: textTheme,
      colorScheme: colorScheme,
    );
  }

  static MfTheme of(BuildContext context) {
    return ProviderScope.containerOf(context, listen: false)
        .read(mfThemeProvider);
  }

  final ThemeMode mode;
  final ThemeData data;
  final MfTextTheme textTheme;
  final MfColorScheme colorScheme;

  static ColorScheme _colorSchemeFrom(MfColorScheme colorScheme) {
    return ColorScheme(
      brightness: Brightness.light,
      primary: colorScheme.primary,
      onPrimary: colorScheme.onPrimary,
      primaryContainer: colorScheme.primary,
      onSecondary: colorScheme.onBackground,
      secondary: colorScheme.secondary,
      error: colorScheme.error,
      onError: colorScheme.onError,
      background: colorScheme.background,
      onBackground: colorScheme.onBackground,
      surface: colorScheme.surface,
      onSurface: colorScheme.onBackground,
    );
  }
}
