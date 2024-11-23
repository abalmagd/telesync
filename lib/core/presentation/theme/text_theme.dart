import 'package:flutter/material.dart';

class CustomTextTheme {
  static TextTheme textTheme(BuildContext context) {
    final theme = Theme.of(context);
    return TextTheme(
      titleLarge: theme.textTheme.titleLarge?.copyWith(
        fontSize: 24,
        fontWeight: FontWeight.w600,
      ),
      titleMedium: theme.textTheme.titleMedium?.copyWith(
        fontSize: 24,
        fontWeight: FontWeight.w500,
      ),
      titleSmall: theme.textTheme.titleSmall?.copyWith(
        fontSize: 20,
        fontWeight: FontWeight.w400,
      ),
      labelLarge: theme.textTheme.labelSmall?.copyWith(
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      labelMedium: theme.textTheme.labelSmall?.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      labelSmall: theme.textTheme.labelSmall?.copyWith(
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
    ).apply(fontFamily: 'Poppins');
  }
}
