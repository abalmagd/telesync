import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:telesync/core/domain/constants/assets.dart';
import 'package:telesync/core/domain/utils/extensions/string_extention.dart';
import 'package:telesync/core/presentation/theme/palette.dart';
import 'package:telesync/core/presentation/widgets/telesync_appbar.dart';
import 'package:telesync/features/dashboard/presentation/dashboard_controller.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorFilter = ColorFilter.mode(
      theme.colorScheme.primary,
      BlendMode.srcIn,
    );
    return Scaffold(
      extendBody: true,
      appBar: TelesyncAppBar(
        leading: Builder(builder: (context) {
          return IconButton(
            onPressed: Scaffold.of(context).openDrawer,
            icon: SvgPicture.asset(
              Assets.menu,
              colorFilter: ColorFilter.mode(
                theme.iconTheme.color!,
                BlendMode.srcIn,
              ),
            ),
          );
        }),
        actions: [
          IconButton(
            onPressed: () {
              // TODO:: Search
            },
            icon: SvgPicture.asset(
              Assets.search,
              colorFilter: ColorFilter.mode(
                theme.iconTheme.color!,
                BlendMode.srcIn,
              ),
            ),
          ),
        ],
      ),
      // TODO:: Create drawer widget
      drawer: const Text('Drawer'),
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
              backgroundColor: Palette.smoke.withOpacity(0.20),
              type: BottomNavigationBarType.fixed,
              currentIndex: ref.watch(dashboardControllerProvider),
              onTap: (index) {
                ref
                    .read(dashboardControllerProvider.notifier)
                    .changeIndex(index: index);
              },
              showSelectedLabels: false,
              showUnselectedLabels: false,
              items: [
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(Assets.homeFilled),
                  activeIcon: SvgPicture.asset(
                    Assets.homeFilled,
                    colorFilter: colorFilter,
                  ),
                  label: 'Home'.hardcoded,
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(Assets.heartFilled),
                  activeIcon: SvgPicture.asset(
                    Assets.heartFilled,
                    colorFilter: colorFilter,
                  ),
                  label: 'Favorites'.hardcoded,
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(Assets.libraryFilled),
                  activeIcon: SvgPicture.asset(
                    Assets.libraryFilled,
                    colorFilter: colorFilter,
                  ),
                  label: 'Library'.hardcoded,
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(Assets.profileFilled),
                  activeIcon: SvgPicture.asset(
                    Assets.profileFilled,
                    colorFilter: colorFilter,
                  ),
                  label: 'Profile'.hardcoded,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
