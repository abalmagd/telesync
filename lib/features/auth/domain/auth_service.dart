import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:telesync/core/domain/error/failure.dart';
import 'package:telesync/features/auth/data/auth_repository.dart';
import 'package:telesync/features/auth/domain/models/session.dart';

abstract class AuthServiceAbstraction {
  Future<Either<Failure, Session>> createRequestToken();
}

final authServiceProvider = Provider<AuthServiceAbstraction>((ref) {
  return AuthService(ref.read(authRepoProvider));
});

class AuthService implements AuthServiceAbstraction {
  AuthService(this.authRepo);

  final AuthRepoAbstraction authRepo;

  @override
  Future<Either<Failure, Session>> createRequestToken() async {
    try {
      final json = await authRepo.createRequestToken();

      final session = Session.fromJson(json);

      return Right(session);
    } on Failure catch (e) {
      return Left(e);
    }
  }
}

/// Response
/// => Repository(Success check)
/// => Service(Mapping)
/// => Controller(Logic)
/// => UI
