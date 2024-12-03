// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ws_105_bo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Ws105Bo _$Ws105BoFromJson(Map<String, dynamic> json) => Ws105Bo(
      betInfos: (json['betInfos'] as List<dynamic>?)
          ?.map((e) => BetInfosBo.fromJson(e as Map<String, dynamic>))
          .toList(),
      betSource: (json['betSource'] as num?)?.toInt(),
      bettingMode: (json['bettingMode'] as num?)?.toInt(),
      clientDeviceType: (json['clientDeviceType'] as num?)?.toInt(),
      deviceId: json['deviceId'] as String?,
      deviceType: (json['deviceType'] as num?)?.toInt(),
      roundId: (json['roundId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$Ws105BoToJson(Ws105Bo instance) => <String, dynamic>{
      'betInfos': instance.betInfos,
      'betSource': instance.betSource,
      'bettingMode': instance.bettingMode,
      'clientDeviceType': instance.clientDeviceType,
      'deviceId': instance.deviceId,
      'deviceType': instance.deviceType,
      'roundId': instance.roundId,
    };

BetInfosBo _$BetInfosBoFromJson(Map<String, dynamic> json) => BetInfosBo(
      betAmount: (json['betAmount'] as num?)?.toInt(),
      betIndex: (json['betIndex'] as num?)?.toInt(),
      betPointId: (json['betPointId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$BetInfosBoToJson(BetInfosBo instance) =>
    <String, dynamic>{
      'betAmount': instance.betAmount,
      'betIndex': instance.betIndex,
      'betPointId': instance.betPointId,
    };
