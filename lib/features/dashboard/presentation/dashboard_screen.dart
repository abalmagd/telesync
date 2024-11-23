import 'dart:math';
import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:telesync/core/domain/localization/locale_keys.g.dart';
import 'package:telesync/core/presentation/theme/palette.dart';
import 'package:telesync/core/presentation/widgets/telesync_appbar.dart';
import 'package:telesync/features/dashboard/presentation/dashboard_controller.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      extendBody: true,
      appBar: TelesyncAppBar(titleText: LocaleKeys.telesync.tr()),
      body: PageView(
        controller:
            ref.read(dashboardControllerProvider.notifier).pageController,
        onPageChanged: (index) {
          ref.read(dashboardControllerProvider.notifier).changeIndex(
                index: index,
                fromPageView: true,
              );
        },
        children: ref.read(dashboardControllerProvider.notifier).screens,
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 32),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: BottomNavigationBar(
              elevation: 0,
              backgroundColor: Palette.white.withOpacity(0.20),
              type: BottomNavigationBarType.fixed,
              currentIndex: ref.watch(dashboardControllerProvider),
              onTap: (index) {
                ref
                    .read(dashboardControllerProvider.notifier)
                    .changeIndex(index: index);
              },
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.abc),
                  label: 'label 1',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.abc),
                  label: 'label 2',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.abc),
                  label: 'label 3',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.abc),
                  label: 'label 4',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
