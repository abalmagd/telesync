import 'package:flutter/material.dart';
import 'package:telesync/core/presentation/theme/palette.dart';

mixin CustomTheme {
  ThemeData lightTheme(BuildContext context) {
    return ThemeData(
      useMaterial3: true,
      primaryColor: Palette.primary.color,
      brightness: Brightness.light,
      scaffoldBackgroundColor: Palette.scaffoldBgLight.color,
      colorScheme: ColorScheme.fromSeed(
        seedColor: Palette.primary.color,
        brightness: Brightness.light,
      ),
      appBarTheme: AppBarTheme(backgroundColor: Palette.scaffoldBgLight.color),
      dividerTheme: const DividerThemeData(thickness: 1.6, space: 0),
    );
  }

  ThemeData darkTheme(BuildContext context) {
    return ThemeData(
      useMaterial3: true,
      primaryColor: Palette.primary.color,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: Palette.scaffoldBgDark.color,
      colorScheme: ColorScheme.fromSeed(
        seedColor: Palette.primary.color,
        surface: Palette.scaffoldBgDark.color,
        brightness: Brightness.dark,
      ),
      dividerTheme: const DividerThemeData(thickness: 1.6, space: 0),
    );
  }
}
