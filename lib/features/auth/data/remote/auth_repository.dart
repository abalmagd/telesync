import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:telesync/core/data/networking/dio.dart';
import 'package:telesync/core/data/networking/remote.dart';
import 'package:telesync/core/domain/error/failure.dart';
import 'package:telesync/features/auth/data/entities/session_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, SessionEntity>> login({
    required String email,
    required String password,
  });
}

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final dio = ref.read(dioProvider);
  return AuthRepositoryImpl(dio);
});

class AuthRepositoryImpl implements AuthRepository {
  final Dio dio;

  AuthRepositoryImpl(this.dio);

  @override
  Future<Either<Failure, SessionEntity>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await dio.post(
        '${Remote.auth.path}${Remote.login.path}',
        data: {'email': email, 'password': password},
      );

      switch (response.statusCode) {
        case HttpStatus.created:
          return Right(SessionEntity.fromJson(response.data));
        default:
          return Left(Failure.fromJson(response.data));
      }
    } on DioException catch (e) {
      return Left(Failure.fromNetwork(e));
    }
  }
}
