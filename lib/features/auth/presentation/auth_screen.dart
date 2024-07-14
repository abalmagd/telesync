import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:telesync/core/domain/constants/assets.dart';
import 'package:telesync/core/presentation/localization/locale_keys.dart';
import 'package:telesync/core/presentation/riverpod/theme_provider.dart';
import 'package:telesync/features/auth/presentation/riverpod/auth_controller.dart';
import 'package:telesync/features/auth/presentation/widgets/redirect_warning_sheet.dart';
import 'package:telesync/shared/widgets/telesync_appbar.dart';
import 'package:telesync/shared/widgets/telesync_button/telesync_button.dart';

class AuthScreen extends ConsumerWidget {
  const AuthScreen({super.key});
  static const route = '/auth';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final auth = ref.watch(authControllerProvider);
    final themeMode = ref.read(themeControllerProvider);
    return Scaffold(
      appBar: TelesyncAppBar(titleText: LocaleKeys.telesync.tr()),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        child: Column(
          children: [
            Text(
              LocaleKeys.onBoardingText.tr(),
              textAlign: TextAlign.center,
            ),
            Expanded(
              child: SvgPicture.asset(
                themeMode == ThemeMode.light
                    ? Assets.onboardingLight
                    : Assets.onboardingDark,
              ),
            ),
            TelesyncButton.primary(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  scrollControlDisabledMaxHeightRatio: 0.6,
                  builder: (context) => const RedirectWarningBottomSheet(),
                );
              },
              enabled: auth is! AsyncLoading,
              title: LocaleKeys.login.tr(),
            ),
            TelesyncButton.text(
              onPressed: () {},
              isLoading: auth is AsyncLoading,
              title: LocaleKeys.continueAsGuest.tr(),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
