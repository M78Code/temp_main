import 'package:flutter/material.dart';
import 'package:flutter_main/dialogs/video_setting_dialog.dart';
import 'package:flutter_main/dialogs/voice_setting_dialog.dart';
import 'package:flutter_main/pages/play/gift/gift_send_widget.dart';
import 'package:flutter_main/pages/play/good_road_recommend/good_road_recommend_page.dart';
import 'package:flutter_main/pages/play/play_router.dart';
import 'package:flutter_main/utils/utils.dart';
import 'package:get/get.dart';
import '../../../controllers/global_controller.dart';
import '../../../net/socket/base/Enum.dart';
import '../../../net/socket/websocket_manager.dart';
import '../../../utils/base/base_container.dart';
import '../../home/home_router.dart';
import '../../userProfile/bettingRecords/betting_records_page.dart';
import '../../userProfile/user_profile_router.dart';
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
    // LogUtil.log("--OperationController--onReady-");
  }

  @override
  void onClose() {
    super.onClose();
  }

  void onTapClose() async {
    NavigatorUtil.back();
    PlayRouter.sendWs102Bo();

    PlayRouter.mGameTypeId = 0;
    PlayRouter.mCurrentTableId = 0;
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

  void onTapHelp() async {
    final appInfo = GlobalController.controller.mAppConfigModel.value;
    // 默认域名
    final h5DomainUrl = appInfo.h5DomainUrlList ?? '';
    final gameHelpUrl = "https://xsjj.$h5DomainUrl/#/gameHelp";
    // 语言环境
    final languageCode = Get.locale?.languageCode;

    final resultUrl =
        '$gameHelpUrl?id=${PlayRouter.mGameTypeId}&agentCode=${appInfo.agentId}&languageCode=$languageCode&currency=${appInfo.currency}&brandType=2&shenji=${appInfo.shenjiSitch}';
    NavigatorUtil.push(HomeRouter.webView, arguments: {
      'url': resultUrl,
    });
  }

  void onTapVoice() async {
    VoiceSettingDialog.show();
  }

  void onTapVideo() async {
    VideoSettingDialog.show();
  }

  void onTapInfo() async {
    NavigatorUtil.push(UserProfileRouter.UserProfile);
  }

  void onTapTable() async {}

  ///you游戏介绍
  void onTapGemaInfo() async {
    isGemaOpen.value = !isGemaOpen.value;
    GameInfoDrawerPage.push(context: Get.context!);
  }

  ///网页游戏介绍
  void onTapGemaWeb() async {
    isGemaOpen.value = !isGemaOpen.value;

    final appInfo = GlobalController.controller.mAppConfigModel.value;
    // 默认域名
    final h5DomainUrl = appInfo.h5DomainUrlList ?? '';
    final gameHelpUrl = "https://xsjj.$h5DomainUrl/#/gameHelp";
    // 语言环境
    final languageCode = Get.locale?.languageCode;

    final resultUrl =
        '$gameHelpUrl?id=${PlayRouter.mGameTypeId}&agentCode=${appInfo.agentId}&languageCode=$languageCode&currency=${appInfo.currency}&brandType=2&shenji=${appInfo.shenjiSitch}';
    NavigatorUtil.push(HomeRouter.webView, arguments: {
      'url': resultUrl,
    });
    // GameInfoDrawerPage.push(context: Get.context!);
  }

  ///游戏设置
  void onTapGemaSetting() async {
    isGemaOpen.value = !isGemaOpen.value;
    SwitchGamesHomePage.ShowCustomModalBottomSheet(Get.context!);
  }

  void onTapRoadMore() async {
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
        serviceTypeId: ServiceTypeId.CHAT);

    GiftSendWidget.ShowCustomModalBottomSheet(Get.context!);
  }
}
