import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:logger/logger.dart';
import 'package:telesync/core/domain/utils/alerts.dart';
import 'package:toastification/toastification.dart';

class Failure extends Equatable with Alerts implements Exception {
  final String message;
  final int? code;
  final Exception? exception;

  const Failure({required this.message, this.code, this.exception});

  factory Failure.fromNetwork(DioException e) {
    late String message;
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        message = 'timeout';
      case DioExceptionType.badCertificate:
        message = 'bad certificate';
      case DioExceptionType.badResponse:
        message = 'bad response';
      case DioExceptionType.cancel:
        message = 'cancel';
      case DioExceptionType.connectionError:
        message = 'check your network';
      case DioExceptionType.unknown:
        message = 'something went wrong';
    }
    return Failure(
      message: e.message ?? message,
      code: e.response?.statusCode,
      exception: e,
    );
  }

  factory Failure.fromJson(Map<String, dynamic> json) {
    return Failure(
      message: json['status_message'],
      code: json['status_code'],
    );
  }

  void toast() => showToast(
        message: message,
        severity: ToastificationType.error,
        description: code.toString(),
      );

  void log() => logPrint(
        message: message,
        error: this,
        level: Level.error,
        stackTrace: StackTrace.current,
      );

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [message, code, exception];
}
