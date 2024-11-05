import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telesync/core/data/local/shared_prefs.dart';
import 'package:telesync/core/data/networking/remote.dart';
import 'package:telesync/core/domain/utils/alerts.dart';
import 'package:telesync/features/auth/data/auth_repository.dart';
import 'package:telesync/features/auth/domain/models/session.dart';
import 'package:toastification/toastification.dart';
import 'package:url_launcher/url_launcher.dart';

final authController =
    AsyncNotifierProvider<AuthController, Session?>(AuthController.new);

class AuthController extends AsyncNotifier<Session?> with Alerts {
  late final AuthRepoAbstraction authRepo;
  late final SharedPreferences sharedPrefs;

  @override
  FutureOr<Session?> build() {
    authRepo = ref.read(authRepoProvider);
    sharedPrefs = ref.read(sharedPrefsProvider);
    final session = fetchCachedSession();
    return session;
  }

  void checkSessionDetails() {
    if (state.value == null) {
      createRequestToken();
      return;
    } else if (DateTime.now().isAfter(state.value!.expiresAt)) {
      createRequestToken();
      return;
    }

    openBrowser(state.value!.requestToken);
  }

  Future<void> createRequestToken() async {
    state = const AsyncLoading();
    final result = await authRepo.createRequestToken();

    result.fold(
      (failure) {
        state = AsyncError(failure, StackTrace.current);
        failure.toast();
      },
      (session) {
        state = AsyncData(session);
        cacheSession(session);
        openBrowser(session.requestToken);
      },
    );
  }

  Future<void> openBrowser(String requestToken) async {
    try {
      await launchUrl(
        mode: LaunchMode.externalApplication,
        Uri.parse('${Remote.tmdbLogin}/$requestToken'),
      )
          ? null
          : showToast(
              // TODO: Localize
              message: 'Failed to redirect',
              type: ToastificationType.error,
            );
    } on PlatformException catch (e) {
      showToast(
        message: 'Failed to redirect ${e.code}',
        type: ToastificationType.error,
      );
    }
  }

  void cacheSession(Session session) {
    // TODO:: Use secure storage
    sharedPrefs.setString(
      SharedPrefsKeys.session,
      jsonEncode(session.toMap()),
    );
  }

  Session? fetchCachedSession() {
    // TODO:: Use secure storage
    final sessionString = sharedPrefs.getString(SharedPrefsKeys.session);

    if (sessionString == null) return null;

    final session = Session.fromJson(jsonDecode(sessionString));

    return session;
  }

  Future<void> login() async {
    final session = state.value;
    if (session == null || session.sessionId != null) return;

    state = const AsyncLoading();
    final result = await authRepo.login(session.requestToken);

    result.fold(
      (failure) {
        state = const AsyncData(null);
        state = AsyncError(failure, StackTrace.current);
        failure.toast();
      },
      (sessionId) {
        state = AsyncData(state.value?.copyWith(sessionId: sessionId));
        if (state.value != null) cacheSession(state.value!);
      },
    );
  }
}
