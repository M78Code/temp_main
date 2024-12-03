import 'package:json_annotation/json_annotation.dart';

part 'ws_game_status_model.g.dart';

@JsonSerializable()
class WsGameStatusModel {
  int? protocolId;
  final int? tableId;
  final int? roundId;
  final int? goodRoads;
  final int? serverTime;
  final int? countdownEndTime;
  final int? totalBetCountDown;
  final int? bootIndex;
  final int? casinoTime;
  final List<PlayerInfos>? playerInfos;
  final List<int>? activePoints;
  ///当前靴的玩法赢的局数的统计
  final BootReport? bootReport;
  final String? roundResult;
  final Map<String, dynamic>? winPoints;
  final List<CurrentRoundExtInfos>? currentRoundExtInfos;
  final BetPointNotAppears? betPointNotAppears;
  final String? roundNo;
  //新增207字段
  final int? maintainStartTime;
  final String? notice;
  final int? noticeId;
  final int? totalCountDown;

  WsGameStatusModel({
    this.protocolId,
    this.tableId,
    this.roundId,
    this.goodRoads,
    this.serverTime,
    this.countdownEndTime,
    this.totalBetCountDown,
    this.bootIndex,
    this.casinoTime,
    this.playerInfos,
    this.activePoints,
    this.bootReport,
    this.roundResult,
    this.winPoints,
    this.currentRoundExtInfos,
    this.betPointNotAppears,
    this.roundNo,
    //新增207字段
    this.maintainStartTime,
    this.notice,
    this.noticeId,
    this.totalCountDown,
  });

  factory WsGameStatusModel.fromJson(Map<String, dynamic> json) =>
      _$WsGameStatusModelFromJson(json);

  Map<String, dynamic> toJson() => _$WsGameStatusModelToJson(this);
}

@JsonSerializable()
class PlayerInfos {
  final int? playerId;
  final String? currency;
  final int? seatId;
  final int? superTieNetAmount;

  const PlayerInfos({
    this.playerId,
    this.currency,
    this.seatId,
    this.superTieNetAmount,
  });

  factory PlayerInfos.fromJson(Map<String, dynamic> json) =>
      _$PlayerInfosFromJson(json);

  Map<String, dynamic> toJson() => _$PlayerInfosToJson(this);
}

@JsonSerializable()
class BootReport {
  final int? totalCount;
  final List<Items>? items;

  const BootReport({
    this.totalCount,
    this.items,
  });

  factory BootReport.fromJson(Map<String, dynamic> json) =>
      _$BootReportFromJson(json);

  Map<String, dynamic> toJson() => _$BootReportToJson(this);
}
//
// 玩法id
//
// integer
//
// count
//
// 未出现的次数
//
// integer
//
// bootIndex
//
// 当前靴第几局
//
// integer(int32)
//
// bootReport
//
// 当前靴的玩法赢的局数的统计
@JsonSerializable()
class Items {
  final int? betPointId;
  final int? count;

  const Items({
    this.betPointId,
    this.count,
  });

  factory Items.fromJson(Map<String, dynamic> json) =>
      _$ItemsFromJson(json);

  Map<String, dynamic> toJson() => _$ItemsToJson(this);
}

@JsonSerializable()
class CurrentRoundExtInfos {
  final int? cardIndex;
  final int? cardOwner;
  final int? ownerIndex;
  final int? cardNumber;

  const CurrentRoundExtInfos({
    this.cardIndex,
    this.cardOwner,
    this.ownerIndex,
    this.cardNumber,
  });

  factory CurrentRoundExtInfos.fromJson(Map<String, dynamic> json) =>
      _$CurrentRoundExtInfosFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentRoundExtInfosToJson(this);
}

@JsonSerializable()
class BetPointNotAppears {
  final List<Items>? items;

  const BetPointNotAppears({
    this.items,
  });

  factory BetPointNotAppears.fromJson(Map<String, dynamic> json) =>
      _$BetPointNotAppearsFromJson(json);

  Map<String, dynamic> toJson() => _$BetPointNotAppearsToJson(this);
}
