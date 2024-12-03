import 'package:json_annotation/json_annotation.dart';

part 'ws_271_model.g.dart';

@JsonSerializable()
class Ws271Model {
  final int? tableId;
  final int? roundId;
  final int? playerId;
  final int? gameTypeId;
  final dynamic betPointId;
  final int? betSource;
  final int? betMode;
  final int? seatId;
  final int? isSelf;
  final double? balance;
  final dynamic matchId;
  final int? bettingType;
  final List<CancelBettings>? cancelBettings;
  final List<TableBetInfoList>? tableBetInfoList;
  final int? mainPoint;

  const Ws271Model({
    this.tableId,
    this.roundId,
    this.playerId,
    this.gameTypeId,
    this.betPointId,
    this.betSource,
    this.betMode,
    this.seatId,
    this.isSelf,
    this.balance,
    this.matchId,
    this.bettingType,
    this.cancelBettings,
    this.tableBetInfoList,
    this.mainPoint,
  });

  factory Ws271Model.fromJson(Map<String, dynamic> json) =>
      _$Ws271ModelFromJson(json);

  Map<String, dynamic> toJson() => _$Ws271ModelToJson(this);
}

@JsonSerializable()
class CancelBettings {
  final int? playerId;
  final List<int>? betIdList;
  final int? cancelAmount;
  final int? betPointId;
  final String? betPointName;

  const CancelBettings({
    this.playerId,
    this.betIdList,
    this.cancelAmount,
    this.betPointId,
    this.betPointName,
  });

  factory CancelBettings.fromJson(Map<String, dynamic> json) =>
      _$CancelBettingsFromJson(json);

  Map<String, dynamic> toJson() => _$CancelBettingsToJson(this);
}

@JsonSerializable()
class TableBetInfoList {
  final int? playerId;
  final int? betPointId;
  final int? betAmount;
  final String? currency;
  final int? betTwoStatusFlag;
  final int? betId;
  final int? gameMode;

  const TableBetInfoList({
    this.playerId,
    this.betPointId,
    this.betAmount,
    this.currency,
    this.betTwoStatusFlag,
    this.betId,
    this.gameMode,
  });

  factory TableBetInfoList.fromJson(Map<String, dynamic> json) =>
      _$TableBetInfoListFromJson(json);

  Map<String, dynamic> toJson() => _$TableBetInfoListToJson(this);
}
