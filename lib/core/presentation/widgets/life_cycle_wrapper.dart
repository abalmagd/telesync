import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:telesync/features/auth/presentation/providers/auth_controller.dart';

class LifeCycleWrapper extends ConsumerStatefulWidget {
  const LifeCycleWrapper({super.key, required this.child});

  final MaterialApp child;

  @override
  ConsumerState<LifeCycleWrapper> createState() => _LifeCycleWrapperState();
}

class _LifeCycleWrapperState extends ConsumerState<LifeCycleWrapper>
    with WidgetsBindingObserver {
  @override
  initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        ref.read(authController.notifier).login();
      case AppLifecycleState.inactive:
      case AppLifecycleState.paused:
      case AppLifecycleState.detached:
      case AppLifecycleState.hidden:
        break;
    }
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
