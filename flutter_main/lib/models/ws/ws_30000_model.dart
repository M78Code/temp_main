class Ws30000Model {
  int? playerId;
  String? chatRoomName;
  String? chatRoomNo;
  int? customChat;
  int? playerEnableChatId;
  List<dynamic>? roomChatRecordList;
  int? tableMessageCount;
  int? tableMessageTime;
  double? validBetAmount;
  int? effectiveChatTime;
  int? chatWordLengthLimit;

  Ws30000Model({
    this.playerId,
    this.chatRoomName,
    this.chatRoomNo,
    this.customChat,
    this.playerEnableChatId,
    this.roomChatRecordList,
    this.tableMessageCount,
    this.tableMessageTime,
    this.validBetAmount,
    this.effectiveChatTime,
    this.chatWordLengthLimit,
  });

  factory Ws30000Model.fromJson(Map<String, dynamic> json) => Ws30000Model(
        playerId: json["playerId"],
        chatRoomName: json["chatRoomName"],
        chatRoomNo: json["chatRoomNo"],
        customChat: json["customChat"],
        playerEnableChatId: json["playerEnableChatId"],
        roomChatRecordList: json["roomChatRecordList"] == null
            ? []
            : List<dynamic>.from(json["roomChatRecordList"]!.map((x) => x)),
        tableMessageCount: json["tableMessageCount"],
        tableMessageTime: json["tableMessageTime"],
        validBetAmount: json["validBetAmount"],
        effectiveChatTime: json["effectiveChatTime"],
        chatWordLengthLimit: json["chatWordLengthLimit"],
      );

  Map<String, dynamic> toJson() => {
        "playerId": playerId,
        "chatRoomName": chatRoomName,
        "chatRoomNo": chatRoomNo,
        "customChat": customChat,
        "playerEnableChatId": playerEnableChatId,
        "roomChatRecordList": roomChatRecordList == null
            ? []
            : List<dynamic>.from(roomChatRecordList!.map((x) => x)),
        "tableMessageCount": tableMessageCount,
        "tableMessageTime": tableMessageTime,
        "validBetAmount": validBetAmount,
        "effectiveChatTime": effectiveChatTime,
        "chatWordLengthLimit": chatWordLengthLimit,
      };
}
