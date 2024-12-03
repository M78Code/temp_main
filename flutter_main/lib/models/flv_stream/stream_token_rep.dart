// To parse this JSON data, do
//
//     final streamTokenRep = streamTokenRepFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'stream_token_rep.g.dart';

StreamTokenRep streamTokenRepFromJson(String str) => StreamTokenRep.fromJson(json.decode(str));

String streamTokenRepToJson(StreamTokenRep data) => json.encode(data.toJson());

@JsonSerializable()
class StreamTokenRep {
  @JsonKey(name: "return_data")
  final StreamTokenReturnData? returnData;
  @JsonKey(name: "return_desc")
  final String? returnDesc;
  @JsonKey(name: "return_stamp")
  final String? returnStamp;

  StreamTokenRep({
    this.returnData,
    this.returnDesc,
    this.returnStamp,
  });

  factory StreamTokenRep.fromJson(Map<String, dynamic> json) => _$StreamTokenRepFromJson(json);

  Map<String, dynamic> toJson() => _$StreamTokenRepToJson(this);
}

@JsonSerializable()
class StreamTokenReturnData {
  @JsonKey(name: "token")
  final String? token;
  @JsonKey(name: "url")
  final String? url;
  @JsonKey(name: "urls")
  final String? urls;

  StreamTokenReturnData({
    this.token,
    this.url,
    this.urls,
  });

  factory StreamTokenReturnData.fromJson(Map<String, dynamic> json) => _$StreamTokenReturnDataFromJson(json);

  Map<String, dynamic> toJson() => _$StreamTokenReturnDataToJson(this);
}
