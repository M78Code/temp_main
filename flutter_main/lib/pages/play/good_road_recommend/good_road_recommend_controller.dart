import 'dart:async';
import 'dart:io';

import 'package:flutter_main/controllers/global_controller.dart';
import 'package:flutter_main/controllers/websocket_controller.dart';
import 'package:flutter_main/models/common/game_table_info_model.dart';
import 'package:flutter_main/net/socket/base/Enum.dart';
import 'package:flutter_main/net/socket/websocket_manager.dart';
import 'package:flutter_main/pages/play/chip_area/chip_area_controller.dart';
import 'package:flutter_main/pages/play/good_road_recommend/types.dart';
import 'package:flutter_main/utils/base/base_container.dart';
import 'package:flutter_main/utils/log_util.dart';
import 'package:get/get.dart';

class GoodRoadRecommendController extends GetxController {

  /// 下注
  void bettingWith({required GameTableInfoModel gameTableInfoModel, required OddsType oddsType}) {
    final chipAreaController = Get.find<ChipAreaController>();
    final parValue = chipAreaController.selectedChipModel?.parValue ?? 1;
    final websocketController = WebsocketController.controller;
    final playerId = GlobalController.controller.playerId;
    final tableId = gameTableInfoModel.tableId;
    final roundId = gameTableInfoModel.roundId;
    final balance = websocketController.mWs10000Model.value.data?.balance;
    final gameTypeId = gameTableInfoModel.gameTypeId;
    final params = {
      "playerId": playerId,
      "tableId": tableId,
      "roundId": roundId,
      "balance": balance,
      "betSource": 3,
      "bettingMode": 1,
      "betInfos": [
        {
          "betPointId": oddsType.betPointId,
          "betAmount": parValue
        }
      ]
    };

    WebSocketManager.sendMessageSocket(
      socketType: SocketType.GOOD_ROAD_BETTING,
      param: params,
      tableId: tableId,
      gameTypeId: gameTypeId
    );

  }

}