import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_main/net/socket/base/Config.dart';
import 'package:flutter_main/net/socket/base/Enum.dart';
import 'package:flutter_main/utils/jsCall.dart';

enum PackageType {
  // ignore: constant_identifier_names
  RESPONSE(1),
  // ignore: constant_identifier_names
  NOTICE(2);

  final int value;
  const PackageType(this.value);
}

class IResponseData {
  late String jsonData;
  late int nonce;
  late bool success;
  late int protocolId;
  late GameType gameTypeId;
  late String sign;
  late int timestamp;
  late int serverLastVersion;
  late int messageId;
}

class IResponseJsonData {
  late SocketType id;
  int? messageId;
  late int status;
  String? data;
  late int serverLastVersion;
  PackageType? packageType;
}

class SocketResponse {
  late IResponseData responseData;
  late IResponseJsonData jsonData;

  SocketResponse(Uint8List buffer) {
    late IResponseData originData;
    try {
      // String text = DataHandle.decryptWsData(buffer, CRYPTO_KEY);
      String text =
          executeJS('DataHandle', 'decryptWsData', [buffer, CRYPTO_KEY])
              as String;
      originData = jsonDecode(text);
    } catch (e) {
      debugPrint(e.toString());
    }
    IResponseJsonData jsonData = jsonDecode(originData.jsonData);

    this.responseData = originData;
    this.jsonData = jsonData;
  }

  SocketType get type => jsonData.id;

  T? getDecodeData<T>() {
    if (jsonData.data == null) {
      return null;
    }
    return jsonDecode(jsonData.data as String) as T;
  }

  String get typeString => SocketType.values[jsonData.id.index].toString();

  Map<String, dynamic> toJSON() {
    Map<String, dynamic> data = jsonDecode(jsonEncode(responseData));
    data['jsonData'] = jsonDecode(jsonEncode(jsonData));
    data['jsonData']['data'] = getDecodeData();

    return data;
  }
}
