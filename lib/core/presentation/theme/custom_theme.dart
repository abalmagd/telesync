import 'package:flutter/material.dart';
import 'package:telesync/core/presentation/theme/palette.dart';

mixin CustomTheme {
  ThemeData _baseTheme(Color primary) => ThemeData(
        dividerTheme: const DividerThemeData(thickness: 1.6, space: 0),
        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            backgroundColor: primary,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            fixedSize: const Size.fromHeight(46),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: FilledButton.styleFrom(
            backgroundColor: primary,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            fixedSize: const Size.fromHeight(46),
          ),
        ),
      );

  ThemeData lightTheme(BuildContext context) {
    final base = _baseTheme(Palette.primaryLight);
    return ThemeData(
      useMaterial3: true,
      primaryColor: Palette.primaryLight,
      brightness: Brightness.light,
      scaffoldBackgroundColor: Palette.scaffoldBgLight,
      filledButtonTheme: base.filledButtonTheme,
      outlinedButtonTheme: base.outlinedButtonTheme,
      dividerTheme: base.dividerTheme,
    );
  }

  ThemeData darkTheme(BuildContext context) {
    final base = _baseTheme(Palette.primaryDark);
    return ThemeData(
      useMaterial3: true,
      primaryColor: Palette.primaryDark,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: Palette.scaffoldBgDark,
      filledButtonTheme: base.filledButtonTheme,
      outlinedButtonTheme: base.outlinedButtonTheme,
      dividerTheme: base.dividerTheme,
    );
  }
}
