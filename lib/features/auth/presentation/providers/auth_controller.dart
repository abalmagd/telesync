import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:telesync/core/domain/utils/alerts.dart';
import 'package:toastification/toastification.dart';
import 'package:url_launcher/url_launcher.dart';

final authController =
    AsyncNotifierProvider<AuthController, void>(AuthController.new);

class AuthController extends AsyncNotifier<void> with Alerts {
  @override
  void build() {}

  void getRequestToken() {

  }

  Future<void> openBrowser() async {
    try {
      await launchUrl(
        mode: LaunchMode.externalApplication,
        Uri.parse('https://www.themoviedb.org/authenticate/bb824a7bcc78a9702a20e68675ca754d34b5576b'),
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
