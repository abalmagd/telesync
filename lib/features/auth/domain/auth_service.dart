import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:telesync/core/domain/error/failure.dart';
import 'package:telesync/features/auth/data/remote/auth_repository.dart';
import 'package:telesync/features/auth/domain/models/session.dart';

abstract class AuthService {
  Future<Either<Failure, Session>> login({
    required String email,
    required String password,
  });
}

final authServiceProvider = Provider<AuthService>((ref) {
  final repository = ref.read(authRepositoryProvider);
  return AuthServiceImpl(repository);
});

class AuthServiceImpl implements AuthService {
  final AuthRepository repository;

  AuthServiceImpl(this.repository);

  @override
  Future<Either<Failure, Session>> login({
    required String email,
    required String password,
  }) async {
    final result = await repository.login(email: email, password: password);

    return result.fold(
      (failure) => Left(failure),
      (entity) => Right(Session.fromEntity(entity)),
    );
  }
}
