import 'package:dio/dio.dart';
import 'package:flutter_main/controllers/global_controller.dart';

class RequestInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // http header token
    var token = GlobalController.controller.token ?? '';
    if (token.isNotEmpty) {
      options.headers['X-Request-Token'] = token;
    }
    handler.next(options);
  }
}
