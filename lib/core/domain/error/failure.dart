import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:telesync/utils/helpers/alerts.dart';
import 'package:toastification/toastification.dart';

/// Default class for handling errors & exceptions
class Failure extends Equatable with Alerts implements Exception {
  final String message;
  final int? code;
  final Exception? exception;

  Failure({
    required this.message,
    this.code,
    this.exception,
  });

  static Failure handleExceptions(DioException e) {
    switch (e.type) {
      case DioExceptionType.badResponse:
        return Failure(
          message: 'Error bad response',
          code: e.response?.statusCode,
          exception: e,
        );
      case DioExceptionType.connectionTimeout:
        return Failure(
          message: 'Connection time out',
          code: e.response?.statusCode,
          exception: e,
        );
      case DioExceptionType.sendTimeout:
        return Failure(
          message: 'Post connection time out',
          code: e.response?.statusCode,
          exception: e,
        );
      case DioExceptionType.receiveTimeout:
        return Failure(
          message: 'Get connection time out',
          code: e.response?.statusCode,
          exception: e,
        );
      case DioExceptionType.badCertificate:
        return Failure(
          message: 'Connection failed due to a bad certificate',
          code: e.response?.statusCode,
          exception: e,
        );
      case DioExceptionType.cancel:
        return Failure(
          message: 'Request was canceled',
          code: e.response?.statusCode,
          exception: e,
        );
      case DioExceptionType.connectionError:
        return Failure(
          message: 'Failed to connect to server',
          code: e.response?.statusCode,
          exception: e,
        );
      case DioExceptionType.unknown:
        return Failure(
          message: e.message ?? 'Something went wrong',
          code: e.response?.statusCode,
          exception: e,
        );
    }
  }

  void toast() => showToast(
        message: message,
        severity: ToastificationType.error,
      );

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [message, code, exception];
}
