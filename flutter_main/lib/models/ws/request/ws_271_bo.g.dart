// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ws_271_bo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Ws271Bo _$Ws271BoFromJson(Map<String, dynamic> json) => Ws271Bo(
      tableId: (json['tableId'] as num?)?.toInt(),
      roundId: (json['roundId'] as num?)?.toInt(),
      playerId: (json['playerId'] as num?)?.toInt(),
      gameTypeId: (json['gameTypeId'] as num?)?.toInt(),
      deviceType: (json['deviceType'] as num?)?.toInt(),
      isAll: (json['isAll'] as num?)?.toInt(),
      gameMode: (json['gameMode'] as num?)?.toInt(),
      betMode: (json['betMode'] as num?)?.toInt(),
      betSource: (json['betSource'] as num?)?.toInt(),
      bettingType: (json['bettingType'] as num?)?.toInt(),
      betPointIdList: (json['betPointIdList'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      deviceId: json['deviceId'] as String?,
    );

Map<String, dynamic> _$Ws271BoToJson(Ws271Bo instance) => <String, dynamic>{
      'tableId': instance.tableId,
      'roundId': instance.roundId,
      'playerId': instance.playerId,
      'gameTypeId': instance.gameTypeId,
      'deviceType': instance.deviceType,
      'isAll': instance.isAll,
      'gameMode': instance.gameMode,
      'betMode': instance.betMode,
      'betSource': instance.betSource,
      'bettingType': instance.bettingType,
      'betPointIdList': instance.betPointIdList,
      'deviceId': instance.deviceId,
    };
