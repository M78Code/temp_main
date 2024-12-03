// To parse this JSON data, do
//
//     final streamStrategyRep = streamStrategyRepFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'stream_strategy_rep.g.dart';

StreamStrategyRep streamStrategyRepFromJson(String str) => StreamStrategyRep.fromJson(json.decode(str));

String streamStrategyRepToJson(StreamStrategyRep data) => json.encode(data.toJson());

@JsonSerializable()
class StreamStrategyRep {
  @JsonKey(name: "return_data")
  final StreamStrategyReturnData? returnData;
  @JsonKey(name: "return_desc")
  final String? returnDesc;
  @JsonKey(name: "return_stamp")
  final String? returnStamp;

  StreamStrategyRep({
    this.returnData,
    this.returnDesc,
    this.returnStamp,
  });

  factory StreamStrategyRep.fromJson(Map<String, dynamic> json) => _$StreamStrategyRepFromJson(json);

  Map<String, dynamic> toJson() => _$StreamStrategyRepToJson(this);
}

@JsonSerializable()
class StreamStrategyReturnData {
  @JsonKey(name: "extraStrategyDtos")
  final List<dynamic>? extraStrategyDtos;
  @JsonKey(name: "strategyDtos")
  final List<StrategyDto>? strategyDtos;

  StreamStrategyReturnData({
    this.extraStrategyDtos,
    this.strategyDtos,
  });

  factory StreamStrategyReturnData.fromJson(Map<String, dynamic> json) => _$StreamStrategyReturnDataFromJson(json);

  Map<String, dynamic> toJson() => _$StreamStrategyReturnDataToJson(this);
}

@JsonSerializable()
class StrategyDto {
  @JsonKey(name: "applicationCode")
  final String? applicationCode;
  @JsonKey(name: "level")
  final int? level;
  @JsonKey(name: "mark")
  final String? mark;
  @JsonKey(name: "strategyCode")
  final String? strategyCode;
  @JsonKey(name: "strategyLineDtos")
  final List<StrategyLineDto>? strategyLineDtos;
  @JsonKey(name: "strategyName")
  final String? strategyName;
  @JsonKey(name: "type")
  final int? type;

  StrategyDto({
    this.applicationCode,
    this.level,
    this.mark,
    this.strategyCode,
    this.strategyLineDtos,
    this.strategyName,
    this.type,
  });

  factory StrategyDto.fromJson(Map<String, dynamic> json) => _$StrategyDtoFromJson(json);

  Map<String, dynamic> toJson() => _$StrategyDtoToJson(this);
}

@JsonSerializable()
class StrategyLineDto {
  @JsonKey(name: "app_id")
  final String? appId;
  @JsonKey(name: "applicationCode")
  final String? applicationCode;
  @JsonKey(name: "delay")
  final int? delay;
  @JsonKey(name: "domain")
  final List<Domain>? domain;
  @JsonKey(name: "hrefType")
  final String? hrefType;
  @JsonKey(name: "mountPoint")
  final String? mountPoint;
  @JsonKey(name: "order")
  final int? order;
  @JsonKey(name: "protocol")
  final String? protocol;
  @JsonKey(name: "remark")
  final String? remark;
  @JsonKey(name: "sharpness")
  final int? sharpness;
  @JsonKey(name: "strategyCode")
  final String? strategyCode;
  @JsonKey(name: "thirdpartyCode")
  final String? thirdpartyCode;

  StrategyLineDto({
    this.appId,
    this.applicationCode,
    this.delay,
    this.domain,
    this.hrefType,
    this.mountPoint,
    this.order,
    this.protocol,
    this.remark,
    this.sharpness,
    this.strategyCode,
    this.thirdpartyCode,
  });

  factory StrategyLineDto.fromJson(Map<String, dynamic> json) => _$StrategyLineDtoFromJson(json);

  Map<String, dynamic> toJson() => _$StrategyLineDtoToJson(this);
}

@JsonSerializable()
class Domain {
  @JsonKey(name: "host")
  final String? host;

  Domain({
    this.host,
  });

  factory Domain.fromJson(Map<String, dynamic> json) => _$DomainFromJson(json);

  Map<String, dynamic> toJson() => _$DomainToJson(this);
}
