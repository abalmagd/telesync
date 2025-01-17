import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:telesync/core/presentation/riverpod/theme_provider.dart';

class ThemeSwitch extends ConsumerWidget {
  const ThemeSwitch({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      onPressed: () =>
          ref.read(themeControllerProvider.notifier).changeThemeMode(context),
      icon: const Icon(Icons.dark_mode),
    );
  }
}
