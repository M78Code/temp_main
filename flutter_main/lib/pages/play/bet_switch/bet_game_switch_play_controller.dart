
import 'package:flutter_main/pages/play/bet_switch/bet_game_switch_data_model.dart';
import 'package:get/get.dart';
import 'dart:convert';

import '../../../models/ws/ws_116_model.dart';

class BetGameSwitchPlayController extends GetxController {
  Rx<Ws116RoadGameTableDetailModel> ws116Model = Ws116RoadGameTableDetailModel(
    roadPaper: RoadPaper(), // 确保 roadPaper 被初始化
  ).obs;

  // 使用 RxList 以便监听 dataList 变化
  RxList<BetGameSwitchPlayDataModel> dataList =
      <BetGameSwitchPlayDataModel>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    initPageData();
  }

  /// 初始化玩法切换的数据
  void initPageData() {
    BetGameSwitchPlayDataModel model1 = BetGameSwitchPlayDataModel(
      title: "经典",
      betPointType: BetPointGroupType(betPointList: ["闲对", "和", "庄对"]),
      betType: SwitchBetType(switchBetList: ["闲", "庄"]),
      // 经典是默认被选中的
      isBeSelected: true,
      typeId: "0",
    );
    dataList.add(model1);

    BetGameSwitchPlayDataModel model2 = BetGameSwitchPlayDataModel(
      title: "幸运6",
      betPointType:
      BetPointGroupType(betPointList: ["闲对", "幸运7", "超级幸运7", "幸运6", "庄对"]),
      betType: SwitchBetType(switchBetList: ["闲", "和", "庄"]),
      isBeSelected: false,
      typeId: "1",
    );

    dataList.add(model2);

    BetGameSwitchPlayDataModel model3 = BetGameSwitchPlayDataModel(
      title: "龙宝",
      betPointType:
      BetPointGroupType(betPointList: ["闲对", "闲龙宝", "幸运6", "庄龙宝", "庄对"]),
      betType: SwitchBetType(switchBetList: ["闲", "和", "庄"]),
      isBeSelected: false,
      typeId: "2",
    );

    dataList.add(model3);

    BetGameSwitchPlayDataModel model4 = BetGameSwitchPlayDataModel(
      title: "对子",
      betPointType:
      BetPointGroupType(betPointList: ["闲对", "任意对子", "超级对", "完美对子", "庄对"]),
      betType: SwitchBetType(switchBetList: ["闲", "和", "庄"]),
      isBeSelected: false,
      typeId: "3",
    );

    dataList.add(model4);

    BetGameSwitchPlayDataModel model5 = BetGameSwitchPlayDataModel(
      title: "超和&龙7",
      betPointType:
      BetPointGroupType(betPointList: ["闲对", "熊猫8", "超和", "龙7", "庄对"]),
      betType: SwitchBetType(switchBetList: ["闲", "和", "庄"]),
      isBeSelected: false,
      typeId: "4",
    );

    dataList.add(model5);

    BetGameSwitchPlayDataModel model6 = BetGameSwitchPlayDataModel(
      title: "老虎",
      betPointType:
      BetPointGroupType(betPointList: ["老虎和", "大老虎", "幸运6", "小老虎", "老虎对"]),
      betType: SwitchBetType(switchBetList: ["闲", "和", "庄"]),
      isBeSelected: false,
      typeId: "5",
    );

    dataList.add(model6);
  }

  /// 更新选中cell 并刷新UI
  void selectItem(int index) {
    for (int i = 0; i < dataList.length; i++) {
      dataList[i].isBeSelected = i == index;
    }
    dataList.refresh();
    print("点击了当前第${index}个cell");
  }


}
