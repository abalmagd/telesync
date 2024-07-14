import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:telesync/core/domain/constants/assets.dart';
import 'package:telesync/core/presentation/localization/localization_keys.dart';
import 'package:telesync/features/auth/presentation/riverpod/auth_controller.dart';
import 'package:telesync/shared/widgets/telesync_appbar.dart';
import 'package:telesync/shared/widgets/telesync_button/telesync_button.dart';

class AuthScreen extends ConsumerWidget {
  const AuthScreen({super.key});
  static const route = '/auth';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final auth = ref.watch(authControllerProvider);
    return Scaffold(
      appBar: TelesyncAppBar(titleText: LocalizationKeys.telesync.tr()),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
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
              onPressed: () {
                /*showModalBottomSheet(
                  context: context,
                  scrollControlDisabledMaxHeightRatio: 0.6,
                  builder: (context) => const RedirectWarningBottomSheet(),
                );*/
              },
              isLoading: auth is AsyncLoading,
              title: LocalizationKeys.login.tr(),
            ),
            TelesyncButton.text(
              onPressed: () {},
              isLoading: auth is AsyncLoading,
              title: LocalizationKeys.continueAsGuest.tr(),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
