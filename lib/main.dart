import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telesync/core/data/local_storage/shared_prefs.dart';
import 'package:telesync/core/domain/constants/assets.dart';
import 'package:telesync/core/domain/routing/go_router.dart';
import 'package:telesync/core/presentation/localization/localization.dart';
import 'package:telesync/core/presentation/riverpod/locale_provider.dart';
import 'package:telesync/core/presentation/riverpod/theme_provider.dart';
import 'package:telesync/core/presentation/theme/custom_theme.dart';
import 'package:telesync/shared/widgets/life_cycle_wrapper.dart';
import 'package:toastification/toastification.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  final sharedPreferences = await SharedPreferences.getInstance();
  await dotenv.load();
  runApp(
    EasyLocalization(
      supportedLocales: Localization.supportedLocales.values.toList(),
      path: Assets.translations,
      useOnlyLangCode: true,
      child: TelesyncApp(sharedPreferences: sharedPreferences),
    ),
  );
}

class TelesyncApp extends StatelessWidget with CustomTheme {
  TelesyncApp({super.key, required this.sharedPreferences});

  final SharedPreferences sharedPreferences;

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(sharedPreferences),
        localeProvider.overrideWithValue(context.locale),
      ],
      child: Consumer(
        builder: (context, ref, child) => ToastificationWrapper(
          child: AppLifeCycleWrapper(
            child: MaterialApp.router(
              title: 'Telesync',
              debugShowCheckedModeBanner: false,
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              theme: lightTheme(context),
              darkTheme: darkTheme(context),
              themeMode: ref.watch(themeControllerProvider),
              routerConfig: ref.read(goRouterProvider),
            ),
          ),
        ),
      ),
    );
  }
}
