import 'dart:convert';

import 'package:flutter_main/models/common/bet_point_limit.dart';

Ws10073Model ws10073ModelFromJson(String str) =>
    Ws10073Model.fromJson(json.decode(str));

String ws10073ModelToJson(Ws10073Model data) => json.encode(data.toJson());

/// 每个桌子的内容 用这个解析
class Ws10073Model {
  int? tableId;
  int? betPointLimitVersion;
  List<BetPointLimit>? betPointLimit;

  Ws10073Model({
    this.tableId,
    this.betPointLimitVersion,
    this.betPointLimit,
  });

  factory Ws10073Model.fromJson(Map<String, dynamic> json) => Ws10073Model(
        tableId: json["tableId"],
        betPointLimitVersion: json["betPointLimitVersion"],
        betPointLimit: json["betPointLimit"] == null
            ? []
            : List<BetPointLimit>.from(
                json["betPointLimit"]!.map((x) => BetPointLimit.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "tableId": tableId,
        "betPointLimitVersion": betPointLimitVersion,
        "betPointLimit": betPointLimit == null
            ? []
            : List<dynamic>.from(betPointLimit!.map((x) => x.toJson())),
      };
}
