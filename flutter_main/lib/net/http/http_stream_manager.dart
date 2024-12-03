import 'dart:async';
import 'dart:convert';
import 'dart:typed_data' as TypedData;
import 'package:convert/convert.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:encrypt/encrypt.dart';
import 'package:flutter_main/api/api_host.dart';
import 'package:flutter_main/configs/app_config.dart';
import 'package:flutter_main/models/common/base_response.dart';
import 'package:flutter_main/net/http/http.dart';
import 'package:flutter_main/net/http/stram_request_encry_interceptor.dart';
import 'package:flutter_main/utils/utils.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:cookie_jar/cookie_jar.dart';

/// Http 请求管理类
class HttpStreamManager {
  static final HttpStreamManager _instance = HttpStreamManager._internal();
  factory HttpStreamManager() => _instance;

  late Dio _dio;

  /// 单例初始
  HttpStreamManager._internal() {
    // header 头
    Map<String, dynamic> headers = {
      'Content-Type': NetConstant.CONTENT_TYPE,
      // 'deviceType': 1,
      // 'model': 'navigator.userAgent',
      // 'deviceId': '111',
      // 'x-forwarded-for': '11',
      // 'keyid': '1',
      // 'token': NetConstant.API_TOKEN,
      // 'X-Request-Token': NetConstant.Request_TOKEN,
    };

    // 初始选项
    var options = BaseOptions(
      baseUrl: ApiHost.API_STREAM_FAT,
      headers: headers,
      connectTimeout: const Duration(milliseconds: NetConstant.CONNECT_TIMEOUT),
      receiveTimeout: const Duration(milliseconds: NetConstant.RECEIVE_TIMEOUT),
      responseType: ResponseType.json,
      contentType: NetConstant.CONTENT_TYPE,
    );

    // 初始 dio
    _dio = Dio(options);

    // 拦截器-网络检测
    _dio.interceptors.add(NetworkStatusInterceptor());
    _dio.interceptors.add(StramRequestEncryInterceptor());
    // 拦截器
    // _dio.interceptors.add(CookieManager(CookieJar()));
    // 拦截器
    _dio.interceptors.add(ResponseInterceptors());
    // 拦截器 - 日志打印
    if (AppConfig.isDebug) {
      _dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
      ));
    }
  }

  /// 切换 Base url
  void switchBaseUrl(String baseUrl) {
    _dio.options.baseUrl = baseUrl;
  }

  /// 统一的请求方法
  Future<BaseResponse> doRequest(
      String path,
      HttpMethod method, {
        Options? options,
        CancelToken? cancelToken,
        Map<String, dynamic>? parameters,
        bool isShowLoading = false,
        bool isShowToast = true,
      }) async {
    Options requestOptions = options ?? Options();
    requestOptions.method = method.value;

    /// 根据method类型处理参数
    Object? data;
    Map<String, dynamic>? queryParameters;
    switch (method) {
      case HttpMethod.get:
        queryParameters = parameters;
      case HttpMethod.post:
        data = parameters;
      case HttpMethod.postFormData:
        if (parameters != null) {
          data = FormData.fromMap(parameters);
        }
    }

    /// 包装成自定义的响应；后端自定义的数据优先
    BaseResponse baseResponse = BaseResponse();
    try {
      if (isShowLoading) {
        Loading.showNetLoading('加载中...');
      }

      /// 统一调用request进行数据传输
      final dioResponse = await _dio.request(
        path,
        data: data,
        queryParameters: queryParameters,
        options: requestOptions,
        cancelToken: cancelToken,
      );
      baseResponse.code = dioResponse.data?["return_code"] ?? dioResponse.statusCode;
      baseResponse.data = decryptData(dioResponse.data?["data"]);
      baseResponse.msg =
          dioResponse.data?["msg"] ?? dioResponse.statusMessage;
    } on DioException catch (e) {
      if (e.response != null) {
        baseResponse.code = e.response?.statusCode;
        baseResponse.data = e.response?.data;
        // baseResponse.errMsg = e.response?.statusMessage;
        baseResponse.msg = getErrorMsg(e);
      } else {
        baseResponse.code = -1;
        baseResponse.msg = getErrorMsg(e);
      }
    } finally {
      if (isShowLoading) {
        Loading.hideNetLoading();
      }

      if(isShowToast) {
        var msg = baseResponse.msg;
        infoToast(msg: msg);
        ToastUtil.showToast(msg!);
      }
    }
    return baseResponse;
  }
// AES Decryption Function
  String decryptData(String hexData) {
    // Define the AES key (16-byte key for AES-128)
    final key = Key.fromUtf8('jg8e9FuYMK6Qcn56');

    // Use ECB mode with PKCS7 padding
    final encrypter = Encrypter(AES(key, mode: AESMode.ecb, padding: 'PKCS7'));

    // Convert the hex string back to bytes
    final bytes = hex.decode(hexData);

    // Create an Encrypted object from the bytes
    final encrypted = Encrypted(TypedData.Uint8List.fromList(bytes)); // Updated line

    // Decrypt the bytes
    final decrypted = encrypter.decrypt(encrypted);

    // Return the decrypted string
    return decrypted;
  }

  String getErrorMsg(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return "连接超时";
      case DioExceptionType.sendTimeout:
        return "请求超时";
      case DioExceptionType.receiveTimeout:
        return "响应超时";
      case DioExceptionType.badResponse:
        return "出现异常";
      case DioExceptionType.cancel:
        return "请求取消";
      case DioExceptionType.badCertificate:
        return "证书问题";
      case DioExceptionType.connectionError:
        return "连接问题，请检查网络状态";
      case DioExceptionType.unknown:
        return "未知错误";
      default:
        return e.toString();
    }
  }
}
