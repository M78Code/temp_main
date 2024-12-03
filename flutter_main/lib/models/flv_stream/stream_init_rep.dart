// To parse this JSON data, do
//
//     final streamInitRep = streamInitRepFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'stream_init_rep.g.dart';

StreamInitRep streamInitRepFromJson(String str) => StreamInitRep.fromJson(json.decode(str));

String streamInitRepToJson(StreamInitRep data) => json.encode(data.toJson());

@JsonSerializable()
class StreamInitRep {
  @JsonKey(name: "return_data")
  final StreamInitReturnData? returnData;
  @JsonKey(name: "return_desc")
  final String? returnDesc;
  @JsonKey(name: "return_stamp")
  final String? returnStamp;

  StreamInitRep({
    this.returnData,
    this.returnDesc,
    this.returnStamp,
  });

  factory StreamInitRep.fromJson(Map<String, dynamic> json) => _$StreamInitRepFromJson(json);

  Map<String, dynamic> toJson() => _$StreamInitRepToJson(this);
}

@JsonSerializable()
class StreamInitReturnData {
  @JsonKey(name: "checkToken")
  final int? checkToken;
  @JsonKey(name: "domain_list")
  final String? domainList;
  @JsonKey(name: "lineStrategy")
  final String? lineStrategy;
  @JsonKey(name: "play_timeout")
  final int? playTimeout;
  @JsonKey(name: "request_host_timeout")
  final int? requestHostTimeout;
  @JsonKey(name: "sessionId")
  final String? sessionId;
  @JsonKey(name: "speed_test")
  final SpeedTest? speedTest;
  @JsonKey(name: "updateStatus")
  final int? updateStatus;
  @JsonKey(name: "urlOption")
  final int? urlOption;

  StreamInitReturnData({
    this.checkToken,
    this.domainList,
    this.lineStrategy,
    this.playTimeout,
    this.requestHostTimeout,
    this.sessionId,
    this.speedTest,
    this.updateStatus,
    this.urlOption,
  });

  factory StreamInitReturnData.fromJson(Map<String, dynamic> json) => _$StreamInitReturnDataFromJson(json);

  Map<String, dynamic> toJson() => _$StreamInitReturnDataToJson(this);
}

@JsonSerializable()
class SpeedTest {
  @JsonKey(name: "ping_num")
  final int? pingNum;
  @JsonKey(name: "ping_timeout")
  final int? pingTimeout;
  @JsonKey(name: "speed_frequency")
  final int? speedFrequency;
  @JsonKey(name: "speed_type")
  final int? speedType;

  SpeedTest({
    this.pingNum,
    this.pingTimeout,
    this.speedFrequency,
    this.speedType,
  });

  factory SpeedTest.fromJson(Map<String, dynamic> json) => _$SpeedTestFromJson(json);

  Map<String, dynamic> toJson() => _$SpeedTestToJson(this);
}
