import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:telesync/core/data/networking/dio.dart';
import 'package:telesync/core/data/networking/remote.dart';
import 'package:telesync/core/domain/error/failure.dart';

/// Responsible for fetching data from remote api and checking for
/// network errors (Ex: connection timeout).
///
/// Data is returned as received without any modification.
abstract class AuthRepositoryAbstraction {
  Future<Map<String, dynamic>> loginAsGuest();

  Future<Map<String, dynamic>> createRequestToken();

  Future<Map<String, dynamic>> login(String requestToken);

  Future<Map<String, dynamic>> logout(String sessionId);
}

final authRepositoryProvider =
    Provider<AuthRepositoryAbstraction>((ref) {
  return AuthRepository(ref.read(dioProvider));
});

class AuthRepository implements AuthRepositoryAbstraction {
  AuthRepository(this._dio);

  final Dio _dio;

  @override
  Future<Map<String, dynamic>> loginAsGuest() async {
    try {
      final response = await _dio.post(Remote.newGuestSession);

      final Map<String, dynamic> json = response.data;
      return json;
    } on DioException catch (e) {
      throw Failure.handleExceptions(e);
    }
  }

  @override
  Future<Map<String, dynamic>> createRequestToken() async {
    try {
      final response = await _dio.get(Remote.createRequestToken);

      final Map<String, dynamic> json = response.data;

      return json;
    } on DioException catch (e) {
      throw Failure.handleExceptions(e);
    }
  }

  @override
  Future<Map<String, dynamic>> login(String requestToken) async {
    try {
      final response = await _dio.post(
        Remote.newSession,
        data: {'request_token': requestToken},
      );

      final Map<String, dynamic> json = response.data;

      return json;
    } on DioException catch (e) {
      throw Failure.handleExceptions(e);
    }
  }

  @override
  Future<Map<String, dynamic>> logout(String sessionId) async {
    try {
      final response = await _dio.delete(
        Remote.session,
        data: {'session_id': sessionId},
      );

      final Map<String, dynamic> json = response.data;
      return json;
    } on DioException catch (e) {
      throw Failure.handleExceptions(e);
    }
  }
}
