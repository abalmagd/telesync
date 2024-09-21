import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telesync/core/data/local/shared_prefs.dart';
import 'package:telesync/features/auth/domain/auth_service.dart';
import 'package:telesync/features/auth/domain/models/session.dart';

final authControllerProvider =
    AsyncNotifierProvider<AuthController, Session?>(AuthController.new);

class AuthController extends AsyncNotifier<Session?> {
  late final SharedPreferences prefs;
  late final AuthService service;
  @override
  FutureOr<Session?> build() {
    prefs = ref.read(sharedPrefsProvider);
    service = ref.read(authServiceProvider);
    final session = Session.loadSession(prefs);

    return session;
  }

  Future<void> login({
    required String email,
    required String password,
  }) async {
    state = const AsyncLoading();
    final result = await service.login(
      email: email,
      password: password,
    );

    return result.fold(
      (failure) {
        failure.toast();
        state = AsyncError(failure, StackTrace.current);
      },
      (session) {
        state = AsyncData(session);
        print(session.toMap().toString());
        // toast
        // navigate to home
      },
    );
  }
}
