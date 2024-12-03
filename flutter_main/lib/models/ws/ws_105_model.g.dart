// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ws_105_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Ws105Model _$Ws105ModelFromJson(Map<String, dynamic> json) => Ws105Model(
      tableId: (json['tableId'] as num?)?.toInt(),
      roundId: (json['roundId'] as num?)?.toInt(),
      playerId: (json['playerId'] as num?)?.toInt(),
      seatId: (json['seatId'] as num?)?.toInt(),
      balance: (json['balance'] as num?)?.toInt(),
      currentRoundAmount: (json['currentRoundAmount'] as num?)?.toInt(),
      betInfos: (json['betInfos'] as List<dynamic>?)
          ?.map((e) => BetInfos.fromJson(e as Map<String, dynamic>))
          .toList(),
      betTwoStatusFlag: json['betTwoStatusFlag'],
      betSource: (json['betSource'] as num?)?.toInt(),
    );

Map<String, dynamic> _$Ws105ModelToJson(Ws105Model instance) =>
    <String, dynamic>{
      'tableId': instance.tableId,
      'roundId': instance.roundId,
      'playerId': instance.playerId,
      'seatId': instance.seatId,
      'balance': instance.balance,
      'currentRoundAmount': instance.currentRoundAmount,
      'betInfos': instance.betInfos,
      'betTwoStatusFlag': instance.betTwoStatusFlag,
      'betSource': instance.betSource,
    };

BetInfos _$BetInfosFromJson(Map<String, dynamic> json) => BetInfos(
      betPointId: (json['betPointId'] as num?)?.toInt(),
      betPointName: json['betPointName'] as String?,
      betAmount: (json['betAmount'] as num?)?.toInt(),
      betResult: json['betResult'] as bool?,
      betId: json['betId'] as String?,
    );

Map<String, dynamic> _$BetInfosToJson(BetInfos instance) => <String, dynamic>{
      'betPointId': instance.betPointId,
      'betPointName': instance.betPointName,
      'betAmount': instance.betAmount,
      'betResult': instance.betResult,
      'betId': instance.betId,
    };
