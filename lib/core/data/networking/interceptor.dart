import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:telesync/utils/helpers/alerts.dart';

class NetworkingInterceptor extends InterceptorsWrapper with Alerts {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    {
      logPrint(
        message: 'onRequest ===>\n'
            'Path: ${options.method} ${options.baseUrl}${options.path}\n'
            'Full URI: ${options.uri}\n'
            'Data: ${options.data}\n'
            'Extra: ${options.extra}\n'
            'Query Params: ${options.queryParameters}\n'
            'Headers: ${options.headers.keys}\n'
            'Response Type: ${options.responseType}',
      );
      return handler.next(options);
    }
  }

  @override
  void onResponse(
      Response<dynamic> response, ResponseInterceptorHandler handler) {
    logPrint(
      message: 'onResponse ===>\n'
          'URI: ${response.realUri}\n'
          'Status: ${response.statusCode} ${response.statusMessage}\n'
          'Data: ${response.data.runtimeType}\n',
    );
    return handler.next(response);
  }

  @override
  void onError(DioException e, ErrorInterceptorHandler handler) {
    logPrint(
      message: 'onError ===>\n'
          'Path: ${e.requestOptions.uri}\n'
          'Type: ${e.type}\n'
          'Message: ${e.message}\n'
          'Data: ${e.error}\n'
          'Response: ${e.response}',
      level: Level.error,
    );
    return handler.next(e);
  }
}
