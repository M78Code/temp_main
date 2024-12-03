import 'package:json_annotation/json_annotation.dart';

part 'ws_271_bo.g.dart';

@JsonSerializable()
class Ws271Bo {
  final int? tableId;
  final int? roundId;
  final int? playerId;
  final int? gameTypeId;
  final int? deviceType;
  final int? isAll;
  final int? gameMode;
  final int? betMode;
  final int? betSource;
  final int? bettingType;
  final List<int>? betPointIdList;
  final String? deviceId;

  const Ws271Bo({
    this.tableId,
    this.roundId,
    this.playerId,
    this.gameTypeId,
    this.deviceType,
    this.isAll,
    this.gameMode,
    this.betMode,
    this.betSource,
    this.bettingType,
    this.betPointIdList,
    this.deviceId,
  });

  factory Ws271Bo.fromJson(Map<String, dynamic> json) =>
      _$Ws271BoFromJson(json);

  Map<String, dynamic> toJson() => _$Ws271BoToJson(this);
}
