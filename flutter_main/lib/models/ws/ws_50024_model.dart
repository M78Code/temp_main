class Ws50024Model {
  int? tableId;
  int? playerId;
  String? playerName;
  List<Result>? result;

  Ws50024Model({
    this.tableId,
    this.playerId,
    this.playerName,
    this.result,
  });

  factory Ws50024Model.fromJson(Map<String, dynamic> json) => Ws50024Model(
        tableId: json["tableId"],
        playerId: json["playerId"],
        playerName: json["playerName"],
        result: json["result"] == null
            ? []
            : List<Result>.from(json["result"]!.map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "tableId": tableId,
        "playerId": playerId,
        "playerName": playerName,
        "result": result == null
            ? []
            : List<dynamic>.from(result!.map((x) => x.toJson())),
      };
}

class Result {
  int? type;
  int? bizId;
  String? name;
  int? rewardAmount;
  String? presentImgUrl;
  String? soundEffectFileUrl;
  String? animationEffectFileUrls;
  int? presentId;

  Result({
    this.type,
    this.bizId,
    this.name,
    this.rewardAmount,
    this.presentImgUrl,
    this.soundEffectFileUrl,
    this.animationEffectFileUrls,
    this.presentId,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        type: json["type"],
        bizId: json["bizId"],
        name: json["name"],
        rewardAmount: json["rewardAmount"],
        presentImgUrl: json["presentImgUrl"],
        soundEffectFileUrl: json["soundEffectFileUrl"],
        animationEffectFileUrls: json["animationEffectFileUrls"],
        presentId: json["presentId"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "bizId": bizId,
        "name": name,
        "rewardAmount": rewardAmount,
        "presentImgUrl": presentImgUrl,
        "soundEffectFileUrl": soundEffectFileUrl,
        "animationEffectFileUrls": animationEffectFileUrls,
        "presentId": presentId,
      };
}
