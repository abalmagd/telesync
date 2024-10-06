import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:telesync/core/data/networking/remote.dart';
import 'package:telesync/core/domain/utils/alerts.dart';
import 'package:telesync/features/auth/domain/auth_service.dart';
import 'package:telesync/features/auth/domain/models/session.dart';
import 'package:toastification/toastification.dart';
import 'package:url_launcher/url_launcher.dart';

final authController =
    AsyncNotifierProvider<AuthController, Session?>(AuthController.new);

class AuthController extends AsyncNotifier<Session?> with Alerts {
  late final AuthServiceAbstraction authService;

  @override
  FutureOr<Session?> build() {
    authService = ref.read(authServiceProvider);

    return null;
  }

  Future<void> createRequestToken() async {
    state = const AsyncLoading();
    final result = await authService.createRequestToken();

    result.fold(
      (failure) {
        state = AsyncError(failure, StackTrace.current);
        failure.toast();
      },
      (session) {
        state = AsyncData(session);
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
}
