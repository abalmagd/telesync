import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:telesync/core/domain/utils/extensions/ref_listenable.dart';
import 'package:telesync/features/auth/presentation/auth_screen.dart';
import 'package:telesync/features/auth/presentation/providers/auth_controller.dart';
import 'package:telesync/features/dashboard/dashboard_screen.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/auth',
    debugLogDiagnostics: kDebugMode,
    redirect: (context, state) {
      print('redirect');
      final isLoggedIn =
          ref.watch(authController).valueOrNull?.sessionId != null;
      print(isLoggedIn);

      if (isLoggedIn) return '/dashboard';
      return '/auth';
    },
    refreshListenable: ref.asValueListenable(authController),
    routes: [
      GoRoute(
        path: '/auth',
        builder: (context, state) {
          return const AuthScreen();
        },
      ),
      GoRoute(
        path: '/dashboard',
        builder: (context, state) {
          return const DashboardScreen();
        },
      ),
    ],
  );
});
