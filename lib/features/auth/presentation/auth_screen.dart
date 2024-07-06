import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:telesync/core/domain/constants/assets.dart';
import 'package:telesync/shared/widgets/primary_appbar.dart';
import 'package:telesync/utils/extensions/string_extension.dart';

class AuthScreen extends ConsumerWidget {
  const AuthScreen({super.key});
  static const route = '/auth';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    // final auth = ref.watch(authControllerProvider);
    return Scaffold(
      appBar: PrimaryAppBar(titleText: 'App name'.hardcoded),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        child: Column(
          children: [
            Text('Strings.letsFindAMovie'.hardcoded),
            Expanded(
              child: Lottie.asset(
                Assets.landing,
                frameRate: const FrameRate(30),
              ),
            ),
            ElevatedButton(onPressed: () {}, child: const Text('Button')),
            Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  color: theme.colorScheme.surface,
                ),
                Container(
                  width: 50,
                  height: 50,
                  color: theme.colorScheme.onSurface,
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  color: theme.colorScheme.primary,
                ),
                Container(
                  width: 50,
                  height: 50,
                  color: theme.colorScheme.onPrimary,
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  color: theme.colorScheme.error,
                ),
                Container(
                  width: 50,
                  height: 50,
                  color: theme.colorScheme.onError,
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  color: theme.colorScheme.surface,
                ),
                Container(
                  width: 50,
                  height: 50,
                  color: theme.colorScheme.onSurface,
                ),
              ],
            ),
            /*PrimaryButton(
              onPressed: () => showModalBottomSheet(
                context: context,
                builder: (context) => const RedirectBottomSheet(),
              ),
              isLoading: auth is AsyncLoading,
              text: Strings.login,
            ),*/
            const SizedBox(height: 8),
            /*TextButton(
              onPressed: auth is AsyncLoading
                  ? null
                  : ref.read(authControllerProvider.notifier).loginAsGuest,
              child: const Text(Strings.continueAsGuest),
            ),*/
          ],
        ),
      ),
    );
  }
}

/*class RedirectBottomSheet extends ConsumerWidget {
  const RedirectBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    final auth = ref.watch(authControllerProvider);
    return Container(
      height: size.height * Constants.redirectBottomSheetHeightFactor,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        color: theme.scaffoldBackgroundColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(Strings.headsUp, style: theme.textTheme.titleLarge),
          const SizedBox(height: 4),
          const Text(Strings.redirectWarning),
          Expanded(
            child: SvgPicture.string(
              Assets.redirect.replaceAll(
                Constants.defaultSvgColor,
                theme.colorScheme.primary.toHex(),
              ),
            ),
          ),
          PrimaryButton(
            onPressed: () {
              ref.read(authControllerProvider.notifier).requestToken();
              Navigator.pop(context);
            },
            isLoading: auth is AsyncLoading,
            width: double.infinity,
            text: Strings.confirm,
          ),
        ],
      ),
    );
  }
}*/
