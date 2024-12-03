import 'package:dio/dio.dart';

/// 响应拦截
class ResponseInterceptors extends InterceptorsWrapper {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    return super.onResponse(response, handler);
  }
}

/// 响应拦截
// class ResponseInterceptors extends InterceptorsWrapper {
//   /// 发送请求
//   /// 我们这里可以添加一些公共参数，或者对参数进行加密
//   @override
//   void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
//     // super.onRequest(options, handler);
//
//     // http header 头加入 Authorization
//     // if (UserService.to.hasToken) {
//     //   options.headers['Authorization'] = 'Bearer ${UserService.to.token}';
//     // }
//
//     return handler.next(options);
//     // 如果你想完成请求并返回一些自定义数据，你可以resolve一个Response对象 `handler.resolve(response)`。
//     // 这样请求将会被终止，上层then会被调用，then中返回的数据将是你的自定义response.
//     //
//     // 如果你想终止请求并触发一个错误,你可以返回一个`DioError`对象,如`handler.reject(error)`，
//     // 这样请求将被中止并触发异常，上层catchError会被调用。
//   }
//
//   /// 响应
//   @override
//   void onResponse(Response response, ResponseInterceptorHandler handler) {
//     // 200 请求成功, 201 添加成功
//     if (response.statusCode != 200 && response.statusCode != 201) {
//       handler.reject(
//         DioException(
//           requestOptions: response.requestOptions,
//           response: response,
//           type: DioExceptionType.badResponse,
//         ),
//         true,
//       );
//     } else {
//       handler.next(response);
//     }
//   }
//
//   /// 错误
//   @override
//   Future<void> onError(
//       DioException err, ErrorInterceptorHandler handler) async {
//     final exception = HttpException(err.message ?? "error message");
//     switch (err.type) {
//       case DioExceptionType.badResponse: // 服务端自定义错误体处理
//         {
//           final response = err.response;
//           final errorMessage = ErrorMessageModel.fromJson(response?.data);
//           switch (errorMessage.statusCode) {
//           // 401 未登录
//             case 401:
//             // 注销 并跳转到登录页面
//             // _errorNoAuthLogout();
//               break;
//             case 404:
//               break;
//             case 500:
//               break;
//             case 502:
//               break;
//             default:
//               break;
//           }
//           // 显示错误信息
//           // if(errorMessage.message != null){
//           //   Loading.error(errorMessage.message);
//           // }
//         }
//         break;
//       case DioExceptionType.unknown:
//         break;
//       case DioExceptionType.cancel:
//         break;
//       case DioExceptionType.connectionTimeout:
//         break;
//       default:
//         break;
//     }
//     DioException errNext = err.copyWith(
//       error: exception,
//     );
//     handler.next(errNext);
//   }
// }