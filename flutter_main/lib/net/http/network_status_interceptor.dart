import 'package:dio/dio.dart';
import 'package:flutter_main/controllers/global_controller.dart';
import 'package:flutter_main/utils/utils.dart';

class NetworkStatusInterceptor extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {

    if (GlobalController.mNetworkAvailable) {
      handler.next(options);
    } else {
      LogUtil.log("检测到网络不通，请检查联网状态", level: LogLevel.fatal);
      handler.reject(
          DioException.connectionError(requestOptions: options, reason: "无网络"));
    }
  }
}