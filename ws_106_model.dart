import 'package:json_annotation/json_annotation.dart';

part 'ws_106_model.g.dart';

@JsonSerializable()
class Ws106Model {
  final int? cardIndex; //开牌序号（1是当前为闲第一张，2是庄的第一张，3是闲的二张，4是庄的第二张，5是闲的第三张，6是庄的第三张）
  final int? cardNumber; //牌数字
  final int? cardOwner; //牌所属人（0庄，1闲）
  final List<CardResult>? cardResult; //开牌结果
  final List<CurrentRoundExtInfos>? currentRoundExtInfos; //当前局信息
  final int? messageId;//消息id
  final int? ownerIndex;
  final int? receiveTime;
  final int? roundId;

  const Ws106Model({
    this.cardIndex,
    this.cardNumber,
    this.cardOwner,
    this.cardResult,
    this.currentRoundExtInfos,
    this.messageId,
    this.ownerIndex,
    this.receiveTime,
    this.roundId,
  });

  factory Ws106Model.fromJson(Map<String, dynamic> json) =>
      _$Ws106ModelFromJson(json);

  Map<String, dynamic> toJson() => _$Ws106ModelToJson(this);
}

@JsonSerializable()
class CardResult {
  final int? owner; //0庄，1闲
  final String? result; //牌结果

  const CardResult({
    this.owner,
    this.result,
  });

  factory CardResult.fromJson(Map<String, dynamic> json) =>
      _$CardResultFromJson(json);

  Map<String, dynamic> toJson() => _$CardResultToJson(this);
}

@JsonSerializable()
class CurrentRoundExtInfos {
  final int? cardIndex; //开牌序号
  final int? cardNumber; //牌数字
  final int? cardOwner; //牌所属人（0庄，1闲）
  final int?
      ownerIndex; //所属人第几张（1是当前为闲第一张，2是庄的第一张，3是闲的二张，4是庄的第二张，5是闲的第三张，6是庄的第三张）

  const CurrentRoundExtInfos({
    this.cardIndex,
    this.cardNumber,
    this.cardOwner,
    this.ownerIndex,
  });

  factory CurrentRoundExtInfos.fromJson(Map<String, dynamic> json) =>
      _$CurrentRoundExtInfosFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentRoundExtInfosToJson(this);
}
