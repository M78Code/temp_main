import 'package:flutter_main/net/http/http.dart';

class BaseResponse<T> {
  /// 状态码
  int? code;

  /// 数据
  T? data;

  /// 原因
  String? msg;

  /// 成功的定义
  bool get isSuccess {
    return (code == NetConstant.SUCCESS);
  }
}