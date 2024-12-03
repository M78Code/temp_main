import 'dart:convert';

import 'package:flutter_main/models/ws/ws_game_status_model.dart';
import 'package:flutter_main/utils/Commond/Data/GameEnum.dart';

class HandleGameStatusModel {
  static final HandleGameStatusModel _instance =
      HandleGameStatusModel._internal();

  factory HandleGameStatusModel() {
    return _instance;
  }

  HandleGameStatusModel._internal();

  int? protocolId;

  ///0--准备中， 1--洗牌中，2--下注中，3--开牌中，4--结算中，6--维护中，11-维护中
  int? gameStatus;
  int? tableId;
  int? roundId;
  int? goodRoads;
  int? serverTime;
  int? countdownEndTime;
  int? totalBetCountDown;
  int? bootIndex;
  int? casinoTime;
  List<PlayerInfos>? playerInfos;

  ///本局中奖的玩法
  List<int>? activePoints;
  BootReport? bootReport;
  String? roundResult;
  Map<String, dynamic>? winPoints;
  List<CurrentRoundExtInfos>? currentRoundExtInfos;

  ///玩法未出现的次数
  BetPointNotAppears? betPointNotAppears;
  String? roundNo;
  ///207 新增字段
  int? maintainStartTime;
  String? notice;
  int? noticeId;
  int? totalCountDown;

  handleGameStatusModel(WsGameStatusModel wsGameStatusModel) {
    var handleGameStatusModel = HandleGameStatusModel();
    if (wsGameStatusModel.protocolId != null) {
      handleGameStatusModel.protocolId = wsGameStatusModel.protocolId;
      handleGameStatusModel.gameStatus = convertGameStatus(wsGameStatusModel.protocolId!);
    }
    if (wsGameStatusModel.tableId != null) {
      handleGameStatusModel.tableId = wsGameStatusModel.tableId;
    }
    if (wsGameStatusModel.roundId != null) {
      handleGameStatusModel.roundId = wsGameStatusModel.roundId;
    }
    if (wsGameStatusModel.goodRoads != null) {
      handleGameStatusModel.goodRoads = wsGameStatusModel.goodRoads;
    }
    if (wsGameStatusModel.serverTime != null) {
      handleGameStatusModel.serverTime = wsGameStatusModel.serverTime;
    }
    if (wsGameStatusModel.countdownEndTime != null) {
      handleGameStatusModel.countdownEndTime = wsGameStatusModel.countdownEndTime;
    }
    if (wsGameStatusModel.totalBetCountDown != null) {
      handleGameStatusModel.totalBetCountDown = wsGameStatusModel.totalBetCountDown;
    }
    if (wsGameStatusModel.bootIndex != null) {
      handleGameStatusModel.bootIndex = wsGameStatusModel.bootIndex;
    }
    if (wsGameStatusModel.casinoTime != null) {
      handleGameStatusModel.casinoTime = wsGameStatusModel.casinoTime;
    }
    if (wsGameStatusModel.playerInfos != null) {
      handleGameStatusModel.playerInfos = wsGameStatusModel.playerInfos;
    }
    if (wsGameStatusModel.activePoints != null) {
      handleGameStatusModel.activePoints = wsGameStatusModel.activePoints;
    }
    if (wsGameStatusModel.bootReport != null) {
      handleGameStatusModel.bootReport = wsGameStatusModel.bootReport;
    }
    if (wsGameStatusModel.roundResult != null) {
      handleGameStatusModel.roundResult = wsGameStatusModel.roundResult;
    }
    if (wsGameStatusModel.winPoints != null) {
      handleGameStatusModel.winPoints = wsGameStatusModel.winPoints;
    }
    if (wsGameStatusModel.currentRoundExtInfos != null) {
      handleGameStatusModel.currentRoundExtInfos = wsGameStatusModel.currentRoundExtInfos;
    }
    if (wsGameStatusModel.betPointNotAppears != null) {
      handleGameStatusModel.betPointNotAppears = wsGameStatusModel.betPointNotAppears;
    }
    if (wsGameStatusModel.roundNo != null) {
      handleGameStatusModel.roundNo = wsGameStatusModel.roundNo;
    }
    if (wsGameStatusModel.maintainStartTime != null) {
      handleGameStatusModel.maintainStartTime = wsGameStatusModel.maintainStartTime;
    }
    if (wsGameStatusModel.notice != null) {
      handleGameStatusModel.notice = wsGameStatusModel.notice;
    }
    if (wsGameStatusModel.noticeId != null) {
      handleGameStatusModel.noticeId = wsGameStatusModel.noticeId;
    }
    if (wsGameStatusModel.totalCountDown != null) {
      handleGameStatusModel.totalCountDown = wsGameStatusModel.totalCountDown;
    }

    return handleGameStatusModel;
  }

  // 准备中
  //   READY(0),
  //   /// 洗牌中
  //   SHUFFLE(1),
  //   /// 下注中
  //   BET(2),
  //   /// 开牌中
  //   OPEN(3),
  //   /// 结算中
  //   COUNT(4),
  //   /// 维护中
  //   MAINTAIN(6);
  //1、监听服务器主动推送103（新一靴 ）：
  // 状态变化为--洗牌中
  //
  // 2、监听服务器主动推送104（新一局 ）：
  // 状态变化为--下注中并倒计时，
  // 倒计时结束时间：取104消息中的countdownEndTime字段
  // 倒计总时长：取104消息中的totalBetCountDown字段
  //
  // 3、监听服务器主动推送160（停止下注 ）：
  // 状态变化为--开牌中
  //
  // 4、监听服务器主动推送113（跳局）：
  // 状态变化为--结算中
  //
  // 5、监听服务器主动推送112（改牌 ）：
  // 状态变化为--结算中
  //
  // 6、监听服务器主动推送107（结算 ）：
  // 状态变化为--结算中
  //
  // 7、监听服务器主动推送207（到了维护时间点后，倒计时踢人通知）
  // 弹出弹窗
  int convertGameStatus(int protocolId) {
    int gameStatus = 0;
    if (103 == protocolId) {
      gameStatus = GameStatus.SHUFFLE.value;
    } else if (104 == protocolId) {
      gameStatus = GameStatus.BET.value;
    } else if (160 == protocolId) {
      gameStatus = GameStatus.OPEN.value;
    } else if (113 == protocolId) {
      gameStatus = GameStatus.COUNT.value;
    } else if (112 == protocolId) {
      gameStatus = GameStatus.COUNT.value;
    } else if (107 == protocolId) {
      gameStatus = GameStatus.COUNT.value;
    } else if (207 == protocolId) {
      gameStatus = GameStatus.MAINTAIN.value;
    }

    return gameStatus;
  }

  // 准备中
  //   READY(0),
  //   /// 洗牌中
  //   SHUFFLE(1),
  //   /// 下注中
  //   BET(2),
  //   /// 开牌中
  //   OPEN(3),
  //   /// 结算中
  //   COUNT(4),
  //   /// 维护中
  //   MAINTAIN(6);
  String convertGameStatusText(int gameStatus) {
    String showText = '';
    if (GameStatus.READY.value == gameStatus) {
      showText = '准备中';
    } else if (GameStatus.SHUFFLE.value == gameStatus) {
      showText = '洗牌中';
    } else if (GameStatus.BET.value == gameStatus) {
      showText = '下注中';
    }else if (GameStatus.OPEN.value == gameStatus) {
      showText = '开牌中';
    }else if (GameStatus.COUNT.value == gameStatus) {
      showText = '结算中';
    }else if (GameStatus.MAINTAIN.value == gameStatus) {
      showText = '维护中';
    }

    return showText;
  }

  toJsonWinPoints(String str) {
    Map<String, dynamic> winPointsMap = {};

    var winPoints = json.decode(str);
    winPoints.forEach((key, value) {
      print('Key: $key, Value: $value');
    });
    return winPointsMap;
  }
}
