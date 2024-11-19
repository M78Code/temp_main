
import 'package:flutter_main/utils/Commond/Data/GameEnum.dart';

/// eventBus 监听事件类 发送给游戏内页切换游戏
class BetGameSwitchPlayDataModelEvent {

  final BetGameSwitchPlayDataModel mainModel;

  BetGameSwitchPlayDataModelEvent(this.mainModel);
}


class BetGameSwitchPlayDataModel {
  String? title;
  BetPointGroupType betPointType;
  SwitchBetType betType;
  /// 当前cell是否被选中  true：选中  false：未选中
  bool? isBeSelected;
  String? typeId;
  /// 当前的切换游戏的枚举
  BetPlayType betPlayType;


  BetGameSwitchPlayDataModel({
    this.title,
    BetPointGroupType? betPointType,
    SwitchBetType? betType,
    this.isBeSelected = false,
    this.typeId = "",
    this.betPlayType = BetPlayType.CLASSICS,
  }) : this.betPointType = betPointType ?? BetPointGroupType(betPointList: []), // 检查null并赋默认值
        this.betType = betType ?? SwitchBetType(switchBetList: []);

  // 从 JSON 反序列化
  factory BetGameSwitchPlayDataModel.fromJson(Map<String, dynamic> json) {
    return BetGameSwitchPlayDataModel(
      title: json['title'],
      betPointType: json['betPointType'] != null ? BetPointGroupType.fromJson(json['betPointType']) : null,
      betType: json['betType'] != null ? SwitchBetType.fromJson(json['betType']) : null,
      isBeSelected: json['isBeSelected'],
      typeId: json["typeId"],
      betPlayType: BetPlayType.values.firstWhere(
            (e) => e.value == json['betPlayType'],
        orElse: () => BetPlayType.CLASSICS, // 设置默认值
      ),
    );
  }

  // 转换为 JSON
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'betPointType': betPointType.toJson(),
      'betType': betType.toJson(),
      'isBeSelected': isBeSelected,
      "typeId": typeId,
      "betPlayType": betPlayType.value, // 转换为整数值
    };
  }


}

/// 下注的玩法类别 闲对 和 庄对 幸运7 超级幸运7 幸运6 闲龙宝 庄龙宝 任意对子 等等....
class BetPointGroupType{
  List<String>? betPointList;

  BetPointGroupType({this.betPointList});

  // 从 JSON 反序列化
  factory BetPointGroupType.fromJson(Map<String, dynamic> json) {
    return BetPointGroupType(
      betPointList: List<String>.from(json['betPointList'] ?? []),
    );
  }

  // 转换为 JSON
  Map<String, dynamic> toJson() {
    return {
      'betPointList': betPointList,
    };
  }


}

///棋牌 只有 庄 闲 和
class SwitchBetType{
  List<String>? switchBetList;

  SwitchBetType({this.switchBetList});

  // 从 JSON 反序列化
  factory SwitchBetType.fromJson(Map<String, dynamic> json) {
    return SwitchBetType(
      switchBetList: List<String>.from(json['switchBetList'] ?? []),
    );
  }

  // 转换为 JSON
  Map<String, dynamic> toJson() {
    return {
      'switchBetList': switchBetList,
    };
  }

}
