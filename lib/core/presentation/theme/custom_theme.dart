import 'package:flutter/material.dart';
import 'package:telesync/core/presentation/theme/palette.dart';

mixin CustomTheme {
  ThemeData lightTheme(BuildContext context) {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: Palette.scaffoldBgLight,
      colorScheme: const ColorScheme.light(
        brightness: Brightness.light,
        primary: Palette.primaryLight,
        onPrimary: Palette.white,
      ),
    );
  }

  ThemeData darkTheme(BuildContext context) {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: Palette.scaffoldBgDark,
      colorScheme: const ColorScheme.dark(
        brightness: Brightness.dark,
        primary: Palette.primaryDark,
        onPrimary: Palette.white,
      ),
    );
  }
}
