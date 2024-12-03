// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ws_game_status_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WsGameStatusModel _$WsGameStatusModelFromJson(Map<String, dynamic> json) =>
    WsGameStatusModel(
      protocolId: (json['protocolId'] as num?)?.toInt(),
      tableId: (json['tableId'] as num?)?.toInt(),
      roundId: (json['roundId'] as num?)?.toInt(),
      goodRoads: (json['goodRoads'] as num?)?.toInt(),
      serverTime: (json['serverTime'] as num?)?.toInt(),
      countdownEndTime: (json['countdownEndTime'] as num?)?.toInt(),
      totalBetCountDown: (json['totalBetCountDown'] as num?)?.toInt(),
      bootIndex: (json['bootIndex'] as num?)?.toInt(),
      casinoTime: (json['casinoTime'] as num?)?.toInt(),
      playerInfos: (json['playerInfos'] as List<dynamic>?)
          ?.map((e) => PlayerInfos.fromJson(e as Map<String, dynamic>))
          .toList(),
      activePoints: (json['activePoints'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      bootReport: json['bootReport'] == null
          ? null
          : BootReport.fromJson(json['bootReport'] as Map<String, dynamic>),
      roundResult: json['roundResult'] as String?,
      winPoints: json['winPoints'] as Map<String, dynamic>?,
      currentRoundExtInfos: (json['currentRoundExtInfos'] as List<dynamic>?)
          ?.map((e) => CurrentRoundExtInfos.fromJson(e as Map<String, dynamic>))
          .toList(),
      betPointNotAppears: json['betPointNotAppears'] == null
          ? null
          : BetPointNotAppears.fromJson(
              json['betPointNotAppears'] as Map<String, dynamic>),
      roundNo: json['roundNo'] as String?,
      maintainStartTime: (json['maintainStartTime'] as num?)?.toInt(),
      notice: json['notice'] as String?,
      noticeId: (json['noticeId'] as num?)?.toInt(),
      totalCountDown: (json['totalCountDown'] as num?)?.toInt(),
    );

Map<String, dynamic> _$WsGameStatusModelToJson(WsGameStatusModel instance) =>
    <String, dynamic>{
      'protocolId': instance.protocolId,
      'tableId': instance.tableId,
      'roundId': instance.roundId,
      'goodRoads': instance.goodRoads,
      'serverTime': instance.serverTime,
      'countdownEndTime': instance.countdownEndTime,
      'totalBetCountDown': instance.totalBetCountDown,
      'bootIndex': instance.bootIndex,
      'casinoTime': instance.casinoTime,
      'playerInfos': instance.playerInfos,
      'activePoints': instance.activePoints,
      'bootReport': instance.bootReport,
      'roundResult': instance.roundResult,
      'winPoints': instance.winPoints,
      'currentRoundExtInfos': instance.currentRoundExtInfos,
      'betPointNotAppears': instance.betPointNotAppears,
      'roundNo': instance.roundNo,
      'maintainStartTime': instance.maintainStartTime,
      'notice': instance.notice,
      'noticeId': instance.noticeId,
      'totalCountDown': instance.totalCountDown,
    };

PlayerInfos _$PlayerInfosFromJson(Map<String, dynamic> json) => PlayerInfos(
      playerId: (json['playerId'] as num?)?.toInt(),
      currency: json['currency'] as String?,
      seatId: (json['seatId'] as num?)?.toInt(),
      superTieNetAmount: (json['superTieNetAmount'] as num?)?.toInt(),
    );

Map<String, dynamic> _$PlayerInfosToJson(PlayerInfos instance) =>
    <String, dynamic>{
      'playerId': instance.playerId,
      'currency': instance.currency,
      'seatId': instance.seatId,
      'superTieNetAmount': instance.superTieNetAmount,
    };

BootReport _$BootReportFromJson(Map<String, dynamic> json) => BootReport(
      totalCount: (json['totalCount'] as num?)?.toInt(),
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => Items.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BootReportToJson(BootReport instance) =>
    <String, dynamic>{
      'totalCount': instance.totalCount,
      'items': instance.items,
    };

Items _$ItemsFromJson(Map<String, dynamic> json) => Items(
      betPointId: (json['betPointId'] as num?)?.toInt(),
      count: (json['count'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ItemsToJson(Items instance) => <String, dynamic>{
      'betPointId': instance.betPointId,
      'count': instance.count,
    };

CurrentRoundExtInfos _$CurrentRoundExtInfosFromJson(
        Map<String, dynamic> json) =>
    CurrentRoundExtInfos(
      cardIndex: (json['cardIndex'] as num?)?.toInt(),
      cardOwner: (json['cardOwner'] as num?)?.toInt(),
      ownerIndex: (json['ownerIndex'] as num?)?.toInt(),
      cardNumber: (json['cardNumber'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CurrentRoundExtInfosToJson(
        CurrentRoundExtInfos instance) =>
    <String, dynamic>{
      'cardIndex': instance.cardIndex,
      'cardOwner': instance.cardOwner,
      'ownerIndex': instance.ownerIndex,
      'cardNumber': instance.cardNumber,
    };

BetPointNotAppears _$BetPointNotAppearsFromJson(Map<String, dynamic> json) =>
    BetPointNotAppears(
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => Items.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BetPointNotAppearsToJson(BetPointNotAppears instance) =>
    <String, dynamic>{
      'items': instance.items,
    };
