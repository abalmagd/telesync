import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

class Failure extends Equatable {
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
      message: json['message'],
      code: json['statusCode'],
    );
  }

  void toast() => print(message);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [message, code, exception];
}
