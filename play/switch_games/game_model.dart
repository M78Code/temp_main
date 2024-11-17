import 'package:flutter/cupertino.dart';

class GamePageModel {
  GamePageModel(
      {required this.name,
      required this.page,
      this.iconDark,
      this.iconLight,
      this.unIconDark,
      this.unIconLight,
      this.groupId = 0});

  String? iconDark;
  String? unIconDark;

  String? iconLight;
  String? unIconLight;

  int groupId;

  String name;
  Widget page;
}

class GameTagModel {
  GameTagModel(this.name, this.code);

  String name;
  int code;

  ///经典
  static List<GameTagModel> get classicalList => [
        GameTagModel('全部', 1),
        GameTagModel('经典百家乐', 2001),
        GameTagModel('极速百家乐', 2002),
      ];

  ///特色
  static List<GameTagModel> get featureList => [
        GameTagModel('全部', 1),
        GameTagModel('竞咪百家乐', 2003),
        GameTagModel('共咪百家乐', 2005),
        GameTagModel('包桌百家乐', 2004),
        GameTagModel('高额百家乐', 2014),
      ];

  ///排序
  static List<GameTagModel> get sortList => [
        GameTagModel('好路排序', 1),
        GameTagModel('桌台排序', 0),
      ];

  ///大厅
  static List<GameTagModel> get hostList => [
        GameTagModel('全部厅', 0),
        GameTagModel('旗舰厅', 1),
        GameTagModel('国际厅', 5),
        GameTagModel('亚太厅', 3),
      ];

  ///显示模式 荷官模式 1 极简模式2 路子模式3 现场模式4
  static List<GameTagModel> get cellList => [
        GameTagModel('荷官模式', 1),
        GameTagModel('极简模式', 2),
        GameTagModel('路子模式', 3),
        GameTagModel('现场模式', 4),
      ];
}
