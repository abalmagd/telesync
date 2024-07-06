import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:toastification/toastification.dart';

mixin Alerts {
  void logPrint({
    required String message,
    Level level = Level.info,
    Object? error,
    StackTrace? stackTrace,
  }) {
    if (!kDebugMode) return;
    Logger().log(level, message, error: error, stackTrace: stackTrace);
  }

  void showToast({
    required String message,
    ToastificationType severity = ToastificationType.info,
    Duration? autoCloseDuration,
  }) {
    toastification.show(
      type: severity,
      style: ToastificationStyle.flatColored,
      autoCloseDuration: autoCloseDuration ?? const Duration(seconds: 5),
      title: Text(message),
    );
  }
}
