class Ws30004Model {
  int? playerEnableChat;
  int? playerId;

  Ws30004Model({
    this.playerEnableChat,
    this.playerId,
  });

  factory Ws30004Model.fromJson(Map<String, dynamic> json) => Ws30004Model(
        playerEnableChat: json["playerEnableChat"],
        playerId: json["playerId"],
      );

  Map<String, dynamic> toJson() => {
        "playerEnableChat": playerEnableChat,
        "playerId": playerId,
      };
}
