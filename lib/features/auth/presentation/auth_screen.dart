import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:telesync/core/domain/constants/assets.dart';
import 'package:telesync/core/presentation/localization/localization_keys.dart';
import 'package:telesync/core/presentation/riverpod/core_provider.dart';
import 'package:telesync/shared/widgets/telesync_appbar.dart';
import 'package:telesync/shared/widgets/telesync_button/telesync_button.dart';

class AuthScreen extends ConsumerWidget {
  const AuthScreen({super.key});
  static const route = '/auth';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final core = ref.read(coreControllerProvider.notifier);
    return Scaffold(
      appBar: TelesyncAppBar(titleText: LocalizationKeys.telesync.tr()),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        child: Column(
          children: [
            Text(
              LocalizationKeys.letsFindAMovie.tr(),
              style: theme.textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
            Expanded(
              child: Lottie.asset(
                Assets.landing,
                frameRate: const FrameRate(30),
              ),
            ),
            TelesyncButton.primary(
              onTap: () {
                core.changeThemeMode(context);
              },
              title: 'Login',
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
