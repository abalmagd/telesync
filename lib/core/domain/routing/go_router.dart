import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:telesync/features/auth/presentation/auth_screen.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/auth',
    debugLogDiagnostics: kDebugMode,
    routes: [
      GoRoute(
        path: '/auth',
        builder: (context, state) {
          return const AuthScreen();
        },
      ),
    ],
  );
});
