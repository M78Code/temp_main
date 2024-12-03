import 'dart:typed_data';

import 'package:flutter_main/net/socket/base/Config.dart';
import 'package:flutter_main/net/socket/base/Enum.dart';

enum ServiceTypeId {
  // 多台，长连接
  MULTIPLE(2),
  // 游戏服，同时只能连接一个
  GAME(3),
  // 聊天服务，同时只能连接一个
  CHAT(4),
  // 大厅，长连接
  HALL(7);

  static ServiceTypeId getServiceTypeValue(int value) {
    return ServiceTypeId.values.firstWhere(
        (serviceType) => serviceType.value == value,
        orElse: () => ServiceTypeId.GAME);
  }

  final int value;

  const ServiceTypeId(this.value);
}

class IRequestData {
  late String jsonData;
  late int nonce;
  late int protocolId;
  late int gameTypeId;
  late String sign;
  late int timestamp;
  late int playerId;
  late int tableId;
  late int serviceTypeId;
  int? messageId;

  toObject() {}
}

class IRequestJsonData {
  late int id;
  late String param;

// static Map<String, dynamic> toJson(this) {
//   final Map<String, dynamic> data = new Map<String, dynamic>(datas);
//   data['id'] = thisid;
//   data['para'] = param;
//   return data;
// }
}

class IBaseRequest {
  late int clientDeviceType;
  late int deviceType;
  late String deviceId;
}

class SocketRequest {
  late IRequestData encodeData;
  late Map<String, dynamic> processData;
  late IRequestJsonData jsonData;
  late Uint8List buffer;

  SocketRequest(
      SocketType socketType,
      Map<String, dynamic> originData,
      GameType gameTypeId,
      ServiceTypeId serviceTypeId,
      timestamp,
      processData,
      jsonDataText,
      playerId,
      nonce,
      sign,
      messageId) {
    // int timestamp = DataHandle.createTimestamp();
    // int timestamp = executeJS('DataHandle', 'createTimestamp', []) as int;

    // int nonce = DataHandle.createNonce();
    // final nonce = executeJS('DataHandle', 'createNonce', []);
    // String sign =
    //     DataHandle.createSign(jsonDataText, nonce, timestamp, CRYPTO_KEY);
    // final sign = executeJS('DataHandle', 'createSign',
    //     [jsonDataText, nonce, timestamp, CRYPTO_KEY]);
    // timestamp = int.parse(timestamp);
    encodeData = IRequestData()
      ..jsonData = jsonDataText
      ..protocolId = socketType.value
      ..gameTypeId = gameTypeId.value
      ..playerId = playerId
      ..tableId = TABLE_ID
      ..serviceTypeId = serviceTypeId.value
      ..timestamp = timestamp
      ..messageId = timestamp + 1
      ..nonce = nonce
      ..sign = '"$sign"'
      ..messageId = messageId;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['jsonData'] = encodeData.jsonData;
    data['nonce'] = encodeData.nonce;
    data['protocolId'] = encodeData.protocolId;
    data['gameTypeId'] = encodeData.gameTypeId;
    data['sign'] = encodeData.sign;
    data['timestamp'] = encodeData.timestamp;
    data['playerId'] = encodeData.playerId;
    data['tableId'] = encodeData.tableId;
    data['serviceTypeId'] = encodeData.serviceTypeId;
    data['messageId'] = encodeData.messageId;
    return data;
  }

  toObject() {
    return {
      'jsonData': encodeData.jsonData,
      'nonce': encodeData.nonce,
      'protocolId': encodeData.protocolId,
      'gameTypeId': encodeData.gameTypeId,
      'sign': encodeData.sign,
      'timestamp': encodeData.timestamp,
      'playerId': encodeData.playerId,
      'tableId': encodeData.tableId,
      'serviceTypeId': encodeData.serviceTypeId,
      'messageId': encodeData.messageId
    };
  }

  // init(jsonDataText, timestamp) async {
  //   final nonce = await _initcreateNonce(jsonDataText, timestamp);
  //   final sign = await _initcreateSign(jsonDataText, timestamp, nonce);
  //   return sign;
  // }

  String get typeString => SocketType.values[jsonData.id].toString();

  Map<String, dynamic> toJsonData() {
    Map<String, dynamic> data = encodeData as Map<String, dynamic>;
    data['jsonData'] = jsonData;
    data['jsonData']['param'] = processData;

    return data;
  }
}
