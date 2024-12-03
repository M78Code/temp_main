class BetGameSwitchPlayDataModel {
  String? title;
  BetPointGroupType betPointType;
  SwitchBetType betType;
  /// 当前cell是否被选中  true：选中  false：未选中
  bool? isBeSelected;
  String? typeId;


  BetGameSwitchPlayDataModel({
    this.title,
    BetPointGroupType? betPointType,
    SwitchBetType? betType,
    this.isBeSelected = false,
    this.typeId = "",
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
    );
  }

  // 转换为 JSON
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'betPointType': betPointType?.toJson(),
      'betType': betType?.toJson(),
      'isBeSelected': isBeSelected,
      "typeId": typeId,
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
