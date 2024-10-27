import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telesync/core/data/local/shared_prefs.dart';
import 'package:telesync/core/domain/constants/assets.dart';
import 'package:telesync/core/domain/localization/locale_provider.dart';
import 'package:telesync/core/domain/routing/go_router.dart';
import 'package:telesync/core/presentation/riverpod/theme_provider.dart';
import 'package:telesync/core/presentation/widgets/life_cycle_wrapper.dart';
import 'package:toastification/toastification.dart';

import 'core/domain/localization/supported_locales.dart';
import 'core/presentation/theme/custom_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  runApp(
    EasyLocalization(
      supportedLocales: SupportedLocales.supportedLocales.values.toList(),
      path: Assets.translations,
      fallbackLocale: SupportedLocales.supportedLocales[Languages.en.name],
      child: TelesyncApp(prefs: prefs),
    ),
  );
}

class TelesyncApp extends StatelessWidget with CustomTheme {
  const TelesyncApp({super.key, required this.prefs});

  final SharedPreferences prefs;

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      overrides: [
        sharedPrefsProvider.overrideWithValue(prefs),
        localeProvider.overrideWithValue(context.locale),
      ],
      child: Consumer(
        builder: (context, ref, _) {
          final themeMode = ref.watch(themeProvider);
          return ToastificationWrapper(
            child: LifeCycleWrapper(
              child: MaterialApp.router(
                title: 'Telesync',
                debugShowCheckedModeBanner: false,
                localizationsDelegates: context.localizationDelegates,
                supportedLocales: context.supportedLocales,
                locale: context.locale,
                theme: lightTheme(context),
                darkTheme: darkTheme(context),
                themeMode: themeMode,
                routerConfig: ref.read(goRouterProvider),
              ),
            ),
          );
        },
      ),
    );
  }
}
