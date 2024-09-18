import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:telesync/core/domain/localization/supported_locales.dart';
import 'package:telesync/core/presentation/riverpod/theme_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('blue'.tr()),
        actions: [
          IconButton(
            onPressed: () => ref.read(themeProvider.notifier).changeThemeMode(
                  MediaQuery.platformBrightnessOf(context),
                ),
            icon: const Icon(Icons.dark_mode),
          ),
          TextButton(
            onPressed: () => context.setLocale(
              SupportedLocales.supportedLocales[Languages.en.name]!,
            ),
            child: const Text('EN'),
          ),
          TextButton(
            onPressed: () => context
                .setLocale(SupportedLocales.supportedLocales[Languages.ar.name]!),
            child: const Text('AR'),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton(onPressed: () {}, child: const Text('Elevated BTN')),
          FilledButton(onPressed: () {}, child: const Text('Filled BTN')),
          TextButton(onPressed: () {}, child: const Text('Text BTN')),
        ],
      ),
    );
  }
}
