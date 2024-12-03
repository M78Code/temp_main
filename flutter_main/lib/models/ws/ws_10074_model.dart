import 'dart:convert';

import 'package:flutter_main/models/common/boot_number_limit.dart';

Ws10074Model ws10074ModelFromJson(String str) =>
    Ws10074Model.fromJson(json.decode(str));

String ws10074ModelToJson(Ws10074Model data) =>
    json.encode(data.toJson());

/// 每个桌子的内容 用这个解析
class Ws10074Model {
  int? gameTypeId;
  int? bootNumberLimitListVersion;
  List<BootNumberLimit>? list;

  Ws10074Model({
    this.gameTypeId,
    this.bootNumberLimitListVersion,
    this.list,
  });

  factory Ws10074Model.fromJson(Map<String, dynamic> json) =>
      Ws10074Model(
        gameTypeId: json["gameTypeId"],
        bootNumberLimitListVersion: json["bootNumberLimitListVersion"],
        list: json["list"] == null
            ? []
            : List<BootNumberLimit>.from(
                json["list"]!.map((x) => BootNumberLimit.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "gameTypeId": gameTypeId,
        "bootNumberLimitListVersion": bootNumberLimitListVersion,
        "betPointLimit": list == null
            ? []
            : List<dynamic>.from(list!.map((x) => x.toJson())),
      };
}


