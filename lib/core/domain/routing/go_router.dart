import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:telesync/features/auth/presentation/auth_screen.dart';

final goRouterProvider = Provider.autoDispose<GoRouter>(
  (ref) {
    return GoRouter(
      initialLocation: AuthScreen.route,
      debugLogDiagnostics: true,
      redirect: (context, state) {
        return null;
      },
      routes: [
        GoRoute(
          path: AuthScreen.route,
          builder: (context, state) => const AuthScreen(),
        ),
      ],
    );
  },
);
