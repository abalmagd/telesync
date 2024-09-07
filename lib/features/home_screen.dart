import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
            onPressed: () => context.setLocale(const Locale('en')),
            child: const Text('EN'),
          ),
          TextButton(
            onPressed: () => context.setLocale(const Locale('ar')),
            child: const Text('AR'),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton(onPressed: () {}, child: Text('Elevated BTN')),
          FilledButton(onPressed: () {}, child: Text('Filled BTN')),
          TextButton(onPressed: () {}, child: Text('Text BTN')),
        ],
      ),
    );
  }
}
