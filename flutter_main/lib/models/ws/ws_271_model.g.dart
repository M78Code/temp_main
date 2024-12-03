// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ws_271_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Ws271Model _$Ws271ModelFromJson(Map<String, dynamic> json) => Ws271Model(
      tableId: (json['tableId'] as num?)?.toInt(),
      roundId: (json['roundId'] as num?)?.toInt(),
      playerId: (json['playerId'] as num?)?.toInt(),
      gameTypeId: (json['gameTypeId'] as num?)?.toInt(),
      betPointId: json['betPointId'],
      betSource: (json['betSource'] as num?)?.toInt(),
      betMode: (json['betMode'] as num?)?.toInt(),
      seatId: (json['seatId'] as num?)?.toInt(),
      isSelf: (json['isSelf'] as num?)?.toInt(),
      balance: (json['balance'] as num?)?.toDouble(),
      matchId: json['matchId'],
      bettingType: (json['bettingType'] as num?)?.toInt(),
      cancelBettings: (json['cancelBettings'] as List<dynamic>?)
          ?.map((e) => CancelBettings.fromJson(e as Map<String, dynamic>))
          .toList(),
      tableBetInfoList: (json['tableBetInfoList'] as List<dynamic>?)
          ?.map((e) => TableBetInfoList.fromJson(e as Map<String, dynamic>))
          .toList(),
      mainPoint: (json['mainPoint'] as num?)?.toInt(),
    );

Map<String, dynamic> _$Ws271ModelToJson(Ws271Model instance) =>
    <String, dynamic>{
      'tableId': instance.tableId,
      'roundId': instance.roundId,
      'playerId': instance.playerId,
      'gameTypeId': instance.gameTypeId,
      'betPointId': instance.betPointId,
      'betSource': instance.betSource,
      'betMode': instance.betMode,
      'seatId': instance.seatId,
      'isSelf': instance.isSelf,
      'balance': instance.balance,
      'matchId': instance.matchId,
      'bettingType': instance.bettingType,
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
