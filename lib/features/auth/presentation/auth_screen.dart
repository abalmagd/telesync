import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telesync/core/domain/constants/assets.dart';
import 'package:telesync/core/domain/localization/locale_keys.g.dart';
import 'package:telesync/core/domain/utils/extensions/context_extension.dart';
import 'package:telesync/core/presentation/riverpod/theme_provider.dart';
import 'package:telesync/core/presentation/widgets/telesync_appbar.dart';
import 'package:telesync/core/presentation/widgets/telesync_button/telesync_button.dart';
import 'package:telesync/features/auth/presentation/providers/auth_controller.dart';

import 'widgets/redirect_warning_sheet.dart';

class AuthScreen extends ConsumerWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.read(themeProvider);
    return Scaffold(
      appBar: TelesyncAppBar(titleText: LocaleKeys.telesync.tr()),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              LocaleKeys.welcomeText.tr(),
              style: context.theme.textTheme.titleLarge,
            ),
            Expanded(
              child: SvgPicture.asset(
                themeMode == ThemeMode.dark
                    ? Assets.onboardingDark
                    : Assets.onboardingLight,
              ),
            ),
            TelesyncButton.primary(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  scrollControlDisabledMaxHeightRatio: 0.8,
                  builder: (context) => RedirectWarningSheet(
                    onAccept:
                        ref.read(authController.notifier).checkSessionDetails,
                  ),
                );
              },
              title: LocaleKeys.login.tr(),
            ),
            TelesyncButton.text(
              onPressed: () async {
                final prefs = await SharedPreferences.getInstance();
                prefs.clear();
              },
              title: 'Clear',
            ),
          ],
        ),
      ),
    );
  }
}
