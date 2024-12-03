// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ws_273_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Ws273Model _$Ws273ModelFromJson(Map<String, dynamic> json) => Ws273Model(
      tableId: (json['tableId'] as num?)?.toInt(),
      roundId: (json['roundId'] as num?)?.toInt(),
      playerId: (json['playerId'] as num?)?.toInt(),
      seatId: (json['seatId'] as num?)?.toInt(),
      balance: (json['balance'] as num?)?.toDouble(),
      currency: json['currency'] as String?,
      gameTypeId: (json['gameTypeId'] as num?)?.toInt(),
      betSource: (json['betSource'] as num?)?.toInt(),
      betMode: (json['betMode'] as num?)?.toInt(),
      cancelBettings: (json['cancelBettings'] as List<dynamic>?)
          ?.map((e) => CancelBettings.fromJson(e as Map<String, dynamic>))
          .toList(),
      tableBetInfoList: (json['tableBetInfoList'] as List<dynamic>?)
          ?.map((e) => TableBetInfoList.fromJson(e as Map<String, dynamic>))
          .toList(),
      mainPoint: (json['mainPoint'] as num?)?.toInt(),
    );

Map<String, dynamic> _$Ws273ModelToJson(Ws273Model instance) =>
    <String, dynamic>{
      'tableId': instance.tableId,
      'roundId': instance.roundId,
      'playerId': instance.playerId,
      'seatId': instance.seatId,
      'balance': instance.balance,
      'currency': instance.currency,
      'gameTypeId': instance.gameTypeId,
      'betSource': instance.betSource,
      'betMode': instance.betMode,
      'cancelBettings': instance.cancelBettings,
      'tableBetInfoList': instance.tableBetInfoList,
      'mainPoint': instance.mainPoint,
    };

CancelBettings _$CancelBettingsFromJson(Map<String, dynamic> json) =>
    CancelBettings(
      playerId: (json['playerId'] as num?)?.toInt(),
      betIdList: (json['betIdList'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      cancelAmount: (json['cancelAmount'] as num?)?.toInt(),
      betPointId: (json['betPointId'] as num?)?.toInt(),
      betPointName: json['betPointName'] as String?,
    );

Map<String, dynamic> _$CancelBettingsToJson(CancelBettings instance) =>
    <String, dynamic>{
      'playerId': instance.playerId,
      'betIdList': instance.betIdList,
      'cancelAmount': instance.cancelAmount,
      'betPointId': instance.betPointId,
      'betPointName': instance.betPointName,
    };

TableBetInfoList _$TableBetInfoListFromJson(Map<String, dynamic> json) =>
    TableBetInfoList(
      playerId: (json['playerId'] as num?)?.toInt(),
      betPointId: (json['betPointId'] as num?)?.toInt(),
      betAmount: (json['betAmount'] as num?)?.toInt(),
      currency: json['currency'] as String?,
      betTwoStatusFlag: (json['betTwoStatusFlag'] as num?)?.toInt(),
      betId: (json['betId'] as num?)?.toInt(),
      gameMode: (json['gameMode'] as num?)?.toInt(),
    );

Map<String, dynamic> _$TableBetInfoListToJson(TableBetInfoList instance) =>
    <String, dynamic>{
      'playerId': instance.playerId,
      'betPointId': instance.betPointId,
      'betAmount': instance.betAmount,
      'currency': instance.currency,
      'betTwoStatusFlag': instance.betTwoStatusFlag,
      'betId': instance.betId,
      'gameMode': instance.gameMode,
    };
