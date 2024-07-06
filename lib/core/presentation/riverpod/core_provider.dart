import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:telesync/core/data/local_storage/storage_keys.dart';
import 'package:telesync/core/data/local_storage/shared_prefs.dart';
import 'package:telesync/utils/helpers/alerts.dart';

final coreControllerProvider =
    NotifierProvider<CoreController, ThemeMode>(CoreController.new);

class CoreController extends Notifier<ThemeMode> with Alerts {
  late final SharedPrefs _sharedPrefs;

  @override
  ThemeMode build() {
    _sharedPrefs = ref.read(sharedPrefsProvider);

    final ThemeMode themeMode = getThemeMode() ?? ThemeMode.system;

    logPrint(message: 'Building $runtimeType');

    return themeMode;
  }

  ThemeMode? getThemeMode() {
    final localThemeMode =
        _sharedPrefs.getString(key: StorageKeys.themeMode.name);

    return EnumToString.fromString(
      ThemeMode.values,
      localThemeMode ?? ThemeMode.dark.name,
    );
  }

  void changeThemeMode(BuildContext context) async {
    switch (state) {
      case ThemeMode.system:
        state = MediaQuery.of(context).platformBrightness == Brightness.light
            ? state = ThemeMode.dark
            : state = ThemeMode.light;
        break;
      case ThemeMode.light:
        state = ThemeMode.dark;
        break;
      case ThemeMode.dark:
        state = ThemeMode.light;
        break;
    }

    _sharedPrefs.set(
      key: StorageKeys.themeMode.name,
      value: EnumToString.convertToString(state),
    );

    logPrint(message: 'Theme Mode changed to $state');
  }
}
