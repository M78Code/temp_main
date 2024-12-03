import 'package:flutter_main/pages/play/chat/chat_model.dart';

import '../../controllers/global_controller.dart';

class Ws30002Model {
  ///聊天室编号
  String? roomNo;

  ///聊天室名称
  String? roomName;

  ///聊天消息ID
  String? chatMessageId;

  ///玩家ID
  int? playerId;

  ///玩家昵称
  String? playerNickName;

  ///玩家登录账号
  String? playerLoginName;

  ///原始消息
  String? originContent;

  ///过滤后的消息
  String? content;

  ///是否进行了敏感词过滤 0 - 没有过滤 1 - 过滤了
  int? filterFlag;
  int? updateTime;

  ///是否是系统消息类型0-不是，1-是
  int? systemMessageType;

  ///是否是美女主播发送的聊天
  bool? beautyAnchorFlag;

  ///是否是桌边主播发送的聊天
  bool? tableAnchorFlag;

  ///0: 其他消息；1:快捷消息；2:表情；3:互动表情
  int messageType = 0;

  ///审核
  int? audit;

  String? icon;

  Ws30002Model({
    this.roomNo,
    this.roomName,
    this.chatMessageId,
    this.playerId,
    this.playerNickName,
    this.playerLoginName,
    this.systemMessageType,
    this.originContent,
    this.content,
    this.filterFlag,
    this.updateTime,
    this.beautyAnchorFlag,
    this.tableAnchorFlag,
    this.audit,
    this.messageType = 0,
    this.icon,
  });

  factory Ws30002Model.fromJson(Map<String, dynamic> json) {
    String str = json["originContent"] as String;
    bool isText = ChatList.contains(str);
    int _messageType = 1;
    String? _icon;
    if (!isText) {
      bool isEmoji = ChatIconKeys.contains(str);
      if (isEmoji && json["systemMessageType"] != 1) {
        var icon =
            ChatIconList.firstWhere((e) => (e['name'] as String) == str)['res']
                as String;
        _icon = icon;
        if (icon.startsWith('main_icon')) {
          _messageType = 2;
        } else {
          _messageType = 3;
        }
      } else {
        _messageType = 0;
      }
    }

    return Ws30002Model(
      roomNo: json["roomNo"],
      roomName: json["roomName"],
      chatMessageId: json["chatMessageId"],
      playerId: json["playerId"],
      playerNickName: json["playerNickName"],
      originContent: json["originContent"],
      content: json["content"],
      filterFlag: json["filterFlag"],
      updateTime: json["updateTime"],
      beautyAnchorFlag: json["beautyAnchorFlag"],
      tableAnchorFlag: json["tableAnchorFlag"],
      audit: json["audit"],
      playerLoginName: json["playerLoginName"],
      systemMessageType: json["systemMessageType"],
      messageType: _messageType,
      icon: _icon,
    );
  }

  Map<String, dynamic> toJson() => {
        "roomNo": roomNo,
        "roomName": roomName,
        "chatMessageId": chatMessageId,
        "playerId": playerId,
        "playerNickName": playerNickName,
        "originContent": originContent,
        "content": content,
        "filterFlag": filterFlag,
        "updateTime": updateTime,
        "beautyAnchorFlag": beautyAnchorFlag,
        "tableAnchorFlag": tableAnchorFlag,
        "audit": audit,
        "systemMessageType": systemMessageType,
        "playerLoginName": playerLoginName,
      };

  bool isMe() => playerId == (GlobalController.controller.playerId ?? -1);
}
