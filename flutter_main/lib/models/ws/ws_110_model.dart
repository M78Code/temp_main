import 'package:json_annotation/json_annotation.dart';

part 'ws_110_model.g.dart';

@JsonSerializable()
class Ws110Model {
  final int? superTiePlayerCount;
  final int? currentRoundPlayerCount;
  final int? currentRoundPlayerAmountCount;
  final String? currency;
  final List<JackpotPoolInfos>? jackpotPoolInfos;
  final List<VirtualTableDetail>? virtualTableDetail;

  const Ws110Model({
    this.superTiePlayerCount,
    this.currentRoundPlayerCount,
    this.currentRoundPlayerAmountCount,
    this.currency,
    this.jackpotPoolInfos,
    this.virtualTableDetail,
  });

  factory Ws110Model.fromJson(Map<String, dynamic> json) =>
      _$Ws110ModelFromJson(json);

  Map<String, dynamic> toJson() => _$Ws110ModelToJson(this);
}

@JsonSerializable()
class JackpotPoolInfos {
  final int? betPointId;
  final int? totalAmount;
  final int? totalPersonCount;

  const JackpotPoolInfos({
    this.betPointId,
    this.totalAmount,
    this.totalPersonCount,
  });

  factory JackpotPoolInfos.fromJson(Map<String, dynamic> json) =>
      _$JackpotPoolInfosFromJson(json);

  Map<String, dynamic> toJson() => _$JackpotPoolInfosToJson(this);
}

@JsonSerializable()
class VirtualTableDetail {
  final int? playerId;
  final int? betPointId;
  final int? amount;

  const VirtualTableDetail({
    this.playerId,
    this.betPointId,
    this.amount,
  });

  factory VirtualTableDetail.fromJson(Map<String, dynamic> json) =>
      _$VirtualTableDetailFromJson(json);

  Map<String, dynamic> toJson() => _$VirtualTableDetailToJson(this);
}
