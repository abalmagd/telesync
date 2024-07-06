import 'dart:async';
import 'dart:convert';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:telesync/core/data/local_storage/shared_prefs.dart';
import 'package:telesync/core/data/local_storage/storage_keys.dart';
import 'package:telesync/core/data/networking/remote.dart';
import 'package:telesync/features/auth/domain/auth_service.dart';
import 'package:telesync/features/auth/domain/models/session.dart';
import 'package:telesync/utils/helpers/alerts.dart';
import 'package:toastification/toastification.dart';
import 'package:url_launcher/url_launcher.dart';

import 'auth_state.dart';

final authControllerProvider =
    AsyncNotifierProvider<AuthController, AuthState>(AuthController.new);

class AuthController extends AsyncNotifier<AuthState> with Alerts {
  late final SharedPrefs _sharedPrefs;
  late final AuthServiceAbstraction _authService;

  @override
  FutureOr<AuthState> build() {
    _sharedPrefs = ref.read(sharedPrefsProvider);
    _authService = ref.read(authServiceProvider);
    final sessionString = _sharedPrefs.getString(key: StorageKeys.session.name);

    final session = sessionString != null && sessionString.isNotEmpty
        ? Session.fromRawJson(sessionString)
        : Session.empty;

    logPrint(message: 'Building $runtimeType');
    logData(session: session);
    return AuthState(session: session);
  }

  void logData({Session? session}) {
    logPrint(message: (session ?? state.value?.session).toString());
  }

  void setSession({Session? session}) {
    if (session != null) {
      state = AsyncData(state.value!.copyWith(session: session));
      _sharedPrefs.set(
        key: StorageKeys.session.name,
        value: session.toRawJson(),
      );

      logData();
      return;
    }

    final sessionRequestJson =
        _sharedPrefs.getString(key: StorageKeys.sessionRequest.name);

    if (sessionRequestJson != null) {
      final sessionRequest = jsonDecode(sessionRequestJson);
      final String expiresAt = sessionRequest['expires_at'];
      state = AsyncData(
        state.value!.copyWith(
          requestToken: sessionRequest['request_token'],
          expiresAt: sessionRequest['expires_at'],
        ),
      );
      final now = DateTime.now();
      final dateString = expiresAt.replaceAll(' UTC', 'Z').trim();
      if (DateTime.parse(dateString).toLocal().isAfter(now)) {
        login();
      }
    }
  }

  void loginAsGuest() async {
    state = const AsyncLoading();

    final result = await _authService.loginAsGuest();

    result.fold(
      (failure) {
        state = AsyncError(failure, StackTrace.current);
        failure.toast();
      },
      (session) => setSession(session: session),
    );
  }

  void requestToken() async {
    state = const AsyncLoading();

    final result = await _authService.createRequestToken();

    result.fold(
      (failure) {
        state = AsyncError(failure, StackTrace.current);
        failure.toast();
      },
      (sessionRequest) async {
        _sharedPrefs.set(
          key: StorageKeys.sessionRequest.name,
          value: jsonEncode(sessionRequest),
        );

        state = AsyncData(
          state.value!.copyWith(
            requestToken: sessionRequest['request_token'],
            expiresAt: sessionRequest['expires_at'],
          ),
        );

        final Uri url = Uri.parse(
          '${Remote.tmdbDomain}'
          'authenticate/${sessionRequest['request_token']}',
        );

        await launchUrl(url, mode: LaunchMode.externalApplication)
            ? null
            : showToast(
                message:
                    'Failed to redirect, please make sure you have a browser',
                severity: ToastificationType.error,
              );
      },
    );
  }

  void login() async {
    state = const AsyncLoading();

    final result =
        await _authService.login(requestToken: state.value!.requestToken);

    result.fold(
      (failure) {
        state = AsyncError(failure, StackTrace.current);
        failure.toast();
      },
      (session) {
        setSession(session: session);
        _sharedPrefs.remove(key: StorageKeys.sessionRequest.name);
        showToast(message: 'Login Success!');
      },
    );
  }

  Future<void> logout() async {
    state = const AsyncLoading();

    if (state.value!.session.isGuest) {
      setSession(session: Session.empty);
      showToast(message: 'Logout Success!');
      return;
    }

    final result =
        await _authService.logout(sessionId: state.value!.session.sessionId);

    result.fold(
      (failure) {
        state = AsyncError(failure, StackTrace.current);
        failure.toast();
      },
      (success) {
        setSession(session: Session.empty);
        showToast(message: 'Logout Success!');
      },
    );
  }
}
