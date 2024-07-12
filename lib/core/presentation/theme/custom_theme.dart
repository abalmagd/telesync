import 'package:flutter/material.dart';
import 'package:telesync/core/presentation/theme/palette.dart';

mixin CustomTheme {
  final _baseTheme = ThemeData(
    dividerTheme: const DividerThemeData(thickness: 1.6, space: 0),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: Palette.primary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    ),
  );

  ThemeData lightTheme(BuildContext context) {
    return ThemeData(
      useMaterial3: true,
      primaryColor: Palette.primary,
      brightness: Brightness.light,
      scaffoldBackgroundColor: Palette.scaffoldBgLight,
      filledButtonTheme: _baseTheme.filledButtonTheme,
      dividerTheme: _baseTheme.dividerTheme,
    );
  }

  ThemeData darkTheme(BuildContext context) {
    return ThemeData(
      useMaterial3: true,
      primaryColor: Palette.primary,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: Palette.scaffoldBgDark,
      filledButtonTheme: _baseTheme.filledButtonTheme,
      dividerTheme: _baseTheme.dividerTheme,
    );
  }
}
