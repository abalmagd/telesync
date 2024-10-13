enum RequestType { get, post, put, patch, delete, download }

class NetworkRequest {
  final String path;
  final RequestType requestType;
  final Map<String, dynamic>? queryParams;
  final Map<String, dynamic>? data;

  NetworkRequest({
    required this.path,
    required this.requestType,
    this.queryParams,
    this.data,
  });
}
