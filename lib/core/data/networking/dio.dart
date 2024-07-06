import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:telesync/core/data/networking/interceptor.dart';

import '../environment/environment_variables.dart';

final dioProvider = Provider<Dio>(
  (ref) {
    final dio = Dio(
      BaseOptions(
        baseUrl: EnvironmentVariables.baseUrl,
        queryParameters: {'language': 'en_us'},
        headers: {
          'Authorization': 'Bearer ${EnvironmentVariables.apiKeyV4}',
          'accept': 'application/json',
        },
      ),
    );

    if (kDebugMode) dio.interceptors.add(NetworkingInterceptor());

    return dio;
  },
);
