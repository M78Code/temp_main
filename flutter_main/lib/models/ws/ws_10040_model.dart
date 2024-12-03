import 'package:json_annotation/json_annotation.dart';

part 'ws_10040_model.g.dart';

@JsonSerializable()
class Ws10040Model {
  final List<ActivityList>? activityList;

  const Ws10040Model({
    this.activityList,
  });

  factory Ws10040Model.fromJson(Map<String, dynamic> json) =>
      _$Ws10040ModelFromJson(json);

  Map<String, dynamic> toJson() => _$Ws10040ModelToJson(this);
}

@JsonSerializable()
class ActivityList {
  final int? activityTypeId;
  final String? activityTypeName;
  final int? showStartTime;
  final int? showEndTime;
  final int? activityStartTime;
  final int? activityEndTime;
  final int? serverTime;
  final List<ReturnProfitBetPointDTOS>? returnProfitBetPointDTOS;
  final ContextLanguageMap? contextLanguageMap;
  final int? lotteryChangeCount;
  final int? redeemChangeCount;
  final List<dynamic>? floatBuoyList;

  const ActivityList({
    this.activityTypeId,
    this.activityTypeName,
    this.showStartTime,
    this.showEndTime,
    this.activityStartTime,
    this.activityEndTime,
    this.serverTime,
    this.returnProfitBetPointDTOS,
    this.contextLanguageMap,
    this.lotteryChangeCount,
    this.redeemChangeCount,
    this.floatBuoyList,
  });

  factory ActivityList.fromJson(Map<String, dynamic> json) =>
      _$ActivityListFromJson(json);

  Map<String, dynamic> toJson() => _$ActivityListToJson(this);
}

@JsonSerializable()
class ReturnProfitBetPointDTOS {
  final int? betPointId;
  final String? betPointName;
  final String? returnProfitRate;

  const ReturnProfitBetPointDTOS({
    this.betPointId,
    this.betPointName,
    this.returnProfitRate,
  });

  factory ReturnProfitBetPointDTOS.fromJson(Map<String, dynamic> json) =>
      _$ReturnProfitBetPointDTOSFromJson(json);

  Map<String, dynamic> toJson() => _$ReturnProfitBetPointDTOSToJson(this);
}

@JsonSerializable()
class ContextLanguageMap {
  final Vi? vi;
  final Th? th;
  final Kr? kr;
  final En? en;
  final Cn? cn;
  final Tc? tc;

  const ContextLanguageMap({
    this.vi,
    this.th,
    this.kr,
    this.en,
    this.cn,
    this.tc,
  });

  factory ContextLanguageMap.fromJson(Map<String, dynamic> json) =>
      _$ContextLanguageMapFromJson(json);

  Map<String, dynamic> toJson() => _$ContextLanguageMapToJson(this);
}

@JsonSerializable()
class Vi {
  final String? languageCode;
  final String? content;

  const Vi({
    this.languageCode,
    this.content,
  });

  factory Vi.fromJson(Map<String, dynamic> json) =>
      _$ViFromJson(json);

  Map<String, dynamic> toJson() => _$ViToJson(this);
}

@JsonSerializable()
class Th {
  final String? languageCode;
  final String? content;

  const Th({
    this.languageCode,
    this.content,
  });

  factory Th.fromJson(Map<String, dynamic> json) =>
      _$ThFromJson(json);

  Map<String, dynamic> toJson() => _$ThToJson(this);
}

@JsonSerializable()
class Kr {
  final String? languageCode;
  final String? content;

  const Kr({
    this.languageCode,
    this.content,
  });

  factory Kr.fromJson(Map<String, dynamic> json) =>
      _$KrFromJson(json);

  Map<String, dynamic> toJson() => _$KrToJson(this);
}

@JsonSerializable()
class En {
  final String? languageCode;
  final String? content;

  const En({
    this.languageCode,
    this.content,
  });

  factory En.fromJson(Map<String, dynamic> json) =>
      _$EnFromJson(json);

  Map<String, dynamic> toJson() => _$EnToJson(this);
}

@JsonSerializable()
class Cn {
  final String? languageCode;
  final String? content;

  const Cn({
    this.languageCode,
    this.content,
  });

  factory Cn.fromJson(Map<String, dynamic> json) =>
      _$CnFromJson(json);

  Map<String, dynamic> toJson() => _$CnToJson(this);
}

@JsonSerializable()
class Tc {
  final String? languageCode;
  final String? content;

  const Tc({
    this.languageCode,
    this.content,
  });

  factory Tc.fromJson(Map<String, dynamic> json) =>
      _$TcFromJson(json);

  Map<String, dynamic> toJson() => _$TcToJson(this);
}
