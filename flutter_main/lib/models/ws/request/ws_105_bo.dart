import 'package:json_annotation/json_annotation.dart';

part 'ws_105_bo.g.dart';

@JsonSerializable()
class Ws105Bo{
  // 下注明细
  final List<BetInfosBo>? betInfos;
  // 投注模式	integer(int32)	TRUE	1-快速投注、2-普通投注
  final int? betSource;
  // 局id	integer(int64)	TRUE	局号ID
  final int? bettingMode;
  // c端设备类型	integer(int32)	TRUE	1=网页，2=手机网页，3=Ios，4=Android，5=其他设备，6=无
  final int? clientDeviceType;
  // 用户设备Id	String	TRUE	取用户设备ID
  final String? deviceId;
  // 用户设备类型	String	TRUE	1-网页，2-手机网页，3-Ios，4-Android，5-其他设备，6-未知
  final int? deviceType;
  // 局id	integer(int64)	TRUE	局号ID
  final int? roundId;

  const Ws105Bo({
    required this.betInfos,
    required this.betSource,
    required this.bettingMode,
    this.clientDeviceType,
    this.deviceId,
    this.deviceType,
    required this.roundId,
  });

  factory Ws105Bo.fromJson(Map<String, dynamic> json) =>
      _$Ws105BoFromJson(json);

  Map<String, dynamic> toJson() => _$Ws105BoToJson(this);
}

@JsonSerializable()
class BetInfosBo {
  // 下注金额
  int? betAmount;
  //下注顺序 越大表示越后面	integer	TRUE	获取服务器时间戳
  int? betIndex;
  //betPointId	玩法id	integer	TRUE	对应的玩法id：ex:3001
  int? betPointId;

  BetInfosBo({
    this.betAmount,
    this.betIndex,
    this.betPointId,
  });

  factory BetInfosBo.fromJson(Map<String, dynamic> json) =>
      _$BetInfosBoFromJson(json);

  Map<String, dynamic> toJson() => _$BetInfosBoToJson(this);
}
