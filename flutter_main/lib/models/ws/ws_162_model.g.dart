// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ws_162_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Ws162Model _$Ws162ModelFromJson(Map<String, dynamic> json) => Ws162Model(
      tableId: (json['tableId'] as num?)?.toInt(),
      roundId: (json['roundId'] as num?)?.toInt(),
      playerId: (json['playerId'] as num?)?.toInt(),
      seatId: (json['seatId'] as num?)?.toInt(),
      balance: (json['balance'] as num?)?.toInt(),
      betInfos: (json['betInfos'] as List<dynamic>?)
          ?.map((e) => BetInfos.fromJson(e as Map<String, dynamic>))
          .toList(),
      allBetInfos: (json['allBetInfos'] as List<dynamic>?)
          ?.map((e) => AllBetInfos.fromJson(e as Map<String, dynamic>))
          .toList(),
      currency: json['currency'] as String?,
    );

Map<String, dynamic> _$Ws162ModelToJson(Ws162Model instance) =>
    <String, dynamic>{
      'tableId': instance.tableId,
      'roundId': instance.roundId,
      'playerId': instance.playerId,
      'seatId': instance.seatId,
      'balance': instance.balance,
      'betInfos': instance.betInfos,
      'allBetInfos': instance.allBetInfos,
      'currency': instance.currency,
    };

BetInfos _$BetInfosFromJson(Map<String, dynamic> json) => BetInfos(
      betPointId: (json['betPointId'] as num?)?.toInt(),
      betPointName: json['betPointName'] as String?,
      betAmount: (json['betAmount'] as num?)?.toInt(),
      betResult: json['betResult'] as bool?,
    );

Map<String, dynamic> _$BetInfosToJson(BetInfos instance) => <String, dynamic>{
      'betPointId': instance.betPointId,
      'betPointName': instance.betPointName,
      'betAmount': instance.betAmount,
      'betResult': instance.betResult,
    };

AllBetInfos _$AllBetInfosFromJson(Map<String, dynamic> json) => AllBetInfos(
      betPointId: (json['betPointId'] as num?)?.toInt(),
      betAmount: (json['betAmount'] as num?)?.toInt(),
    );

Map<String, dynamic> _$AllBetInfosToJson(AllBetInfos instance) =>
    <String, dynamic>{
      'betPointId': instance.betPointId,
      'betAmount': instance.betAmount,
    };
