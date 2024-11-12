import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:telesync/core/domain/localization/locale_keys.g.dart';
import 'package:telesync/core/presentation/widgets/telesync_button/telesync_button.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TelesyncButton.primary(
          onPressed: () {},
          title: LocaleKeys.confirm.tr(),
        ),
      ),
    );
  }
}
