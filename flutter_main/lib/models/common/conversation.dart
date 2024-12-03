import 'package:flutter/material.dart';

class Conversation {
  String avatar;
  String title;
  Color titleColor;
  String des;
  String updateAt;
  bool isMute;
  int unreadMsgCount;
  bool displayDot;
  int groupId;
  String userId;
  int type;

  bool isAvatarFromNet() {
    if (this.avatar.indexOf('http') == 0 || this.avatar.indexOf('https') == 0) {
      return true;
    }
    return false;
  }

  Conversation(
      {required this.avatar,
      required this.title,
      this.titleColor = Colors.white,
      required this.des,
      required this.updateAt,
      this.isMute = false,
      this.unreadMsgCount = 0,
      this.displayDot = false,
      required this.groupId,
      required this.userId,
      required this.type})
      : assert(avatar != null),
        assert(title != null),
        assert(updateAt != null);

  static List<Conversation> mockConversations = [
    Conversation(
        avatar: 'assets/images/ic_file_transfer.png',
        title: '[模拟数据]文件传输助手',
        des: '[模拟数据]',
        updateAt: '19:56',
        unreadMsgCount: 0,
        displayDot: true,
        groupId: 000000,
        userId: "000000",
        type: 1),
    Conversation(
        avatar: 'assets/images/ic_tx_news.png',
        title: '[模拟数据]腾讯新闻',
        des: '[模拟数据]豪车与出租车刮擦 俩车主划拳定责',
        updateAt: '17:20',
        groupId: 000000,
        userId: "000000",
        type: 1),
    Conversation(
        avatar: 'assets/images/ic_wx_games.png',
        title: '[模拟数据]微信游戏',
        des: '[模拟数据]25元现金助力开学季！',
        updateAt: '17:12',
        groupId: 000000,
        userId: "000000",
        type: 1),
    Conversation(
        avatar: 'https://randomuser.me/api/portraits/men/10.jpg',
        title: '[模拟数据]汤姆丁',
        des: '[模拟数据]今晚要一起去吃肯德基吗？',
        updateAt: '17:56',
        isMute: true,
        unreadMsgCount: 0,
        groupId: 000000,
        userId: "000000",
        type: 1),
  ];
}
