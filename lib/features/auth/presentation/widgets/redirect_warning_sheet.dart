import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:telesync/core/domain/constants/assets.dart';
import 'package:telesync/core/presentation/localization/locale_keys.dart';
import 'package:telesync/core/presentation/riverpod/theme_provider.dart';
import 'package:telesync/features/auth/presentation/riverpod/auth_controller.dart';
import 'package:telesync/shared/widgets/telesync_button/telesync_button.dart';

class RedirectWarningBottomSheet extends ConsumerWidget {
  const RedirectWarningBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final auth = ref.watch(authControllerProvider);
    final themeMode = ref.read(themeControllerProvider);
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
          const SizedBox(height: 4),
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
              ref.read(authControllerProvider.notifier).requestToken();
              context.pop();
            },
            isLoading: auth is AsyncLoading,
            title: LocaleKeys.confirm.tr(),
          ),
        ],
      ),
    );
  }
}
