import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';

final box = GetStorage();
final logger = Logger();

final Dio dio = Dio(
  BaseOptions(
    connectTimeout: 19000,
    receiveTimeout: 19000,
    // headers: {
    //   "Content-Type": "application/json",
    //   "Accept": "application/json",
    //   "Authorization": "Bearer ${box.read('access_token')}",
    // },
    baseUrl: ('https://jsonplaceholder.typicode.com/posts/1').toString(),
  ),
)..interceptors.add(Logging());

class Logging extends Interceptor {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    return handler.next(options);
  }

  @override
  onResponse(Response response, ResponseInterceptorHandler handler) {
    return handler.next(response);
  }

  @override
  onError(DioError err, ErrorInterceptorHandler handler) {
    return handler.next(err);
  }
}
