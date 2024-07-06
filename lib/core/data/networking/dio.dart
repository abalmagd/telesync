import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:telesync/core/data/networking/interceptor.dart';

import 'remote.dart';

final dioProvider = Provider<Dio>(
  (ref) {
    final dio = Dio(
      BaseOptions(
        baseUrl: Remote.baseUrl,
        queryParameters: {'language': 'en_us'},
        headers: {'Authorization': 'Bearer ${dotenv.env[Remote.apiToken]}'},
      ),
    );

    if (kDebugMode) dio.interceptors.add(NetworkingInterceptor());

    return dio;
  },
);
