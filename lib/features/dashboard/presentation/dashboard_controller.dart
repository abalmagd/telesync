import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dashboardControllerProvider =
    AutoDisposeNotifierProvider<DashboardController, int>(
  DashboardController.new,
);

class DashboardController extends AutoDisposeNotifier<int> {
  late final PageController pageController;

  final screens = [
    const Center(child: Text('1')),
    const Center(child: Text('2')),
    const Center(child: Text('3')),
    const Center(child: Text('4')),
  ];

  @override
  int build() {
    pageController = PageController();
    ref.onDispose(() => pageController.dispose());
    return 0;
  }

  void changeIndex({required int index, bool fromPageView = false}) {
    state = index;
    if (!fromPageView) {
      pageController.animateToPage(
        index,
        curve: Curves.easeInOut,
        duration: Durations.long2,
      );
    }
  }
}
