import 'package:dio/dio.dart';
import 'package:events/core/Api_services/urls.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiServices {
  final Dio _dio;
  ApiServices(this._dio) {
    // (_dio.httpClientAdapter as IOHttpClientAdapter).onHttpClientCreate =
    //     (client) {
    //       client.badCertificateCallback =
    //           (X509Certificate cert, String host, int port) => true;
    //       return client;
    //     };
    _dio.options.baseUrl = Urls.baseUrl;
    _dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: true,
        error: true,
        request: true,
        compact: true,
        maxWidth: 50,
      ),
    );

    // _dio.interceptors.add(AuthInterceptor(onUnauthorized: () {
    //   navigatorKey.currentState?.pushNamedAndRemoveUntil(
    //     LoginPage.routeName,
    //     (route) => false,
    //   );
    // }));
  }

  Map<String, String> _headers() {
    return {
      'Content-Type': 'application/json',
      "Accept": 'application/json',
      "Accept-Charset": "application/json",
    };
  }

  Future<Response> get({required String endPoint}) {
    return _dio.get(endPoint, options: Options(headers: _headers()));
  }

  Future<Response> post({required String endPoint, required dynamic data}) {
    return _dio.post(
      endPoint,
      data: data,
      options: Options(headers: _headers()),
    );
  }

  Future<Response> put({required String endPoint, required dynamic data}) {
    return _dio.put(
      endPoint,
      data: data,
      options: Options(headers: _headers()),
    );
  }

  Future<Response> delete({required String endPoint}) {
    return _dio.delete(endPoint, options: Options(headers: _headers()));
  }
}
