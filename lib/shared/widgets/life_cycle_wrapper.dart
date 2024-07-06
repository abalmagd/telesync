import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:telesync/utils/helpers/alerts.dart';

class AppLifeCycleWrapper extends StatelessWidget with Alerts {
  const AppLifeCycleWrapper({super.key, required this.child});

  final MaterialApp child;

  @override
  Widget build(BuildContext context) {
    final appLifeCycle = useAppLifecycleState();
    useEffect(
      () {
        logPrint(message: 'Current app state: $appLifeCycle');
        switch (appLifeCycle) {
          // TODO: Handle these cases
          case AppLifecycleState.resumed:
            break;
          case AppLifecycleState.inactive:
            break;
          case AppLifecycleState.paused:
            break;
          case AppLifecycleState.detached:
            break;
          case AppLifecycleState.hidden:
            break;
          case null:
            break;
        }
        return null;
      },
      [appLifeCycle],
    );
    return child;
  }
}
