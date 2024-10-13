import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:telesync/core/data/networking/dio.dart';
import 'package:telesync/core/data/networking/network_adapter/network_reponse.dart';
import 'package:telesync/core/data/networking/network_adapter/network_request.dart';
import 'package:telesync/core/domain/error/failure.dart';

abstract class NetworkAdapterAbstraction {
  Future<NetworkResponse> request({required NetworkRequest request});
}

final networkAdapterProvider = Provider<NetworkAdapterAbstraction>((ref) {
  final dio = ref.read(dioProvider);
  return NetworkAdapter(dio: dio);
});

class NetworkAdapter implements NetworkAdapterAbstraction {
  final Dio dio;

  NetworkAdapter({required this.dio});

  @override
  Future<NetworkResponse> request({required NetworkRequest request}) async {
    try {
      late final Response response;
      switch (request.requestType) {
        case RequestType.get:
          response = await dio.get(
            request.path,
            queryParameters: request.queryParams,
            data: request.data,
          );
        case RequestType.post:
          response = await dio.post(
            request.path,
            queryParameters: request.queryParams,
            data: request.data,
          );
        case RequestType.put:
          response = await dio.put(
            request.path,
            queryParameters: request.queryParams,
            data: request.data,
          );
        case RequestType.patch:
          response = await dio.patch(
            request.path,
            queryParameters: request.queryParams,
            data: request.data,
          );
        case RequestType.delete:
          response = await dio.delete(
            request.path,
            queryParameters: request.queryParams,
            data: request.data,
          );
        case RequestType.download:
          response = await dio.download(
            request.path,
            '', // TODO:: Implement
            queryParameters: request.queryParams,
            data: request.data,
          );
      }
      return _responseMapper(response);
    } on DioException catch (e) {
      return NetworkResponse(
        success: false,
        failure: Failure.fromNetwork(e),
      );
    }
  }

  NetworkResponse _responseMapper(Response response) {
    switch (response.statusCode) {
      case HttpStatus.ok:
      case HttpStatus.accepted:
      case HttpStatus.created:
        return NetworkResponse(success: true, data: response.data);
      default:
        return NetworkResponse(
          success: false,
          failure: Failure.fromJson(response.data),
        );
    }
  }
}
