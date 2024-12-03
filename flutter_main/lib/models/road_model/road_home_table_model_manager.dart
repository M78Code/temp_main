import 'package:flutter_main/controllers/global_controller.dart';
import 'package:flutter_main/models/ws/ws_10053_model.dart';
import 'package:flutter_main/net/socket/base/Enum.dart';
import 'package:flutter_main/net/socket/websocket_manager.dart';
import 'package:flutter_main/utils/app_util.dart';
import 'package:flutter_main/utils/event_bus_util.dart';

class RoadHomeTableModelManager {
  // 存储首页列表游戏桌的数据
  Map<String, dynamic> gameTables = {};
  List<String> keysTableIdList = [];
  List<Ws10053TableModel> tableDataList = [];

  // 存储点击进入游戏页的数据
  Ws10053TableModel gameDetailModel = Ws10053TableModel();

  // 单例模式
  static final RoadHomeTableModelManager _instance =
      RoadHomeTableModelManager._internal();

  factory RoadHomeTableModelManager() {
    return _instance;
  }

  RoadHomeTableModelManager._internal();

  // 设置每个cell的数据
  void setData(Map<String, dynamic> mainMap) {
    tableDataList.clear();
    keysTableIdList.clear();

    gameTables = mainMap;
    keysTableIdList = gameTables.keys.toList();
    // 遍历并解析数据
    for (var tableId in keysTableIdList) {
      Map<String, dynamic> dict = gameTables[tableId];
      var ws10053Model = Ws10053TableModel.fromJson(dict);
      tableDataList.add(ws10053Model);
    }

    // 触发事件，通知所有监听者
    EventBusRoadUtil.eventBus.fire(GameTableUpdatedEvent());
  }



  /// CELL点击 发送 401 快速入桌
  void sendTable401WS(Ws10053TableModel model) {
    var type = SocketType.NEW_INTER_GAME;
    Map<String, dynamic> processData = {
      "deviceId": AppUtil.deviceId,
      "deviceType":
          GlobalController.controller.mAppConfigModel.value.deviceType,
      "identity": 0,
      "playerId": GlobalController.controller.mAppConfigModel.value.playerId,
      "protocolId": type.value,
      // "reconnectFlag": true,
      // 进桌模式 字段待考虑
      // "seatId": GlobalController.controller.modeType.value,
      "tableId": model.tableId,
      // 包桌模式
      // "vipMode": 0,
    };

    WebSocketManager.sendMessage1Socket(
        socketType: type,
        param: processData,
        // 游戏类型 例（经典百家乐， 极速百家乐等）
        gameTypeId: model.gameTypeId,
        tableId: model.tableId);
    send30000WS(model);
  }

  void send30000WS(Ws10053TableModel model) async {
    Map<String, dynamic> processData = {
      "playerId": model.tableId,
      'protocolId': SocketType.LIVE_CHAT_INTER.value,
      'chatTableId': model.tableId,
    };
    WebSocketManager.sendMessageSocket(
        socketType: SocketType.LIVE_CHAT_INTER,
        param: processData,
        gameTypeId: model.gameTypeId,
        tableId: model.tableId,
        serviceType: 4);

    ///请求余额
    WebSocketManager.sendMessageSocket(
        socketType: SocketType.REFRESH_BALANCE,
        param: {},
        gameTypeId: model.gameTypeId,
        tableId: model.tableId,
        serviceType: 7);
  }
}


// 创建数据更新的事件  此类只做监听使用， 下发的列表数据都从单例拿
class GameTableUpdatedEvent {}
