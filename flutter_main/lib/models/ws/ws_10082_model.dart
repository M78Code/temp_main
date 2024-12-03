import 'dart:convert';

Ws10082Model ws10082ModelFromJson(String str) =>
    Ws10082Model.fromJson(json.decode(str));

String ws10082ModelToJson(Ws10082Model data) => json.encode(data.toJson());

/// 每个桌子的内容 用这个解析
class Ws10082Model {
  int? playerId;
  List<int>? tableId;

  Ws10082Model({
    this.playerId,
    this.tableId,
  });

  factory Ws10082Model.fromJson(Map<String, dynamic> json) => Ws10082Model(
        playerId: json["playerId"],
        tableId: json["tableId"] == null
            ? []
            : List<int>.from(json["tableId"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "playerId": playerId,
        "tableId":
            tableId == null ? [] : List<dynamic>.from(tableId!.map((x) => x)),
      };
}
