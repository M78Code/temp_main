typedef ModelBuilder<T> = T Function(dynamic value);

/// 字符串扩展
extension HYStringExt on String? {
  /// 字符串转 double
  double toDouble() {
    return double.parse(this ?? '0');
  }

  /// 字符串转 int
  int toInt() {
    return int.parse(this ?? '0');
  }

  /// 是否纯数字
  bool isPureNumber() {
    return RegExp(r'^([[0-9]*)$').hasMatch(this.safeStr());
  }

  /// 是否手机号
  bool isMobile() {
    return RegExp(r'^1\d{10}$').hasMatch(this.safeStr());
  }

  /// 是否邮箱
  bool isEmail() {
    return RegExp(r'^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$')
        .hasMatch(this.safeStr());
  }

  /// 验证身份证
  bool isIdCard() {
    return RegExp(r"\d{17}[\d|x]|\d{15}").hasMatch(this.safeStr());
  }

  /// 安全字符，如果是null返回空
  String safeStr() => this ?? "";

  double toStringGetDouble() {
    var str = (this ?? '').replaceAll(RegExp(r'[^0-9.-]'), '');
    return str.isEmpty ? 0 : double.parse(str);
  }

  String getTimeinDateString() {
    var str = this ?? '';
    if (str.isNotNullOrEmpty()) {
      if (str.length > 10) {
        return str.substring(10, str.length);
      }
    }
    return str;
  }

  ///html中图片替换文本，转换字符串
  String? toHtmlGetFirstImageUrl() {
    RegExp imgReg = RegExp(r'''<img [^>]*src=['"]([^'"]+)[^>]*>''');
    RegExp regExp =
        RegExp(r'(?:(?:https?|ftp):\/\/)?[\w/\-?=%.]+\.[\w/\-?=%.]+');
    String str = (this ?? '');
    String? img = imgReg.stringMatch(str);
    if (img.isNotNullOrEmpty()) {
      String? url = regExp.stringMatch(img!);
      return url;
    }
    return img;
  }
}

extension HYListStringExt on List<String>? {
  String getSting() {
    if (this == null) return '';

    String str = this!.toString().replaceAll('[', '').replaceAll(']', '');
    return str;
  }
}

extension ObjectExt on Object? {
  /// 是否为空，
  bool isNullOrEmpty() {
    if (this is String) return (this as String).isEmpty;
    if (this is List) return (this as List).isEmpty;
    if (this is Map) return (this as Map).isEmpty;
    if (this is Iterable) return (this as Iterable).isEmpty;
    return this == null;
  }

  /// 是否不为空
  bool isNotNullOrEmpty() {
    return !this.isNullOrEmpty();
  }

  /// 打印数据
  log() {
    print('log类型：[${this?.runtimeType}]--------------${this?.toString()}');
  }
}

extension HYListextension<E> on List<E>? {
  /// 安全list，如果是null返回空list
  List<E> safeList() => this ?? [];

  /// json转model
  List<E> jsonListToModelList<E>(dynamic json, ModelBuilder<E> modelBuilder) {
    List<E> list = [];
    if (json != null) {
      json.forEach((element) {
        list.add(modelBuilder(element));
      });
    }
    return list;
  }
}

extension HYMapextension<K, V> on Map<K, V>? {
  /// 安全Map，如果是null返回空Map
  Map<K, V> safeMap() => this ?? {};
}

extension HyBoolExtension on bool? {
  /// 安全Map，如果是null返回空Map
  bool safeBool() => this ?? false;
}
