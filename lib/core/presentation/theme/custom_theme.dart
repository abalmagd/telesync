import 'package:flutter/material.dart';
import 'package:telesync/core/presentation/theme/palette.dart';
import 'package:telesync/core/presentation/theme/text_theme.dart';

mixin CustomTheme {
  ThemeData lightTheme(BuildContext context) {
    return ThemeData(
      useMaterial3: true,
      colorScheme: const ColorScheme.light(
        brightness: Brightness.light,
        primary: Palette.primaryLight,
        onPrimary: Palette.white,
        surface: Palette.surfaceLight,
        onSurface: Palette.onSurfaceLight,
      ),
      textTheme: CustomTextTheme.textTheme(context),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: FilledButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
    );
  }

  ThemeData darkTheme(BuildContext context) {
    return ThemeData(
      useMaterial3: true,
      colorScheme: const ColorScheme.dark(
        brightness: Brightness.dark,
        primary: Palette.primaryDark,
        onPrimary: Palette.white,
        surface: Palette.surfaceDark,
        onSurface: Palette.onSurfaceDark,
      ),
      textTheme: CustomTextTheme.textTheme(context),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: FilledButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
    );
  }
}
