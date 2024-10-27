import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class LifeCycleWrapper extends HookWidget {
  const LifeCycleWrapper({
    super.key,
    required this.child,
  });

  final MaterialApp child;

  @override
  Widget build(BuildContext context) {
    final lifeCycle = useAppLifecycleState();
    useEffect(() {
      switch (lifeCycle) {
        case AppLifecycleState.resumed:
          print('check session');
        case AppLifecycleState.inactive:
        case AppLifecycleState.detached:
        case AppLifecycleState.hidden:
        case AppLifecycleState.paused:
        case null:
      }
      return null;
    }, [lifeCycle]);
    return child;
  }
}
