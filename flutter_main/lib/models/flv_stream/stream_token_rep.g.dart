// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stream_token_rep.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StreamTokenRep _$StreamTokenRepFromJson(Map<String, dynamic> json) =>
    StreamTokenRep(
      returnData: json['return_data'] == null
          ? null
          : StreamTokenReturnData.fromJson(
              json['return_data'] as Map<String, dynamic>),
      returnDesc: json['return_desc'] as String?,
      returnStamp: json['return_stamp'] as String?,
    );

Map<String, dynamic> _$StreamTokenRepToJson(StreamTokenRep instance) =>
    <String, dynamic>{
      'return_data': instance.returnData,
      'return_desc': instance.returnDesc,
      'return_stamp': instance.returnStamp,
    };

StreamTokenReturnData _$StreamTokenReturnDataFromJson(
        Map<String, dynamic> json) =>
    StreamTokenReturnData(
      token: json['token'] as String?,
      url: json['url'] as String?,
      urls: json['urls'] as String?,
    );

Map<String, dynamic> _$StreamTokenReturnDataToJson(
        StreamTokenReturnData instance) =>
    <String, dynamic>{
      'token': instance.token,
      'url': instance.url,
      'urls': instance.urls,
    };
