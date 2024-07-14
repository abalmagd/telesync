import 'package:dartz/dartz.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:telesync/core/domain/error/failure.dart';
import 'package:telesync/features/auth/data/auth_repository.dart';
import 'package:telesync/features/auth/domain/models/session.dart';
import 'package:telesync/utils/extensions/map_extension.dart';

/// Responsible for modifying the data received from the repository
/// and checking for request errors (Ex: bad token).
///
/// Data is returned after proper modification.
///
/// For example: When a guest session json is returned from the repository,
/// the field [guest_session_id] is renamed to [session_id]
abstract class AuthServiceAbstraction {
  Future<Either<Failure, Session>> loginAsGuest();

  Future<Either<Failure, bool>> logout({required String sessionId});

  Future<Either<Failure, Map<String, String>>> createRequestToken();

  Future<Either<Failure, Session>> login({required String requestToken});
}

final authServiceProvider = Provider<AuthServiceAbstraction>((ref) {
  return AuthService(ref.watch(authRepositoryProvider));
});

class AuthService implements AuthServiceAbstraction {
  AuthService(this._baseAuthRepository);

  final AuthRepositoryAbstraction _baseAuthRepository;

  @override
  Future<Either<Failure, Session>> loginAsGuest() async {
    try {
      final json = await _baseAuthRepository.loginAsGuest();

      final bool success = json['success'];

      if (!success) {
        throw Failure(
          message: json['status_message'],
          code: json['status_code'],
        );
      }

      json.changeKeyName('guest_session_id', 'session_id');
      json.addAll({'is_guest': true});

      final session = Session.fromJson(json);
      return Right(session);
    } on Failure catch (failure) {
      return Left(failure);
    }
  }

  @override
  Future<Either<Failure, Map<String, String>>> createRequestToken() async {
    try {
      final json = await _baseAuthRepository.createRequestToken();

      final bool success = json['success'];

      if (!success) {
        throw Failure(
          message: json['status_message'],
          code: json['status_code'],
        );
      }

      final String requestToken = json['request_token'];
      final String expiresAt = json['expires_at'];

      final data = {
        'request_token': requestToken,
        'expires_at': expiresAt,
      };

      return Right(data);
    } on Failure catch (failure) {
      return Left(failure);
    }
  }

  @override
  Future<Either<Failure, Session>> login({required String requestToken}) async {
    try {
      final Map<String, dynamic> json = {};

      final tokenJson = await _baseAuthRepository.login(requestToken);

      json.addEntries(tokenJson.entries);

      final success = tokenJson['success'];

      if (!success) {
        throw Failure(
          message: json['status_message'],
          code: json['status_code'],
        );
      }

      final session = Session.fromJson(json);
      return Right(session);
    } on Failure catch (failure) {
      return Left(failure);
    }
  }

  @override
  Future<Either<Failure, bool>> logout({required String sessionId}) async {
    try {
      final json = await _baseAuthRepository.logout(sessionId);

      final bool success = json['success'];

      if (!success) {
        throw Failure(
          message: json['status_message'],
          code: json['status_code'],
        );
      }

      return Right(success);
    } on Failure catch (failure) {
      return Left(failure);
    }
  }
}
