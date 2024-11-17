
import 'package:flutter_main/pages/play/bet_on/bet_on_controller.dart';
import 'package:flutter_main/pages/play/bet_switch/bet_game_switch_data_model.dart';
import 'package:flutter_main/pages/play/play_room/index.dart';
import 'package:flutter_main/utils/Commond/Data/GameEnum.dart';
import 'package:flutter_main/utils/event_bus_util.dart';
import 'package:get/get.dart';
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

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  /// 初始化玩法切换的数据 注意： 此处玩法切换有个凤凰的联名玩法，等后期需要加上，现在先隐藏
  void initPageData() {
    BetGameSwitchPlayDataModel model1 = BetGameSwitchPlayDataModel(
      title: "经典",
      betPointType: BetPointGroupType(betPointList: ["闲对", "和", "庄对"]),
      betType: SwitchBetType(switchBetList: ["闲", "庄"]),
      // 经典是默认被选中的
      isBeSelected: true,
      typeId: "0",
      betPlayType: BetPlayType.CLASSICS,
    );
    dataList.add(model1);


    // /// 超级幸运7
    // SUPER_LUCK_7(2),
    // /// 超和
    // SUPER_TIE(5),



    BetGameSwitchPlayDataModel model2 = BetGameSwitchPlayDataModel(
      title: "幸运6",
      betPointType:
      BetPointGroupType(betPointList: ["闲对", "幸运7", "超级幸运7", "幸运6", "庄对"]),
      betType: SwitchBetType(switchBetList: ["闲", "和", "庄"]),
      isBeSelected: false,
      typeId: "1",
      betPlayType: BetPlayType.SUPER_LUCK_7,
    );

    dataList.add(model2);

    BetGameSwitchPlayDataModel model3 = BetGameSwitchPlayDataModel(
      title: "龙宝",
      betPointType:
      BetPointGroupType(betPointList: ["闲对", "闲龙宝", "幸运6", "庄龙宝", "庄对"]),
      betType: SwitchBetType(switchBetList: ["闲", "和", "庄"]),
      isBeSelected: false,
      typeId: "2",
      betPlayType: BetPlayType.LUCK_6,
    );

    dataList.add(model3);

    BetGameSwitchPlayDataModel model4 = BetGameSwitchPlayDataModel(
      title: "对子",
      betPointType:
      BetPointGroupType(betPointList: ["闲对", "任意对子", "超级对", "完美对子", "庄对"]),
      betType: SwitchBetType(switchBetList: ["闲", "和", "庄"]),
      isBeSelected: false,
      typeId: "3",
      betPlayType: BetPlayType.SUPER_PAIR,
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
      betPlayType: BetPlayType.LUCK_6_TIGER,
    );

    dataList.add(model6);


    BetGameSwitchPlayDataModel model7 = BetGameSwitchPlayDataModel(
      title: "天牌",
      betPointType:
      BetPointGroupType(betPointList: ["闲对", "闲天牌", "天牌", "庄天牌", "庄对"]),
      betType: SwitchBetType(switchBetList: ["闲", "和", "庄"]),
      isBeSelected: false,
      typeId: "6",
      betPlayType: BetPlayType.NATURAL,
    );

    dataList.add(model7);


    BetGameSwitchPlayDataModel model8 = BetGameSwitchPlayDataModel(
      title: "龙虎",
      betPointType:
      BetPointGroupType(betPointList: ["闲对", "虎", "龙虎和", "龙", "庄对"]),
      betType: SwitchBetType(switchBetList: ["闲", "和", "庄"]),
      isBeSelected: false,
      typeId: "7",
      betPlayType: BetPlayType.DRAGON_TIGER,
    );

    dataList.add(model8);


    BetGameSwitchPlayDataModel model9 = BetGameSwitchPlayDataModel(
      title: "大小",
      betPointType:
      BetPointGroupType(betPointList: ["闲对", "小", "大", "庄对"]),
      betType: SwitchBetType(switchBetList: ["闲", "和", "庄"]),
      isBeSelected: false,
      typeId: "8",
      betPlayType: BetPlayType.BIG_SMALL,
    );

    dataList.add(model9);

  }

  /// 更新选中cell 并刷新UI
  void selectItem(int index) {
    for (int i = 0; i < dataList.length; i++) {
      dataList[i].isBeSelected = i == index;
    }
    dataList.refresh();
    print("点击了当前第${index}个cell");

    // 发送通知告诉游戏页进行了切换
    //  EventBusRoadUtil.eventBus.fire(BetGameSwitchPlayDataModelEvent(dataList[index]));

    BetOnController.controller.mBetPlayType.value = dataList[index].betPlayType.value;

     /*
     // 游戏页接收 例子：
    EventBusRoadUtil.eventBus.on<BetGameSwitchPlayDataModelEvent>().listen((event) {
      /// typeId 对应的值
        /// "0" "经典";
        /// "1" "幸运6";
        /// "2" "龙宝";
        /// "3" "对子";
        /// "4" "超和&龙7";
        /// "5" "老虎"
        /// "6" "天牌"
        /// "6" "龙虎"
        /// "6" "大小"

        var gameTypeId = event.mainModel.typeId;
    });
      */

  }


}
