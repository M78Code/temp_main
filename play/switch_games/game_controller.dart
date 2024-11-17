import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_main/net/socket/base/Enum.dart';
import 'package:flutter_main/pages/play/switch_games/switch_games_page.dart';
import 'package:get/get.dart';

import '../../../../generated/r.dart';
import '../../../controllers/global_controller.dart';
import '../../../models/event_model/websocket_event.dart';
import '../../../models/ws/ws_10053_model.dart';
import '../../../net/socket/websocket_manager.dart';
import '../../../utils/event_bus_util.dart';
import '../play_room/play_room_controller.dart';
import 'game_model.dart';
import 'page/game_road_page.dart';

class GameBaseController extends GetxController {
  GameBaseController({required this.tag});

  ///游戏类型
  String tag;
  RxInt seleteRow = 0.obs;

  GlobalController get globalController => GlobalController.controller;

  @override
  void onInit() {
    super.onInit();
  }
}

class GameController extends GameBaseController {
  GameController({required this.tag, required this.groupId}) : super(tag: tag);

  ///游戏类型
  String tag;

  int groupId;

  RxList<int> list = <int>[].obs;

  RxMap<int, Ws10053TableModel> gemaMap = <int, Ws10053TableModel>{}.obs;

  ///分类
  RxInt gamType = 1.obs;

  @override
  void onInit() {
    EventBusUtil.listen<GemaSocketEvent>((e) {
      if (e.protocolId == 10053) {
        if (groupId == 19 && (e.value is Map)) {
          //数据更新
          dataProcessing(e.value, isClean: false);
        }
      } else if (e.protocolId == 10021) {
        if (groupId == 19 && e.value is Map) {
          //原始数据
          dataProcessing(e.value, isClean: true);
        }
      } else if (e.protocolId == 10078) {
        if (groupId != 19 && (e.value is Map)) {
          dataProcessingAll(e.value, isClean: true);
        }
      } else if (e.protocolId == 10052) {
        if (groupId != 19 && (e.value is Map)) {
          dataProcessingAll(e.value, isClean: false);
        }
      }
    });
    super.onInit();
  }

  void dataProcessing(Map<String, dynamic> dict, {bool isClean = false}) {
    if (isClean) {
      gemaMap.clear();
    }
    dict.forEach((key, value) {
      Ws10053TableModel md = Ws10053TableModel.fromJson(value);
      int id = int.parse(key);
      if (md.tableOpen ?? true) {
        gemaMap.update(id, (v) => md, ifAbsent: () => md);
      } else {
        List<int> list = gemaMap.keys.toList();
        if (list.contains(id)) {
          gemaMap.removeWhere((k, v) {
            return k == id;
          });
        }
      }
    });

    onUpdateDataRoad();
  }

  void dataProcessingAll(Map<String, dynamic> dict, {bool isClean = false}) {
    if (isClean) {
      gemaMap.clear();
    }
    dict.forEach((key, value) {
      Ws10053TableModel md = Ws10053TableModel.fromJson(value);
      if (isOK(md)) {
        int id = int.parse(key);
        if (md.tableOpen ?? true) {
          gemaMap.update(id, (v) => md, ifAbsent: () => md);
        } else {
          List<int> list = gemaMap.keys.toList();
          if (list.contains(id)) {
            gemaMap.removeWhere((k, v) {
              return k == id;
            });
          }
        }
      }
    });

    onUpdateDataAll();
  }

  void onUpdateDataRoad() {
    List<int> arr = [];
    gemaMap.forEach((key, value) {
      if (isHost(value) && isRoadGame(value) && isRoadGood(value)) {
        arr.add(key);
      }
    });

    list.value = arr;
  }

  void onUpdateDataAll() {
    List<int> arr = [];
    gemaMap.forEach((key, value) {
      if (groupId == 27) {
        if (isHost(value) && isTag(value)) {
          arr.add(key);
        }
      } else if (groupId == 35) {
        if (isTag(value)) {
          arr.add(key);
        }
      }
    });

    list.value = arr;
  }

  bool isOK(Ws10053TableModel md) {
    switch (groupId) {
      case 27: //经典
        return [2001, 2002].contains(md.gameTypeId);

      case 29: //轮盘
        return [2007].contains(md.gameTypeId);
      case 31: //骰宝
        return [2008].contains(md.gameTypeId);
      case 35: //特色
        return [2003, 2004, 2005, 2014].contains(md.gameTypeId);
      case 39: //龙虎
        return [2006].contains(md.gameTypeId);
      default:
        return false;
    }
  }

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

  bool isTag(Ws10053TableModel md) {
    if (groupId == 27) {
      switch (gamType.value) {
        case 1:
          return true;
        case 2001:
          return md.gameTypeId == 2001;
        case 2002:
          return md.gameTypeId == 2002;
        default:
          return false;
      }
    } else if (groupId == 35) {
      switch (gamType.value) {
        case 1:
          return true;
        case 2003:
          return md.gameTypeId == 2003;
        case 2004:
          return md.gameTypeId == 2004;
        case 2005:
          return md.gameTypeId == 2005;
        case 2014:
          return md.gameTypeId == 2014;
        default:
          return false;
      }
    } else {
      return true;
    }
  }

  bool isRoadGame(Ws10053TableModel md) {
    return globalController.gameList.contains(md.gameTypeId);
  }

  bool isRoadGood(Ws10053TableModel md) {
    return globalController.roadList.contains(md.goodRoads);
  }

  onSendWSocket() {
    var _controller = PlayRoomController.controller;
    WebSocketManager.sendMessageSocket(
        socketType: SocketType.GAME_LIST_SWITCH_TAB,
        param: {
          "groupId": groupId,
          "isAll": 1,
        },
        serviceTypeId: ServiceTypeId.HALL,
        tableId: _controller.model.tableId,
        gameTypeId: _controller.model.gameTypeId);
    var gameLabelList = [1];
    if (groupId == 27) {
      gameLabelList = [2001, 2002];
    } else if (groupId == 30) {}
    var param = {
      "gameCasinoId": globalController.gameCasinoId.value,
      "groupId": groupId,
      "labelType": 2,
      "gameLabelList": gameLabelList,
      "sort": globalController.sort.value,
      "pageNum": 1,
      "pageSize": 200,
      "isAll": 0,
      "gameTypeIds": [],
    };
    WebSocketManager.sendMessageSocket(
        socketType: SocketType.GROUP_ROOM_MAPPER,
        param: param,
        serviceTypeId: ServiceTypeId.HALL,
        tableId: _controller.model.tableId,
        gameTypeId: _controller.model.gameTypeId);
  }
}

///首页
class GameHomeController extends GameBaseController {
  GameHomeController() : super(tag: 'home');

  final List<GamePageModel> gemaList = [
    GamePageModel(
      name: '全部设置',
      page: SwitchGamesPage(),
      iconDark: R.darkGemaAllSelete,
      iconLight: R.lightGemaAllSelete,
      unIconDark: R.darkGemaAllUnselete,
      unIconLight: R.lightGemaAllUnselete,
    ),
    GamePageModel(
      name: '好路',
      page: GemaRoadPage(),
      iconDark: R.darkGemaRoadSelete,
      iconLight: R.lightGemaRoadSelete,
      unIconDark: R.darkGemaRoadUnselete,
      unIconLight: R.lightGemaRoadUnselete,
    ),
  ];
  late PageController pageController;

  Timer? _timer;

  @override
  void onInit() {
    EventBusUtil.listen<GemaSocketEvent>((e) {
      if (e.protocolId == 10020) {}
    });

    _timer = Timer.periodic(Duration(seconds: 5), (Timer timer) {
      ///请求 10020
      onSend10020WS();
    });

    super.onInit();
  }

  void onSend10020WS() {
    var _controller = PlayRoomController.controller;
    WebSocketManager.sendMessageSocket(
        socketType: SocketType.BET,
        param: {},
        serviceTypeId: ServiceTypeId.HALL,
        tableId: _controller.model.tableId,
        gameTypeId: _controller.model.gameTypeId);
  }

  void onTagTabBar(int row) {
    seleteRow.value = row;
    pageController.jumpToPage(row);
    onSendWS(row);
  }

  void onSendWS(int row) {
    var _controller = PlayRoomController.controller;
    WebSocketManager.sendMessageSocket(
        socketType: SocketType.GAME_LIST_SWITCH_TAB,
        param: {
          "groupId": row == 0 ? 0 : 19,
          "isAll": 1,
        },
        serviceTypeId: ServiceTypeId.HALL,
        tableId: _controller.model.tableId,
        gameTypeId: _controller.model.gameTypeId);

    if (row == 0) {
      var param = {
        "gameCasinoId": globalController.gameCasinoId.value,
        "groupId": 27,
        "labelType": 2,
        "gameLabelList": [1],
        "sort": globalController.sort.value,
        "pageNum": 1,
        "pageSize": 200,
        "isAll": 0,
        "gameTypeIds": [],
      };
      WebSocketManager.sendMessageSocket(
          socketType: SocketType.GROUP_ROOM_MAPPER,
          param: param,
          serviceTypeId: ServiceTypeId.HALL,
          tableId: _controller.model.tableId,
          gameTypeId: _controller.model.gameTypeId);
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
