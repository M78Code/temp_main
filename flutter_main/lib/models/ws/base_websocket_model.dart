import 'dart:convert';
/// jsonData : {"packageType":1}
/// nonce : 160229559
/// playerId : 132753
/// protocolId : 10000
/// sign : "JfE204mINnR/WS+OxaxPcDv4zZM="
/// success : true
/// timestamp : 1726737082733
/// serverLastVersion : 1
/// messageId : 1726737082551

BaseWebsocketModel baseWebsocketModelFromJson(String str) => BaseWebsocketModel.fromJson(json.decode(str));
String baseWebsocketModelToJson(BaseWebsocketModel data) => json.encode(data.toJson());
class BaseWebsocketModel {
  BaseWebsocketModel({
      this.jsonData, 
      this.nonce, 
      this.playerId, 
      this.protocolId, 
      this.sign, 
      this.success, 
      this.timestamp, 
      this.serverLastVersion, 
      this.messageId,});

  BaseWebsocketModel.fromJson(dynamic json) {
    jsonData = json['jsonData'];
    nonce = json['nonce'];
    playerId = json['playerId'];
    protocolId = json['protocolId'];
    sign = json['sign'];
    success = json['success'];
    timestamp = json['timestamp'];
    serverLastVersion = json['serverLastVersion'];
    messageId = json['messageId'];
  }
  dynamic jsonData;
  int? nonce;
  int? playerId;
  int? protocolId;
  String? sign;
  bool? success;
  int? timestamp;
  int? serverLastVersion;
  int? messageId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (jsonData != null) {
      map['jsonData'] = jsonData?.toJson();
    }
    map['nonce'] = nonce;
    map['playerId'] = playerId;
    map['protocolId'] = protocolId;
    map['sign'] = sign;
    map['success'] = success;
    map['timestamp'] = timestamp;
    map['serverLastVersion'] = serverLastVersion;
    map['messageId'] = messageId;
    return map;
  }

}

/// packageType : 1

// JsonData jsonDataFromJson(String str) => JsonData.fromJson(json.decode(str));
// String jsonDataToJson(JsonData data) => json.encode(data.toJson());
// class JsonData {
//   JsonData({
//       this.packageType,});
//
//   JsonData.fromJson(dynamic json) {
//     packageType = json['packageType'];
//   }
//   int? packageType;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['packageType'] = packageType;
//     return map;
//   }
//
// }