import 'dart:convert';

import 'package:flutter_main/api/api_service_stream.dart';
import 'package:flutter_main/controllers/global_controller.dart';
import 'package:flutter_main/models/common/game_table_info_model.dart';
import 'package:flutter_main/models/event_model/websocket_event.dart';
import 'package:flutter_main/models/flv_stream/stream_init_rep.dart';
import 'package:flutter_main/models/flv_stream/stream_strategy_rep.dart';
import 'package:flutter_main/models/flv_stream/stream_token_rep.dart';
import 'package:flutter_main/models/road_model/road_home_table_model_manager.dart';
import 'package:flutter_main/models/ws/base_websocket_model.dart';
import 'package:flutter_main/models/ws/request/socket_bo.dart';
import 'package:flutter_main/models/ws/ws_10000_model.dart';
import 'package:flutter_main/models/ws/ws_10011_model.dart';
import 'package:flutter_main/models/ws/ws_10037_model.dart';
import 'package:flutter_main/models/ws/ws_10040_model.dart';
import 'package:flutter_main/models/ws/ws_10053_model.dart';
import 'package:flutter_main/models/ws/ws_10073_model.dart';
import 'package:flutter_main/models/ws/ws_10074_model.dart';
import 'package:flutter_main/models/ws/ws_10082_model.dart';
import 'package:flutter_main/models/ws/ws_102_model.dart';
import 'package:flutter_main/models/ws/ws_104_model.dart';
import 'package:flutter_main/models/ws/ws_105_model.dart';
import 'package:flutter_main/models/ws/ws_106_model.dart';
import 'package:flutter_main/models/ws/ws_107_model.dart';
import 'package:flutter_main/models/ws/ws_110_model.dart';
import 'package:flutter_main/models/ws/ws_113_model.dart';
import 'package:flutter_main/models/ws/ws_114_model.dart';
import 'package:flutter_main/models/ws/ws_116_model.dart';
import 'package:flutter_main/models/ws/ws_117_model.dart';
import 'package:flutter_main/models/ws/ws_118_model.dart';
import 'package:flutter_main/models/ws/ws_121_model.dart';
import 'package:flutter_main/models/ws/ws_162_model.dart';
import 'package:flutter_main/models/ws/ws_171_model.dart';
import 'package:flutter_main/models/ws/ws_207_model.dart';
import 'package:flutter_main/models/ws/ws_271_model.dart';
import 'package:flutter_main/models/ws/ws_273_model.dart';
import 'package:flutter_main/models/ws/ws_401_model.dart';
import 'package:flutter_main/models/ws/ws_50024_model.dart';
import 'package:flutter_main/models/ws/ws_game_status_model.dart';
import 'package:flutter_main/net/socket/base/Enum.dart';
import 'package:flutter_main/net/socket/websocket_help.dart';
import 'package:flutter_main/net/socket/websocket_manager.dart';
import 'package:flutter_main/pages/home/home_router.dart';
import 'package:flutter_main/pages/login/router.dart';
import 'package:flutter_main/pages/play/play_router.dart';
import 'package:flutter_main/utils/utils.dart';
import 'package:get/get.dart';

import '../models/ws/ws_30000_model.dart';
import '../models/ws/ws_30002_model.dart';
import '../models/ws/ws_30004_model.dart';
import '../utils/string_util.dart';

/// WebSocket 相关业务处理
class WebsocketController extends GetxController {
  static const String TAG = "--WebsocketController--";

  static WebsocketController get controller => Get.find<WebsocketController>();

  GlobalController get globalController => GlobalController.controller;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Rx<Ws10000Model> mWs10000Model = Ws10000Model().obs;

  RxString mNoticeContent = ''.obs;

  /// 项目缓存的最新桌台集合 map
  /// key 为牌桌 id  tableId
  RxMap<int, GameTableInfoModel> mGameTableMapObs =
      RxMap<int, GameTableInfoModel>({});

  /// 限红下限
  /// 项目缓存的最新桌台集合 map-BetPointLimit 数据
  /// key 为牌桌 id  tableId
  RxMap<int, Ws10073Model> mBetPointLimitMapObs = RxMap<int, Ws10073Model>({});

  /// 牌靴限制
  /// 项目缓存的最新桌台集合 map-BootNumberLimit 数据
  /// key 为牌桌 gameTypeId
  RxMap<int, Ws10074Model> mBootNumberLimitMapObs =
      RxMap<int, Ws10074Model>({});

  ///好路筛选过滤后的数据
  RxList<int> roadList = <int>[].obs;

  ///好路全部数据
  RxMap<int, Ws10053TableModel> roadMap = <int, Ws10053TableModel>{}.obs;

  ///全部数据
  RxMap<int, Ws10053TableModel> gemaAllMap = <int, Ws10053TableModel>{}.obs;

  /// ws10074Model.betPointId 和 ws10073Model.groupId 映射关系
  // Map<int, int> mGroupToBetPointMap = {};

  /// 游戏内 状态监听
  Rx<WsGameStatusModel> mWsGameStatusModelObs = WsGameStatusModel().obs;

  void updateNoticeContent(Ws10011Model ws10011Model) {
    var noticeList = ws10011Model.data?.noticeList?.toList();

    var noticeContent = noticeList?.first.content ?? '欢迎进入游戏，祝多多盈利！';

    if (mNoticeContent.value == noticeContent) return;

    mNoticeContent.value = noticeContent;
  }

  late StreamInitReturnData streamInitReturnData;
  late StrategyLineDto strategyLineDto;

  initStream() async {
    var s = await ApiServiceStream.requestInit(
        ticket: mWs10000Model.value.data?.ticket ?? "",
        userId: mWs10000Model.value.data?.playerId ?? 0);
    final bean = StreamInitRep.fromJson(json.decode(s.data));
    //LogUtil.log("========>${s.data}");
    final sessionId = bean.returnData?.sessionId ?? '';
    streamInitReturnData = bean.returnData ?? StreamInitReturnData();
    streamStrategy(sessionId: sessionId);
  }

  void updateGameTableMapObs(Map<String, dynamic> map) {
    map.forEach((key, value) {
      var gameTableInfoModel = GameTableInfoModel.fromJson(value);
      var tableId = gameTableInfoModel.tableId ?? 0;

      if (0 == tableId) return;

      mGameTableMapObs.update(tableId, (value) {
        return ((gameTableInfoModel.tableInfoVersion ?? 0) >
                (value.tableInfoVersion ?? 0))
            ? gameTableInfoModel
            : value;
      }, ifAbsent: () {
        return gameTableInfoModel;
      });

      var betPointLimitList = gameTableInfoModel.betPointLimit ?? [];

      if (betPointLimitList.isNotEmpty) {
        var ws10073model = Ws10073Model(
            tableId: tableId,
            betPointLimitVersion: gameTableInfoModel.betPointLimitVersion ?? 0,
            betPointLimit: betPointLimitList);

        /// 顺便更新 BetPointLimit
        mBetPointLimitMapObs.update(tableId, (value) {
          return ((gameTableInfoModel.betPointLimitVersion ?? 0) >
                  (value.betPointLimitVersion ?? 0))
              ? ws10073model
              : value;
        }, ifAbsent: () {
          return ws10073model;
        });
      }
    });
  }

  void updateBetPointLimitMapObs(Map<String, dynamic> map) {
    map.forEach((key, value) {
      var ws10073model = Ws10073Model.fromJson(value);
      var tableId = ws10073model.tableId ?? 0;

      if (0 == tableId) return;

      mBetPointLimitMapObs.update(tableId, (value) {
        return ((ws10073model.betPointLimitVersion ?? 0) >
                (value.betPointLimitVersion ?? 0))
            ? ws10073model
            : value;
      }, ifAbsent: () {
        return ws10073model;
      });
    });
  }

  void updateBootNumberLimitMapObs(Map<String, dynamic> map) {
    map.forEach((key, value) {
      var ws10074model = Ws10074Model.fromJson(value);
      var gameTypeId = ws10074model.gameTypeId ?? 0;

      if (0 == gameTypeId) true;

      mBootNumberLimitMapObs.update(gameTypeId, (value) {
        return ((ws10074model.bootNumberLimitListVersion ?? 0) >
                (value.bootNumberLimitListVersion ?? 0))
            ? ws10074model
            : value;
      }, ifAbsent: () {
        return ws10074model;
      });
    });
  }

  /// 下发了 401 的数据
  void updateNoticeGameTableInfoFrom401Data(
      Ws401GameTableDetailModel gameModel) {
    /// eventBus 发送消息 401
    EventBusRoadUtil.eventBus.fire(Ws401GameTableDetailModelEvent(gameModel));
  }

  dynamic getDataWS(String jsonData, List<String> keys) {
    Map<String, dynamic>? dict = jsonDecode(jsonData);

    dynamic value;
    for (String key in keys) {
      if (dict != null) {
        if (dict[key] is String) {
          String str = dict[key] as String;
          var data = jsonDecode(str);
          if (data is Map<String, dynamic>) {
            dict = data;
          }
          if (key == keys.last) {
            value = data;
          }
        } else {
          var data = dict[key];
          if (data is Map<String, dynamic>) {
            dict = data;
          }
          if (key == keys.last) {
            value = data;
          }
        }
      } else {
        return;
      }
    }

    return value;
  }

  streamStrategy({required String sessionId}) async {
    var s = await ApiServiceStream.requestStrategy(
        sessionId: sessionId, channel: '0', sharpess: 5);
    final bean = StreamStrategyRep.fromJson(json.decode(s.data));
    List<StrategyDto> strategyDtos = bean.returnData?.strategyDtos ?? [];

    ///筛选出thirdpartyCode=3001，即flv类型的视频源
    List result = strategyDtos
        .expand((a) => a.strategyLineDtos ?? []) // 展开所有A中的bList
        .where((b) => b.thirdpartyCode == '3001')
        .toList();
    if (result.isNotEmpty) {
      strategyLineDto = result[0];
    }
  }

  Future<String> getToken({required String channel}) async {
    var s = await ApiServiceStream.requestToken(
        sessionId: streamInitReturnData.sessionId ?? '',
        domain: strategyLineDto.domain?[0].host ?? '',
        uid: mWs10000Model.value.data?.playerId ?? 0,
        channel: channel,
        sharpess: strategyLineDto.sharpness ?? 3);
    // LogUtil.log("========>${s.data}");
    final bean = StreamTokenRep.fromJson(json.decode(s.data));
    // LogUtil.log("========>${bean.returnData?.url ?? ''}");
    return bean.returnData?.url ?? '';
  }

  ////////////////////////////////WS-协议数据处理///////////////////////////////////////////////
  /// 初始化 并 启动 WebSocket
  Future<void> initWS() async {
    var wsUrl = await WebSocketManager().initWebSocketUrl();

    if (wsUrl.isEmpty) return;

    WebSocketManager().initWebSocket(openCallback: () {
      // LogUtil.log("$TAG openCallback-");
    }, errorCallback: (e) {
      LogUtil.log("$TAG errorCallback-e=$e");
    }, messageCallback: (data) {
      // LogUtil.log("$TAG messageCallback-");
      WebSocketHelp.decryptWsData(data).then((value) {
        if (value.isEmpty) {
          return;
        }
        var baseWebsocketModel = baseWebsocketModelFromJson(value);
        var protocolId = baseWebsocketModel.protocolId!;
        // LogUtil.log("${TAG}messageCallback-protocolId=$protocolId");
       // LogUtil.log('-ws-body-protocolId=$protocolId');

        var jsonData = baseWebsocketModel.jsonData;
        // LogUtil.log('${TAG}messageCallback-jsonData=$jsonData');

        switch (protocolId) {
          case 10000:
            handleWs10000(protocolId, jsonData);
            break;
          case 10011:
            handleWs10011(protocolId, jsonData);
            break;
          case 10053:
            handleWs10053(protocolId, jsonData);
            break;
          case 10052:
            var data = getDataWS(jsonData, ['data', 'gameTableMap']);
            dataAllProcessing(data);
            handleGemaSetting(protocolId, data);
            break;
          case 401:
            handleWs401(protocolId, jsonData);
            break;
          case 116:
            handleWs116(protocolId, jsonData);
            break;
          case 114:
            var data = getDataWS(jsonData, ['data']);
            Ws114Model model = Ws114Model.fromJson(data);
            EventBusUtil.fire(WebSocketEvent(protocolId!, value: model));
            break;
          case 212: //不显示荷官打赏按钮通知
            var data = getDataWS(jsonData, ['data']);
            EventBusUtil.fire(WebSocketEvent(protocolId!, value: data));
            break;
          case 10002: //玩家账户余额
            handleWs10002(protocolId, jsonData);
            break;
          case 10037: //查询余额
            handleWs10037(protocolId, jsonData);
            break;
          case 30000:
            var data = getDataWS(jsonData, ['data']);
            Ws30000Model model = Ws30000Model.fromJson(data);
            EventBusUtil.fire(WebSocketEvent(protocolId!, value: model));
            break;
          case 30002:
            var data = getDataWS(jsonData, ['data']);
            Ws30002Model model = Ws30002Model.fromJson(data);
            EventBusUtil.fire(WebSocketEvent(protocolId!, value: model));
            break;
          case 30003:
            var data = getDataWS(jsonData, ['data']);
            Ws30002Model model = Ws30002Model.fromJson(data);
            EventBusUtil.fire(WebSocketEvent(protocolId!, value: model));
            break;
          case 30004:
            var data = getDataWS(jsonData, ['data']);
            Ws30004Model model = Ws30004Model.fromJson(data);
            EventBusUtil.fire(WebSocketEvent(protocolId!, value: model));
            break;
          case 50023: //美女主播礼物列表
            var list = getDataWS(jsonData, ['data']);
            EventBusUtil.fire(WebSocketEvent(protocolId!, value: list));
            break;
          case 50024: //荷官、打赏桌边主播打赏，主播送礼
            var list = getDataWS(jsonData, ['data']);
            Ws50024Model model = Ws50024Model.fromJson(list);
            EventBusUtil.fire(WebSocketEvent(protocolId!, value: model));
            break;
          case 50023:
            handleWs50023(protocolId, jsonData);
            break;
          case 10020:
            var map = getDataWS(jsonData, ['data']);
            EventBusUtil.fire(WebSocketEvent(protocolId, value: map));
            break;
          case 10021:
            handleWs10021(protocolId, jsonData);
            break;
          case 10073:
            handleWs10073(protocolId, jsonData);
            break;
          case 10074:
            handleWs10074(protocolId, jsonData);
            break;
          case 10078:
            handleWs10078(protocolId, jsonData);
            break;
          case 10082:
            handleWs10082(protocolId, jsonData);
            break;
          case 10084:
            handleWs10084(protocolId, jsonData);
            break;
          case 10092:
            handleWs10092(protocolId, jsonData);
            break;
          case 104://104新一局
            handleWs104(protocolId, jsonData);
            break;
          case 106://开牌
          case 112://改牌
            handleWs106(protocolId, jsonData);
            break;
          case 171://补牌
            handleWs171(protocolId, jsonData);
            break;
          case 107://结算
            handleWs107(protocolId, jsonData);
            break;
          case 113://跳局
            handleWs113(protocolId, jsonData);
            break;
          case 207://踢出房间
          case 103://新一靴
          case 160://停止下注
            handleWs207(protocolId, jsonData);
            break;
          case 10040:
            handleWs10040(protocolId, jsonData);
            break;
          case 110: //游戏内玩法下注人数和金额显示的逻辑
          case 168:
            handleWs110(protocolId, jsonData);
            break;
          case 271:
            handleWs271(protocolId, jsonData);
            break;
          case 105:
            handleWs105(protocolId, jsonData);
            break;
          case 162: //其他玩家下注
            handleWs162(protocolId, jsonData);
            break;
          case 273: //其他玩家取消下注
            handleWs273(protocolId, jsonData);
            break;
          case 102: //退出牌桌
            handleWs102(protocolId, jsonData);
            break;
          case 117: //117流程-停止下注-共咪+竞咪+包桌
            handleWs117(protocolId, jsonData);
            break;
          case 118: //118流程-第一轮咪牌通知[共咪+竞咪+包桌]
          case 119: //119流程-第二轮咪牌通知[共咪+竞咪+包桌]
          case 120: //120流程-第三轮咪牌通知[共咪+竞咪+包桌]
            handleWs118(protocolId, jsonData);
            break;
          case 121: //121流程-咪牌开牌[共咪+竞咪+包桌]
            handleWs121(protocolId, jsonData);
            break;
          default:
            // LogUtil.log("${TAG}messageCallback-default-protocolId=$protocolId");
            EventBusUtil.fire(WebSocketEvent(protocolId, value: jsonData));
            break;
        }
      });
    });
  }

  void handleWs10092(int protocolId, String jsonData) {
    // LogUtil.log("handleWs10092 ${jsonData}");
  }

  void handleWs10000(int protocolId, String jsonData) {
    if (Get.currentRoute == LoginRouter.login) {
      Loading.hideNetLoading();
      NavigatorUtil.offAllToNamed(HomeRouter.home);
    }

    var ws10000modelFromJson = ws10000ModelFromJson(jsonData);

    mWs10000Model.value = ws10000modelFromJson;
    mWs10000Model.refresh();



    // 1深  2浅
    var roadPaperColour = ws10000modelFromJson.data?.roadPaperColour ?? 1;
    // 路纸 模式更新
    if (100 == GlobalController.controller.lzBgMode.value) {
      GlobalController.controller.luzhiSet(roadPaperColour == 1 ? 1 : 0);
    }
    // 快速换桌
    final isQuickCutTable = ws10000modelFromJson.data?.isQuickCutTable ?? 0;
    GlobalController.controller
        .quikChangeTable(isQuickCutTable == 1 ? true : false);

    var balance = mWs10000Model.value.data?.balance ?? 0.00;
    GlobalController.controller.mUserInfoModel.value.balance = balance;
    GlobalController.controller.mUserInfoModel.value.currencyCode = mWs10000Model.value.data?.currency;



    // 登录成功  默认初始化 好路 标签数据
    WebSocketHelp.switchTab();

    // var data2 = ws10000modelFromJson.data;
    //
    // var balance = data2?.balance;
    //
    // LogUtil.log("${TAG}messageCallback-ws10000modelFromJson-balance$balance");
  }

  void handleWs10011(int protocolId, String jsonData) {
    var ws10011modelFromJson = ws10011ModelFromJson(jsonData);
    updateNoticeContent(ws10011modelFromJson);
  }

  void handleWs10053(int protocolId, String jsonData) {
    // 使用 jsonDecode 将 JSON 字符串转换为 Map
    Map<String, dynamic> userMap = jsonDecode(jsonData);
    String dataJsonStr = userMap['data'];

    Map<String, dynamic> dataMap = jsonDecode(dataJsonStr);
    Map<String, dynamic> gameMap = dataMap['gameTableMap'];

    if (dataMap.containsKey('serverTime')) {
      int? serverTime = dataMap['serverTime'];
      if (serverTime != null) {
        GlobalController.controller.mServerTime = serverTime;
      }
    }

    if (dataMap.containsKey('bootNumberLimitMap')) {
      Map<String, dynamic> bootNumberLimitMap = dataMap['bootNumberLimitMap'];
      updateBootNumberLimitMapObs(bootNumberLimitMap);
    }

    // updateNoticeGameTableFrom10053Data(gameMap);
    dataProcessing(gameMap);
    // updateGameTableMapObs(gameMap);
  }

  /// 快速入桌  此处是在首页列表主动请求下发的数据
  void handleWs401(int protocolId, String jsonData) {
    Map<String, dynamic> userMap = jsonDecode(jsonData);
    String jsonStr = userMap['data'];
    Map<String, dynamic> gameTableMap = jsonDecode(jsonStr);
    Map<String, dynamic> gameTableInfo = gameTableMap['gameTableInfo'];

    var model = Ws401GameTableDetailModel.fromJson(gameTableInfo);

    updateNoticeGameTableInfoFrom401Data(model);

    // HandleGameStatusModel().protocolId = 401;
    // HandleGameStatusModel().gameStatus = model.gameStatus;
    // HandleGameStatusModel().countdownEndTime = model.countdownEndTime;
    // HandleGameStatusModel().totalBetCountDown = model.totalBetCountDown;
    // HandleGameStatusModel().serverTime = model.serverTime;
    //
    // mHandleGameStatusModelObs.value = HandleGameStatusModel();

    // HandleGameTableModel().updateGameTableMap(gameTableInfo, isClear: false);
    var serverTime = model.serverTime ?? 0;
    if (0 != serverTime) {
      GlobalController.controller.mServerTime = model.serverTime;
    }
    EventBusUtil.fire(WebSocketEvent(protocolId!, value: model));
  }

  /// 入桌后路子图的下发数据
  void handleWs116(int protocolId, String jsonData) {
    // print("ws下发了116的数据Json");
    // print("ws下发的116json数据为 ${jsonData}");
    Map<String, dynamic> roadMap = jsonDecode(jsonData);
    String jsonStr = roadMap['data'];
    Map<String, dynamic> gameTableRoadMap = jsonDecode(jsonStr);

    var model = Ws116RoadGameTableDetailModel.fromJson(gameTableRoadMap);

    EventBusRoadUtil.eventBus.fire(Ws116RoadGameTableDetailModelEvent(model));

    // print("ws下发的116json数据桌号为 ${model.tableId}");
  }

  void handleWs50023(int protocolId, String jsonData) {
    var list = getDataWS(jsonData, ['data']);
    EventBusUtil.fire(WebSocketEvent(protocolId, value: list));
  }

  void handleWs10021(int protocolId, String jsonData) {
    Map<String, dynamic> userMap = jsonDecode(jsonData);
    String dataJsonStr = userMap['data'];

    Map<String, dynamic> dataMap = jsonDecode(dataJsonStr);

    if (dataMap.containsKey('bootNumberLimitMap')) {
      Map<String, dynamic> bootNumberLimitMap = dataMap['bootNumberLimitMap'];

      updateBootNumberLimitMapObs(bootNumberLimitMap);
    }

    Map<String, dynamic> gameMap = dataMap['gameTableMap'];
    handleGemaSetting(protocolId, gameMap);
    dataProcessing(gameMap, isClean: true);
    // updateGameTableMapObs(gameMap);
  }

  /// 通过 betPointLimitVersion 更新玩法限红数据
  void handleWs10073(int protocolId, jsonData) {
    Map<String, dynamic> userMap = jsonDecode(jsonData);

    String dataJsonStr = userMap['data'];
    Map<String, dynamic> dataMap = jsonDecode(dataJsonStr);

    Map<String, dynamic> tableBetLimitMap = dataMap['tableBetLimitMap'];

    updateBetPointLimitMapObs(tableBetLimitMap);
  }

  /// 通过比较 bootNumberLimitListVersion 动态更新 全局 mBootNumberLimitMap 玩法限制数据
  void handleWs10074(int protocolId, jsonData) {
    Map<String, dynamic> userMap = jsonDecode(jsonData);

    String dataJsonStr = userMap['data'];
    Map<String, dynamic> dataMap = jsonDecode(dataJsonStr);

    Map<String, dynamic> bootNumberLimitMap = dataMap['bootNumberLimitMap'];

    updateBootNumberLimitMapObs(bootNumberLimitMap);
  }

  void handleWs10082(int protocolId, jsonData) {
    Map<String, dynamic> userMap = jsonDecode(jsonData);
    String dataJsonStr = userMap['data'];

    var ws10082model = ws10082ModelFromJson(dataJsonStr);

    var tableIdList = ws10082model.tableId ?? [];

    if (tableIdList.isEmpty) {
      return;
    }

    var socketBo10084 = SocketBo();
    socketBo10084.tableIdList = tableIdList;

    WebSocketManager.sendMessageSocket(
        socketType: SocketType.TABLE_BET_POINT_LIMIT,
        param: socketBo10084.toMap(),
        gameTypeId: PlayRouter.mGameTypeId,
        tableId: PlayRouter.mCurrentTableId,
        serviceTypeId: ServiceTypeId.HALL);
  }

  void handleWs10084(int protocolId, jsonData) {
    Map<String, dynamic> userMap = jsonDecode(jsonData);
    String dataJsonStr = userMap['data'];

    Map<String, dynamic> dataMap = jsonDecode(dataJsonStr);

    if (dataMap.containsKey('bootNumberLimitMap')) {
      Map<String, dynamic> bootNumberLimitMap = dataMap['bootNumberLimitMap'];
      updateBootNumberLimitMapObs(bootNumberLimitMap);
    }

    Map<String, dynamic> gameMap = dataMap['gameTableMap'];
    updateGameTableMapObs(gameMap);
  }

  void handleWs10078(int protocolId, jsonData) {
    Map<String, dynamic> userMap = jsonDecode(jsonData);
    String dataJsonStr = userMap['data'];

    Map<String, dynamic> dataMap = jsonDecode(dataJsonStr);

    if (dataMap.containsKey('bootNumberLimitMap')) {
      Map<String, dynamic> bootNumberLimitMap = dataMap['bootNumberLimitMap'];
      updateBootNumberLimitMapObs(bootNumberLimitMap);
    }

    Map<String, dynamic> gameMap = dataMap['gameTableMap'];
    handleGemaSetting(10078, gameMap);
    dataAllProcessing(gameMap, isClean: true);
    updateGameTableMapObs(gameMap);
  }

  void handleWsGameStatus(int protocolId, jsonData) {
    Map<String, dynamic> userMap = jsonDecode(jsonData);
    String dataJsonStr = userMap['data'];

    Map<String, dynamic> dataMap = jsonDecode(dataJsonStr);

    var wsGameStatusModel = WsGameStatusModel.fromJson(dataMap);
    wsGameStatusModel.protocolId = protocolId;
    // var handleGameStatusModel =
    //     HandleGameStatusModel().handleGameStatusModel(wsGameStatusModel);

    var serverTime = wsGameStatusModel.serverTime ?? 0;
    if (0 != serverTime) {
      GlobalController.controller.mServerTime = wsGameStatusModel.serverTime;
    }

    mWsGameStatusModelObs.value = wsGameStatusModel;

    // EventBusUtil.fire(WebSocketEvent(protocolId, value: handleGameStatusModel));
    // EventBusUtil.fireModel(handleGameStatusModel);
  }

  void handleWs10040(int protocolId, jsonData) {
    Map<String, dynamic> userMap = jsonDecode(jsonData);
    String dataJsonStr = userMap['data'];

    Map<String, dynamic> dataMap = jsonDecode(dataJsonStr);

    var ws10040model = Ws10040Model.fromJson(dataMap);

    int? serverTime = ws10040model.activityList?.first.serverTime;
    if (serverTime != null) {
      GlobalController.controller.mServerTime = serverTime;
    }
    EventBusUtil.fire(WebSocketEvent(protocolId, value: ws10040model));
  }

  void handleWs110(int protocolId, jsonData) {
    Map<String, dynamic> userMap = jsonDecode(jsonData);
    String dataJsonStr = userMap['data'];

    Map<String, dynamic> dataMap = jsonDecode(dataJsonStr);

    var ws110model = Ws110Model.fromJson(dataMap);

    EventBusUtil.fire(WebSocketEvent(protocolId, value: ws110model));
  }

  void handleWs10037(int protocolId, jsonData) {
    var data = getDataWS(jsonData, ['data']);
    Ws10037Model model = Ws10037Model.fromJson(data);

    GlobalController.controller.mUserInfoModel.value.balance = model.balance;
    GlobalController.controller.mUserInfoModel.value.currencyCode = model.currencyCode;
  }

  void handleWs271(int protocolId, jsonData) {
    Map<String, dynamic> userMap = jsonDecode(jsonData);

    String dataJsonStr = userMap['data'];
    Map<String, dynamic> dataMap = jsonDecode(dataJsonStr);

    var ws271model = Ws271Model.fromJson(dataMap);
    EventBusUtil.fire(WebSocketEvent(protocolId, value: ws271model));
  }

  void handleWs105(int protocolId, jsonData) {
    // LogUtil.log("handleWs105　original --- $jsonData");
    Map<String, dynamic> userMap = jsonDecode(jsonData);

    String dataJsonStr = userMap['data'];//在结算时这个数据是List类型，
    if(StringUtil.isObject(dataJsonStr)){
      Map<String, dynamic> dataMap = jsonDecode(dataJsonStr);
      var ws105model = Ws105Model.fromJson(dataMap);
      EventBusUtil.fire(WebSocketEvent(protocolId, value: ws105model));
    }
    // Map<String, dynamic> dataMap = jsonDecode(dataJsonStr);
    // LogUtil.log("handleWs105　error --- $dataMap");
    // var ws105model = Ws105Model.fromJson(dataMap);
    // EventBusUtil.fire(WebSocketEvent(protocolId, value: ws105model));
  }

  void handleGemaSetting(int protocolId, value) {
    if (GlobalController.controller.isOpenGameSetting) {
      EventBusUtil.fire(GemaSocketEvent(protocolId: protocolId, value: value));
    }
  }

  void handleWs162(int protocolId, jsonData) {
    Map<String, dynamic> userMap = jsonDecode(jsonData);

    String dataJsonStr = userMap['data'];
    Map<String, dynamic> dataMap = jsonDecode(dataJsonStr);

    var ws162model = Ws162Model.fromJson(dataMap);
    EventBusUtil.fire(WebSocketEvent(protocolId, value: ws162model));
  }

  void handleWs273(int protocolId, jsonData) {
    Map<String, dynamic> userMap = jsonDecode(jsonData);

    String dataJsonStr = userMap['data'];
    Map<String, dynamic> dataMap = jsonDecode(dataJsonStr);

    var ws273model = Ws273Model.fromJson(dataMap);
    EventBusUtil.fire(WebSocketEvent(protocolId, value: ws273model));
  }

  ///------------------------------------------
  ///好路数据处理
  void dataProcessing(Map<String, dynamic> dict, {bool isClean = false}) {
    if (isClean) {
      roadMap.clear();
    }
    dict.forEach((key, value) {
      Ws10053TableModel md = Ws10053TableModel.fromJson(value);
      int id = int.parse(key);
      roadMap.update(id, (v) => md, ifAbsent: () => md);
    });

    onUpdateDataRoad();
  }

  ///好路数据处理
  void dataAllProcessing(Map<String, dynamic> dict, {bool isClean = false}) {
    // 目前不清楚
    // if (isClean) {
    //   roadMap.clear();
    // }
    dict.forEach((key, value) {
      Ws10053TableModel md = Ws10053TableModel.fromJson(value);
      int id = int.parse(key);
      gemaAllMap.update(id, (v) => md, ifAbsent: () => md);
    });
    /// 发送给首页游戏
    EventBusRoadUtil.eventBus.fire(GameAllListUpdatedEvent());

  }

  ///筛选好路数据
  void onUpdateDataRoad() {
    List<int> arr = [];
    roadMap.forEach((key, value) {
      if ((value.tableOpen ?? true) && isRoadGame(value) && isRoadGood(value)) {
        arr.add(key);
      }
    });
    roadList.value = arr;

    /// 发送通知给好路列表 10021和10053 处理后发送都是这个
    EventBusRoadUtil.eventBus.fire(GameTableListUpdatedEvent());
  }

  ///筛选游戏类型全部数据
  // void onUpdateDataRoad() {
  //   List<int> arr = [];
  //   roadMap.forEach((key, value) {
  //     if ((value.tableOpen ?? true) && isRoadGame(value) && isRoadGood(value)) {
  //       arr.add(key);
  //     }
  //   });
  //   roadList.value = arr;
  //
  //   /// 发送通知给好路列表 10021和10053 处理后发送都是这个
  //   EventBusRoadUtil.eventBus.fire(GameTableListUpdatedEvent());
  // }


  ///大厅数据筛选
  bool isHost(Ws10053TableModel md) {
    switch (globalController.gameCasinoId.value) {
      case 0:
        return true;
      case 1:
        return md.gameCasinoId == 1;
      case 3:
        return md.gameCasinoId == 3;
      case 5:
        return md.gameCasinoId == 5;
      default:
        return false;
    }
  }

  ///好路设置
  bool isRoadGame(Ws10053TableModel md) {
    return globalController.gameList.length == 0 ||
        globalController.gameList.contains(md.gameTypeId);
  }

  ///好路游戏
  bool isRoadGood(Ws10053TableModel md) {
    return globalController.roadList.length == 0 ||
        globalController.roadList.contains(md.goodRoads);
  }

  void handleWs102(int protocolId, jsonData) {
    Map<String, dynamic> userMap = jsonDecode(jsonData);

    String dataJsonStr = userMap['data'];
    Map<String, dynamic> dataMap = jsonDecode(dataJsonStr);

    var ws102model = Ws102Model.fromJson(dataMap);
  }

  void handleWs10002(int protocolId, jsonData) {
    var data = getDataWS(jsonData, ['data']);
    Ws10037Model model = Ws10037Model.fromJson(data);

    GlobalController.controller.mUserInfoModel.value.balance = model.balance;
    GlobalController.controller.mUserInfoModel.value.currencyCode = model.currencyCode;
    EventBusUtil.fire(WebSocketEvent(protocolId, value: model));
  }

  void handleWs104(int protocolId, jsonData) {
    Map<String, dynamic> userMap = jsonDecode(jsonData);
    String dataJsonStr = userMap['data'];

    Map<String, dynamic> dataMap = jsonDecode(dataJsonStr);

    var ws104model = Ws104Model.fromJson(dataMap);

    EventBusUtil.fire(WebSocketEvent(protocolId, value: ws104model));
  }

  void handleWs107(int protocolId, jsonData) {
    Map<String, dynamic> userMap = jsonDecode(jsonData);
    String dataJsonStr = userMap['data'];

    Map<String, dynamic> dataMap = jsonDecode(dataJsonStr);

    var ws107model = Ws107Model.fromJson(dataMap);

    EventBusUtil.fire(WebSocketEvent(protocolId, value: ws107model));
  }

  void handleWs106(int protocolId, jsonData) {
    Map<String, dynamic> userMap = jsonDecode(jsonData);
    String dataJsonStr = userMap['data'];

    Map<String, dynamic> dataMap = jsonDecode(dataJsonStr);

    var ws106model = Ws106Model.fromJson(dataMap);

    EventBusUtil.fire(WebSocketEvent(protocolId, value: ws106model));
  }

  void handleWs171(int protocolId, jsonData) {
    Map<String, dynamic> userMap = jsonDecode(jsonData);
    String dataJsonStr = userMap['data'];

    Map<String, dynamic> dataMap = jsonDecode(dataJsonStr);

    var ws171model = Ws171Model.fromJson(dataMap);

    EventBusUtil.fire(WebSocketEvent(protocolId, value: ws171model));
  }

  void handleWs113(int protocolId, jsonData) {
    Map<String, dynamic> userMap = jsonDecode(jsonData);
    String dataJsonStr = userMap['data'];

    Map<String, dynamic> dataMap = jsonDecode(dataJsonStr);

    var ws113model = Ws113Model.fromJson(dataMap);

    EventBusUtil.fire(WebSocketEvent(protocolId, value: ws113model));
  }

  void handleWs207(int protocolId, jsonData) {
    Map<String, dynamic> userMap = jsonDecode(jsonData);
    String dataJsonStr = userMap['data'];

    Map<String, dynamic> dataMap = jsonDecode(dataJsonStr);

    var ws207model = Ws207Model.fromJson(dataMap);

    EventBusUtil.fire(WebSocketEvent(protocolId, value: ws207model));
  }

  void handleWs117(int protocolId, jsonData) {
    Map<String, dynamic> userMap = jsonDecode(jsonData);
    String dataJsonStr = userMap['data'];

    Map<String, dynamic> dataMap = jsonDecode(dataJsonStr);

    var ws117model = Ws117Model.fromJson(dataMap);

    EventBusUtil.fire(WebSocketEvent(protocolId, value: ws117model));
  }

  void handleWs118(int protocolId, jsonData) {
    Map<String, dynamic> userMap = jsonDecode(jsonData);
    String dataJsonStr = userMap['data'];

    Map<String, dynamic> dataMap = jsonDecode(dataJsonStr);

    var ws118model = Ws118Model.fromJson(dataMap);

    EventBusUtil.fire(WebSocketEvent(protocolId, value: ws118model));
  }

  void handleWs121(int protocolId, jsonData) {
    Map<String, dynamic> userMap = jsonDecode(jsonData);
    String dataJsonStr = userMap['data'];

    Map<String, dynamic> dataMap = jsonDecode(dataJsonStr);

    var ws121model = Ws121Model.fromJson(dataMap);

    EventBusUtil.fire(WebSocketEvent(protocolId, value: ws121model));
  }
}
