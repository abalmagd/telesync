import 'package:curl_logger_dio_interceptor/curl_logger_dio_interceptor.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:telesync/core/domain/localization/locale_provider.dart';
import 'package:telesync/core/environment/env_keys.dart';

final dioProvider = Provider<Dio>(
  (ref) {
    final dio = Dio(
      BaseOptions(
        baseUrl: const String.fromEnvironment(EnvKeys.baseUrl),
        headers: {
          'Authorization': const String.fromEnvironment(EnvKeys.apiKey),
        },
        queryParameters: {'language': ref.read(localeProvider).toString()},
      ),
    );

    if (kDebugMode) {
      dio.interceptors.addAll([PrettyDioLogger(), CurlLoggerDioInterceptor()]);
    }

    return dio;
  },
);
