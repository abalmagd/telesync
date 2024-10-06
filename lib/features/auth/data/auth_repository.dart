import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:telesync/core/data/networking/dio.dart';
import 'package:telesync/core/data/networking/remote.dart';
import 'package:telesync/core/domain/error/failure.dart';

abstract class AuthRepoAbstraction {
  Future<Map<String, dynamic>> createRequestToken();
}

final authRepoProvider = Provider<AuthRepoAbstraction>((ref) {
  return AuthRepository(ref.read(dioProvider));
});

class AuthRepository implements AuthRepoAbstraction {
  AuthRepository(this.dio);

  final Dio dio;

  @override
  Future<Map<String, dynamic>> createRequestToken() async {
    try {
      final response = await dio.get(Remote.createRequestToken);
      if (response.data['success']) {
        return response.data;
      }
      throw Failure.fromJson(response.data);
    } on DioException catch (e) {
      throw Failure.fromNetwork(e);
    }
  }
}
