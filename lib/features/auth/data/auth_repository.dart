import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:telesync/core/data/networking/network_adapter/network_adapter.dart';
import 'package:telesync/core/data/networking/network_adapter/network_request.dart';
import 'package:telesync/core/data/networking/remote.dart';
import 'package:telesync/core/domain/error/failure.dart';
import 'package:telesync/features/auth/domain/models/session.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepoAbstraction {
  Future<Either<Failure, Session>> createRequestToken();
}

final authRepoProvider = Provider<AuthRepoAbstraction>((ref) {
  return AuthRepository(ref.read(networkAdapterProvider));
});

class AuthRepository implements AuthRepoAbstraction {
  AuthRepository(this.adapter);

  final NetworkAdapterAbstraction adapter;

  @override
  Future<Either<Failure, Session>> createRequestToken() async {
    final response = await adapter.request(
      request: NetworkRequest(
        path: Remote.createRequestToken,
        requestType: RequestType.get,
      ),
    );

    if (response.success) return Right(Session.fromJson(response.data));
    return Left(response.failure!);
  }
}
