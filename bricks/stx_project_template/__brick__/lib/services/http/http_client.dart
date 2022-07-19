import 'package:dio/dio.dart';
import 'package:{{project_name}}/core/index.dart';
import 'package:injectable/injectable.dart';

import 'package:{{project_name}}/models/general_models.dart';
import 'interceptors/index.dart';

@injectable
class HttpClient {
  late Dio _dio;

  HttpClient() {
    _dio = Dio(
      BaseOptions(
        baseUrl: DioBaseOptions.baseUrl,
        receiveTimeout: DioBaseOptions.receiveTimeout,
        connectTimeout: DioBaseOptions.connectTimeout,
      ),
    )..interceptors.add(HttpInterceptor());
  }

  Future<Response<T>> get<T>(String url,
      {DynamicMap? queryParameters, Options? options}) {
    return _dio.get<T>(url, queryParameters: queryParameters, options: options);
  }

  Future<Response<T>> post<T>(String url,
      {data, DynamicMap? queryParameters, Options? options}) {
    return _dio.post<T>(url,
        data: data, queryParameters: queryParameters, options: options);
  }

  Future<Response<T>> put<T>(String url,
      {data, DynamicMap? queryParameters, Options? options}) {
    return _dio.put<T>(url,
        data: data, queryParameters: queryParameters, options: options);
  }

  Future<Response<T>> patch<T>(String url,
      {data, DynamicMap? queryParameters, Options? options}) {
    return _dio.patch<T>(url,
        data: data, queryParameters: queryParameters, options: options);
  }

  Future<Response<T>> delete<T>(String url,
      {DynamicMap? queryParameters, Options? options}) {
    return _dio.delete<T>(url,
        queryParameters: queryParameters, options: options);
  }

  Future<Response> download(String url, String savePath) {
    return _dio.download(url, savePath);
  }
}