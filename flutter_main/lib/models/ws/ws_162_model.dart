import 'package:json_annotation/json_annotation.dart';

part 'ws_162_model.g.dart';

@JsonSerializable()
class Ws162Model {
  final int? tableId;
  final int? roundId;
  final int? playerId;
  final int? seatId;
  final int? balance;
  final List<BetInfos>? betInfos;
  final List<AllBetInfos>? allBetInfos;
  final String? currency;

  const Ws162Model({
    this.tableId,
    this.roundId,
    this.playerId,
    this.seatId,
    this.balance,
    this.betInfos,
    this.allBetInfos,
    this.currency,
  });

  factory Ws162Model.fromJson(Map<String, dynamic> json) =>
      _$Ws162ModelFromJson(json);

  Map<String, dynamic> toJson() => _$Ws162ModelToJson(this);
}

@JsonSerializable()
class BetInfos {
  final int? betPointId;
  final String? betPointName;
  final int? betAmount;
  final bool? betResult;

  const BetInfos({
    this.betPointId,
    this.betPointName,
    this.betAmount,
    this.betResult,
  });

  factory BetInfos.fromJson(Map<String, dynamic> json) =>
      _$BetInfosFromJson(json);

  Map<String, dynamic> toJson() => _$BetInfosToJson(this);
}

@JsonSerializable()
class AllBetInfos {
  final int? betPointId;
  final int? betAmount;

  const AllBetInfos({
    this.betPointId,
    this.betAmount,
  });

  factory AllBetInfos.fromJson(Map<String, dynamic> json) =>
      _$AllBetInfosFromJson(json);

  Map<String, dynamic> toJson() => _$AllBetInfosToJson(this);
}
