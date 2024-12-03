import 'package:flutter/material.dart';
import 'package:flutter_main/dialogs/video_setting_dialog.dart';
import 'package:flutter_main/dialogs/voice_setting_dialog.dart';
import 'package:flutter_main/pages/play/gift/gift_send_widget.dart';
import 'package:flutter_main/pages/play/good_road_recommend/good_road_recommend_page.dart';
import 'package:flutter_main/utils/utils.dart';
import 'package:get/get.dart';

import '../../../controllers/global_controller.dart';
import '../../../net/socket/base/Enum.dart';
import '../../../net/socket/websocket_manager.dart';
import '../../../utils/base/base_container.dart';
import '../../userProfile/bettingRecords/betting_records_page.dart';
import '../chat/chat_page.dart';
import '../gema/game_info_drawer_page.dart';
import '../play_room/play_room_controller.dart';
import '../switch_games/switch_game_home_page.dart';

class OperationController extends GetxController {
  static OperationController get controller {
    return Get.find<OperationController>();
  }

  late PlayRoomController roomController = PlayRoomController.controller;

  RxBool isAmountShow = true.obs;
  RxBool isShowMore = false.obs;
  RxBool isOpenEye = true.obs;

  ///控制游戏切换
  RxBool isGemaOpen = false.obs;

  @override
  void onReady() {
    super.onReady();
    LogUtil.log("--OperationController--onReady-");
  }

  @override
  void onClose() {
    super.onClose();
  }

  void onTapClose() async {
    NavigatorUtil.back();
  }

  void onTapOpenEye() async {
    isOpenEye.value = !isOpenEye.value;
  }

  void onTapPushBettingRecords() {
    showModalBottomSheet(
        context: Get.context!,
        builder: (BuildContext context) {
          return HYContainer(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            padding: const EdgeInsets.only(top: 15),
            child: SafeArea(
              child: BettingRecordsPage(),
            ),
          );
        });
  }

  void onTapAmount() async {}

  void onTapMessage() async {
    ChatPage.ShowCustomModalBottomSheet(Get.context!);
  }

  void onTapVillage() async {}

  void onTapMore() async {
    // CountDownController.controller.startTimer();
    isShowMore.value = !isShowMore.value;
  }

  void onTapHelp() async {}

  void onTapVoice() async {
    VoiceSettingDialog.show();
  }

  void onTapVideo() async {
    VideoSettingDialog.show();
  }

  void onTapInfo() async {}

  void onTapTable() async {}

  ///you游戏介绍
  void onTapGemaInfo() async {
    isGemaOpen.value = !isGemaOpen.value;
    GameInfoDrawerPage.push(context: Get.context!);
  }

  ///网页游戏介绍
  void onTapGemaWeb() async {
    isGemaOpen.value = !isGemaOpen.value;
    // GameInfoDrawerPage.push(context: Get.context!);
  }

  ///游戏设置
  void onTapGemaSetting() async {
    isGemaOpen.value = !isGemaOpen.value;
    SwitchGamesHomePage.ShowCustomModalBottomSheet(Get.context!);
  }

  void onTapRoadMore() async {
    // isGemaOpen.value = !isGemaOpen.value;
    GoodRoadRecommendPage.show();
  }

  void onTapGift() async {
    PlayRoomController _controller = PlayRoomController.controller;
    var processData = {
      "currency": "CNY",
      "tableId": _controller.detailModel?.tableId ?? '',
      "playerId": GlobalController.controller.mAppConfigModel.value.playerId,
      'protocolId': SocketType.LIVE_GIFT_LIST_REQUEST.value
    };

    await WebSocketManager.sendMessageSocket(
        socketType: SocketType.LIVE_GIFT_LIST_REQUEST,
        param: processData,
        gameTypeId: _controller.model.gameTypeId,
        tableId: _controller.model.tableId,
        serviceType: 4);

    GiftSendWidget.ShowCustomModalBottomSheet(Get.context!);
  }
}
