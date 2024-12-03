import 'package:flutter_main/controllers/global_controller.dart';
import 'package:flutter_main/models/common/handle_game_table_model.dart';
import 'package:flutter_main/models/ws/request/socket_bo.dart';
import 'package:flutter_main/models/road_model/road_home_table_model_manager.dart';
import 'package:flutter_main/models/ws/request/ws_105_bo.dart';
import 'package:flutter_main/models/ws/ws_10053_model.dart';
import 'package:flutter_main/net/socket/base/Enum.dart';
import 'package:flutter_main/net/socket/websocket_manager.dart';
import 'package:flutter_main/pages/play/play_room/index.dart';
import 'package:flutter_main/routers/routers.dart';
import 'package:flutter_main/utils/utils.dart';
import 'package:get/get.dart';

class PlayRouter extends BaseRouterAbstract {
  static const String playRoom = '/playRoom';

  @override
  void addRouters(List<GetPage> pages) {
    pages.addAll([
      GetPage(
        transition: Transition.fadeIn,
        name: playRoom,
        page: () => PlayRoomPage(),
        binding: PlayRoomBinding(),
      ),
    ]);
  }

  static int mCurrentTableId = 0;
  static int mGameTypeId = 0;

  /// 进入游戏内页
  static void pushPlayRoom({Ws10053TableModel? cellData}) {

    mCurrentTableId = cellData?.tableId ?? 0;
    mGameTypeId = cellData?.gameTypeId ?? 0;

    if (GameType.CLASSIC_BACCARAT.value != mGameTypeId) {
      ToastUtil.showToast("当前不是经典百家乐玩法！");
      return;
    }

    NavigatorUtil.push(PlayRouter.playRoom, arguments: cellData);

    RoadHomeTableModelManager().sendTable401WS(cellData!);
    RoadHomeTableModelManager().gameDetailModel = cellData;

    var socketBo10074 = SocketBo();
    socketBo10074.gameTypeIds = [mGameTypeId].toList();

    WebSocketManager.sendMessageSocket(
        socketType: SocketType.TABLE_BOOT_NUMBER_LIMIT,
        param: socketBo10074.toMap(),
        gameTypeId: mGameTypeId,
        tableId: mCurrentTableId,
        serviceType: 7);

    var socketBo10073 = SocketBo();
    socketBo10073.tableIds = [mCurrentTableId].toList();

    WebSocketManager.sendMessageSocket(
        socketType: SocketType.TABLE_BET_POINT_LIMIT,
        param: socketBo10073.toMap(),
        gameTypeId: mGameTypeId,
        tableId: mCurrentTableId,
        serviceType: 7);
  }

  static void sendWs168Bo() {

    WebSocketManager.sendMessageSocket(
        socketType: SocketType.LIVE_168,
        param: {},
        gameTypeId: mGameTypeId,
        tableId: mCurrentTableId,
        serviceType: 7);
  }
}
