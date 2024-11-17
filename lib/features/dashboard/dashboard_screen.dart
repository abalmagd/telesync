import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:telesync/core/domain/localization/locale_keys.g.dart';
import 'package:telesync/core/presentation/widgets/telesync_button/telesync_button.dart';
import 'package:telesync/features/auth/presentation/providers/auth_controller.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: TelesyncButton.primary(
          onPressed: () {
            ref.read(authController.notifier).logout();
          },
          title: LocaleKeys.confirm.tr(),
        ),
      ),
    );
  }
}
