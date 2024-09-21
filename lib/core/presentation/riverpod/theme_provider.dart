import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telesync/core/data/local/shared_prefs.dart';

final themeProvider =
    NotifierProvider<ThemeController, ThemeMode>(ThemeController.new);

class ThemeController extends Notifier<ThemeMode> {
  late final SharedPreferences sharedPrefs;

  @override
  ThemeMode build() {
    sharedPrefs = ref.read(sharedPrefsProvider);
    final ThemeMode themeMode = getThemeMode();
    return themeMode;
  }

  void changeThemeMode(Brightness brightness) {
    switch (state) {
      case ThemeMode.system:
        state =
            brightness == Brightness.light ? ThemeMode.dark : ThemeMode.light;
      case ThemeMode.light:
        state = ThemeMode.dark;
        sharedPrefs.setBool(SharedPrefsKeys.themeMode, true);
      case ThemeMode.dark:
        state = ThemeMode.light;
        sharedPrefs.setBool(SharedPrefsKeys.themeMode, false);
    }
  }

  ThemeMode getThemeMode() {
    final isDark = sharedPrefs.getBool(SharedPrefsKeys.themeMode) ?? true;

    return isDark ? ThemeMode.dark : ThemeMode.light;
  }
}