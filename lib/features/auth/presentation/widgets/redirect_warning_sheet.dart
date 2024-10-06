import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:telesync/core/domain/constants/assets.dart';
import 'package:telesync/core/domain/localization/locale_keys.g.dart';
import 'package:telesync/core/presentation/riverpod/theme_provider.dart';
import 'package:telesync/core/presentation/widgets/telesync_button/telesync_button.dart';
import 'package:telesync/features/auth/presentation/providers/auth_controller.dart';

class RedirectWarningSheet extends ConsumerWidget {
  const RedirectWarningSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final controller = ref.watch(authController);
    final themeMode = ref.read(themeProvider);
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        color: theme.scaffoldBackgroundColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            LocaleKeys.headsUp.tr(),
            style: theme.textTheme.titleLarge,
          ),
          const Gap(4),
          Text(LocaleKeys.redirectWarning.tr()),
          Expanded(
            child: SvgPicture.asset(
              themeMode == ThemeMode.light
                  ? Assets.redirectLight
                  : Assets.redirectDark,
            ),
          ),
          TelesyncButton.primary(
            onPressed: () {
              ref.read(authController.notifier).createRequestToken();
            },
            isLoading: controller is AsyncLoading,
            title: LocaleKeys.confirm.tr(),
          ),
        ],
      ),
    );
  }
}
