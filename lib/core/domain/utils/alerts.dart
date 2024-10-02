import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';
import 'package:toastification/toastification.dart';

mixin Alerts {
  void logPrint({
    required String message,
    Level level = Level.info,
    StackTrace? stackTrace,
    Object? error,
  }) {
    if (!kDebugMode) return;
    Logger().log(level, message, error: error, stackTrace: stackTrace);
  }

  void showToast({
    required String message,
    String? description,
    ToastificationType type = ToastificationType.info,
  }) {
    toastification.show(
      type: type,
      title: Text(message),
      autoCloseDuration: const Duration(seconds: 5),
      closeOnClick: true,
      description: description == null ? null : Text(description),
      alignment: Alignment.bottomCenter,
      style: ToastificationStyle.flat,
    );
  }
}
