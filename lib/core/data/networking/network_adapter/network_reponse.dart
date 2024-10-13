import 'package:telesync/core/domain/error/failure.dart';

class NetworkResponse {
  final bool success;
  final dynamic data;
  final Failure? failure;

  NetworkResponse({
    required this.success,
    this.data,
    this.failure,
  });
}
