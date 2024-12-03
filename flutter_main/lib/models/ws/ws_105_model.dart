import 'package:json_annotation/json_annotation.dart';

part 'ws_105_model.g.dart';

@JsonSerializable()
class Ws105Model {
  final int? tableId;
  final int? roundId;
  final int? playerId;
  final int? seatId;
  final int? balance;
  final int? currentRoundAmount;
  final List<BetInfos>? betInfos;
  final dynamic betTwoStatusFlag;
  final int? betSource;

  const Ws105Model({
    this.tableId,
    this.roundId,
    this.playerId,
    this.seatId,
    this.balance,
    this.currentRoundAmount,
    this.betInfos,
    this.betTwoStatusFlag,
    this.betSource,
  });

  factory Ws105Model.fromJson(Map<String, dynamic> json) =>
      _$Ws105ModelFromJson(json);

  Map<String, dynamic> toJson() => _$Ws105ModelToJson(this);
}

@JsonSerializable()
class BetInfos {
  final int? betPointId;
  final String? betPointName;
  final int? betAmount;
  final bool? betResult;
  final String? betId;

  const BetInfos({
    this.betPointId,
    this.betPointName,
    this.betAmount,
    this.betResult,
    this.betId,
  });

  factory BetInfos.fromJson(Map<String, dynamic> json) =>
      _$BetInfosFromJson(json);

  Map<String, dynamic> toJson() => _$BetInfosToJson(this);
}
