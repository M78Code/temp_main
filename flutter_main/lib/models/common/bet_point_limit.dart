class BetPointLimit {
  String? betPointGroup;
  int? groupId;
  int? min;
  int? max;
  String? playRate;
  bool? dynamicFlag;
  // Map<String, BetPointMap>? betPointMap;
  List<DynamicBetPoint>? dynamicBetPoint;

  BetPointLimit({
    this.betPointGroup,
    this.groupId,
    this.min,
    this.max,
    this.playRate,
    this.dynamicFlag,
    // this.betPointMap,
    this.dynamicBetPoint,
  });

  factory BetPointLimit.fromJson(Map<String, dynamic> json) => BetPointLimit(
        betPointGroup: json["betPointGroup"],
        groupId: json["groupId"],
        min: json["min"],
        max: json["max"],
        playRate: json["playRate"],
        dynamicFlag: json["dynamicFlag"],
        // betPointMap: Map.from(json["betPointMap"]!).map((k, v) => MapEntry<String, BetPointMap>(k, BetPointMap.fromJson(v))),
        dynamicBetPoint: json["dynamicBetPoint"] == null
            ? []
            : List<DynamicBetPoint>.from(json["dynamicBetPoint"]!
                .map((x) => DynamicBetPoint.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "betPointGroup": betPointGroup,
        "groupId": groupId,
        "min": min,
        "max": max,
        "playRate": playRate,
        "dynamicFlag": dynamicFlag,
        // "betPointMap": Map.from(betPointMap!).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        "dynamicBetPoint": dynamicBetPoint == null
            ? []
            : List<dynamic>.from(dynamicBetPoint!.map((x) => x.toJson())),
      };
}

class DynamicBetPoint {
  String? name;
  int? rate;

  DynamicBetPoint({
    this.name,
    this.rate,
  });

  factory DynamicBetPoint.fromJson(Map<String, dynamic> json) =>
      DynamicBetPoint(
        name: json["name"],
        rate: json["rate"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "rate": rate,
      };
}
