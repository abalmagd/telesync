import 'package:flutter/material.dart';
import 'package:telesync/core/domain/constants/spacing.dart';
import 'package:telesync/core/presentation/theme/palette.dart';

mixin CustomTheme {
  ThemeData lightTheme(BuildContext context) {
    return ThemeData(
      useMaterial3: true,
      primaryColor: Palette.primaryLight,
      brightness: Brightness.light,
      scaffoldBackgroundColor: Palette.scaffoldBgLight,
      colorScheme: ColorScheme.fromSeed(
        seedColor: Palette.primaryLight,
        brightness: Brightness.light,
        dynamicSchemeVariant: DynamicSchemeVariant.fidelity,
        primary: Palette.primaryLight,
        onPrimary: Palette.onPrimary,
      ),
      dividerTheme: const DividerThemeData(thickness: 1.6, space: 0),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Spacing.buttonBorderRadius),
          ),
          fixedSize: const Size.fromHeight(46),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: FilledButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Spacing.buttonBorderRadius),
          ),
          fixedSize: const Size.fromHeight(46),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Spacing.buttonBorderRadius),
          ),
        ),
      ),
    );
  }

  ThemeData darkTheme(BuildContext context) {
    return ThemeData(
      useMaterial3: true,
      primaryColor: Palette.primaryDark,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: Palette.scaffoldBgDark,
      colorScheme: ColorScheme.fromSeed(
        seedColor: Palette.primaryDark,
        brightness: Brightness.dark,
        dynamicSchemeVariant: DynamicSchemeVariant.fidelity,
        primary: Palette.primaryDark,
        onPrimary: Palette.onPrimary,
        onSurface: Palette.white,
      ),
      dividerTheme: const DividerThemeData(thickness: 1.6, space: 0),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Spacing.buttonBorderRadius),
          ),
          fixedSize: const Size.fromHeight(46),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: FilledButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Spacing.buttonBorderRadius),
          ),
          fixedSize: const Size.fromHeight(46),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Spacing.buttonBorderRadius),
          ),
        ),
      ),
    );
  }
}
