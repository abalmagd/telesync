import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telesync/core/data/local_storage/shared_prefs.dart';
import 'package:telesync/core/presentation/riverpod/theme_provider.dart';
import 'package:telesync/features/home_screen.dart';

import 'core/presentation/theme/custom_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  final sharedPrefs = await SharedPreferences.getInstance();
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      child: ProviderScope(
        overrides: [sharedPrefsProvider.overrideWithValue(sharedPrefs)],
        child: const TelesyncApp(),
      ),
    ),
  );
}

class TelesyncApp extends ConsumerWidget with CustomTheme {
  const TelesyncApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);
    return MaterialApp(
      title: 'Telesync',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: lightTheme(context),
      darkTheme: darkTheme(context),
      themeMode: themeMode,
      home: const HomeScreen(),
    );
  }
}
