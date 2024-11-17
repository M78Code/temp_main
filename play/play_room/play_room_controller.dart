import 'dart:async';
import 'dart:core';

import 'package:flutter_main/controllers/global_controller.dart';
import 'package:flutter_main/controllers/websocket_controller.dart';
import 'package:flutter_main/models/common/game_table_info_model.dart';
import 'package:flutter_main/models/ws/ws_10040_model.dart';
import 'package:flutter_main/models/ws/ws_10053_model.dart';
import 'package:flutter_main/models/ws/ws_10073_model.dart';
import 'package:flutter_main/models/ws/ws_10074_model.dart';
import 'package:flutter_main/models/ws/ws_105_model.dart';
import 'package:flutter_main/models/ws/ws_106_model.dart';
import 'package:flutter_main/models/ws/ws_107_model.dart';
import 'package:flutter_main/models/ws/ws_110_model.dart';
import 'package:flutter_main/models/ws/ws_113_model.dart';
import 'package:flutter_main/models/ws/ws_162_model.dart';
import 'package:flutter_main/models/ws/ws_171_model.dart';
import 'package:flutter_main/models/ws/ws_207_model.dart';
import 'package:flutter_main/models/ws/ws_271_model.dart';
import 'package:flutter_main/models/ws/ws_273_model.dart';
import 'package:flutter_main/models/ws/ws_401_model.dart' as ws_401_model;
import 'package:flutter_main/net/socket/base/Enum.dart';
import 'package:flutter_main/pages/play/bet_on/bet_on_controller.dart';
import 'package:flutter_main/pages/play/count_down/count_down_controller.dart';
import 'package:flutter_main/pages/play/operation/operation_controller.dart';
import 'package:flutter_main/pages/play/play_router.dart';
import 'package:flutter_main/utils/utils.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../../models/event_model/websocket_event.dart';
import '../../../models/ws/ws_30000_model.dart';
import '../../../models/ws/ws_30002_model.dart';
import '../../../models/ws/ws_30004_model.dart';
import '../../../models/ws/ws_50024_model.dart';
import '../../../net/socket/websocket_manager.dart';
import '../chat/chat_model.dart';
import '../chip_fly/chip_fly_controller.dart';
import '../table/table_controller.dart';

class PlayRoomController extends GetxController {
  static PlayRoomController get controller {
    return Get.find<PlayRoomController>();
  }

  late Ws10053TableModel model;
  ws_401_model.Ws401GameTableDetailModel? detailModel;
  Ws30000Model? s3000mode;

  Rx<Ws50024Model> s50024model = Ws50024Model().obs;
  RxList<Ws30002Model> messList = <Ws30002Model>[].obs;

  ///登陆主播或者荷官ID 0未登陆
  RxInt dealerLogin = 0.obs;

  //是否播放礼物
  RxBool isShowGift = false.obs;

  RxInt playerEnableChat = 7.obs;

  Rx<GameTableInfoModel> mGameTableInfoModel = GameTableInfoModel().obs;
  StreamSubscription<Map<int, GameTableInfoModel>>? listenGameTableMapObs;

  ///是否在视频区域显示
  RxBool isShowMass = true.obs;

  ///  局状态 1-洗牌中，2-下注中，3-开牌中，4-结算中，5-结算完成，6-跳局，7-取消局，8-重算局
  /// 判断如果当前牌桌的局状态RoundStatus（这个401回调中有该参数）
  // RxInt mRoundStatusObs = 0.obs;

  StreamSubscription<Map<int, Ws10073Model>>? listenWs10073Model;
  Ws10073Model? mWs10073Model;
  StreamSubscription<Map<int, Ws10074Model>>? listenWs10074Model;
  Ws10074Model? mWs10074Model;

  late StreamSubscription? listenWebSocketEvent;

  // Map<int,TableBetInfoList> = {};

  int get bettingMode {
    return GlobalController.controller.isQuikBet.value ? 1 : 2;
  }

  int get mGroupId {
    return PlayRouter.mGroupId;
  }

  /// 结算 游戏内页弹窗 显示 输赢金额
  /// 0  默认不显示
  RxDouble mBetResultAmountObs = 0.00.obs;

  /// 当前总共进行多少局（用于牌靴限制）
  int mBootTotalCount = 0;

  @override
  void onInit() {
    model = Get.arguments as Ws10053TableModel;

    listenWebSocketEvent = EventBusUtil.listen<WebSocketEvent>((e) {
      // LogUtil.log('${e.protocolId}------>:\t\n${e.value}');
      if (e.protocolId == 101) {
      } else if (e.protocolId == 114) {
        //荷官登陆
        //
      } else if (e.protocolId == 212) {
        Map<String, dynamic> dict = e.value as Map<String, dynamic>;
        int tableId = dict['tableId'];
        if ((detailModel?.tableId ?? model.tableId ?? 0) == tableId &&
            tableId != 0) {
          dealerLogin.value = dict['dealerLogin'];
        }
      } else if (e.protocolId == 401) {
        detailModel = e.value as ws_401_model.Ws401GameTableDetailModel?;

        var roundStatus = detailModel?.roundStatus ?? 0;
        var gameStatus = detailModel?.gameStatus ?? 0;

        // if (6 == mRoundStatusObs.value || 7 == mRoundStatusObs.value) {
        //   BetOnController.controller.tableBetPointDetailMapObs.clear();
        // } else {
        //   PlayRouter.sendWs168Bo();
        // }
        if (gameStatus == 4 && roundStatus == 6) {
          //解算处理
        }

        //判断当前是否为下注中、开牌中状态
        if (2 == gameStatus || 3 == gameStatus) {
          var tableBetInfoList = detailModel?.tableBetInfoList;
          if (tableBetInfoList != null && tableBetInfoList.isNotEmpty) {
            BetOnController.controller
                .updateTableBetInfoModelMapObs(tableBetInfoList);
          }
        }

        var roundNo = detailModel?.roundNo ?? '';
        var roundId = detailModel?.roundId ?? 0;
        BetOnController.controller.updateTableNoObs(roundId, roundNo);

        CountDownController.controller.updateGameStatusModel(401, e.value);
      } else if (e.protocolId == 30000) {
        s3000mode = e.value as Ws30000Model?;
      } else if (e.protocolId == 30002) {
        if (e.value is Ws30002Model) {
          messList.add(e.value);
        }
      } else if (e.protocolId == 30003) {
        if (e.value is Ws30002Model) {
          messList.add(e.value);
        }
      } else if (e.protocolId == 30004) {
        if (e.value is Ws30004Model) {
          if ((e.value as Ws30004Model).playerEnableChat == 7) {
            int item = playerEnableChat.value;
            playerEnableChat.value = 7;
            Future.delayed(const Duration(seconds: 3), () {
              playerEnableChat.value = item;
            });
          } else {
            playerEnableChat.value =
                (e.value as Ws30004Model).playerEnableChat ?? 7;
          }
        }
      } else if (e.protocolId == 50024) {
        //显示礼物动画

        s50024model.value = e.value as Ws50024Model;
        isShowGift.value = true;
      } else if (e.protocolId == 110 || 168 == e.protocolId) {
        //游戏内玩法下注人数和金额显示的逻辑
        var ws110model = e.value as Ws110Model;
        BetOnController.controller.updateTableBetPointDetailMapObs(ws110model);
      } else if (e.protocolId == 10040) {
        //返利数据
        var value = e.value as Ws10040Model;
        BetOnController.controller.updateProfitBetPointDTOSMapObs(value);
      } else if (e.protocolId == 271) {
        //取消投注结果返回
        var value = e.value as Ws271Model;
        BetOnController.controller.updateWs271Model(value);
      } else if (e.protocolId == 105) {
        //投注结果返回
        var value = e.value as Ws105Model;
        BetOnController.controller.updateWs105Model(value);
      } else if (e.protocolId == 162) {
        //投注结果返回
        var value = e.value as Ws162Model;
        BetOnController.controller.updateWs162Model(value);
      } else if (e.protocolId == 273) {
        //投注结果返回
        var value = e.value as Ws273Model;
        BetOnController.controller.updateWs273Model(value);
      } else if (e.protocolId == 104) {
        mBetResultAmountObs.value = 0;

        BetOnController.controller.updateGameStatusModel(104, e.value);
        CountDownController.controller.updateGameStatusModel(104, e.value);
        ChipFlyController.controller.updateGameStatusModel(104, e.value);
      } else if (e.protocolId == 106 || e.protocolId == 112) {
        //106-开牌;112-改牌
        var value = e.value as Ws106Model;
        //监听开牌，补牌数据
        BetOnController.controller.updateGameStatusModel(e.protocolId, e.value);
        CountDownController.controller
            .updateGameStatusModel(e.protocolId, e.value);
        ChipFlyController.controller
            .updateGameStatusModel(e.protocolId, e.value);
      } else if (e.protocolId == 171) {
        //补牌
        var value = e.value as Ws171Model;
      } else if (e.protocolId == 113) {
        //跳局
        var value = e.value as Ws113Model;

        BetOnController.controller.updateGameStatusModel(e.protocolId, e.value);
        CountDownController.controller
            .updateGameStatusModel(e.protocolId, e.value);
        ChipFlyController.controller
            .updateGameStatusModel(e.protocolId, e.value);
      } else if (e.protocolId == 103 ||
          e.protocolId == 160 ||
          e.protocolId == 207) {
        //103-新一靴;160-停止下注;207-踢出房间;
        var value = e.value as Ws207Model;
        if (207 == e.protocolId) {
          OperationController.controller.onTapClose();
          ToastUtil.showToast(value.notice ?? 'back');
          return;
        }

        BetOnController.controller.updateGameStatusModel(e.protocolId, e.value);
        CountDownController.controller
            .updateGameStatusModel(e.protocolId, e.value);
        ChipFlyController.controller
            .updateGameStatusModel(e.protocolId, e.value);
      } else if (e.protocolId == 107) {
        var ws107model = e.value as Ws107Model;

        /// 当前总共进行多少局（用于牌靴限制）
        mBootTotalCount = ws107model.bootReport?.totalCount ?? 0;

        /// 更新 输赢结果弹窗
        PlayerInfo? playerInfo = ws107model.playerInfos!.firstWhereOrNull(
            (value) =>
                value.playerId ==
                GlobalController.controller.mUserInfoModel.value.playerId);

        mBetResultAmountObs.value = playerInfo?.netAmount ?? 0;
        Future.delayed(const Duration(seconds: 3), () {
          mBetResultAmountObs.value = 0;
        });

        BetOnController.controller.updateGameStatusModel(107, e.value);
        CountDownController.controller.updateGameStatusModel(107, e.value);
        ChipFlyController.controller.updateGameStatusModel(107, e.value);
      }
    });

    listenGameTableMapObs =
        WebsocketController.controller.mGameTableMapObs.listen((onData) {
      // LogUtil.log("--PlayRoomController--listenGameTableMapObs-");
      var gameTableInfoModel = onData[PlayRouter.mCurrentTableId];

      if (gameTableInfoModel != null) {
        mGameTableInfoModel.value = gameTableInfoModel;

        var playerTableBetLimit = mGameTableInfoModel.value.playerTableBetLimit;
        if (playerTableBetLimit != null) {
          var bootLimit =
              '${playerTableBetLimit.min}-${playerTableBetLimit.max}';
          BetOnController.controller.updateTableBootLimit(bootLimit);
        }
      }
    });

    listenWs10073Model =
        WebsocketController.controller.mBetPointLimitMapObs.listen((onData) {
      // LogUtil.log("--PlayRoomController--listenWs10073Model- mWs10073Model=$mWs10073Model");
      var ws10073Model = onData[PlayRouter.mCurrentTableId];
      if (mWs10073Model == null ||
          (ws10073Model?.betPointLimitVersion ?? 0) >
              (mWs10073Model?.betPointLimitVersion ?? 0)) {
        mWs10073Model = ws10073Model;

        /// 赋值 限红数据 根据 betPointId
        if (mWs10074Model != null && mWs10074Model!.list!.isNotEmpty) {
          for (var ws10074Model in mWs10074Model!.list!) {
            for (var value in mWs10073Model!.betPointLimit!) {
              if (ws10074Model.groupId == value.groupId) {
                BetOnController.controller
                        .mTableBetPointLimitMapObs[ws10074Model.betPointId!] =
                    value;
              }
            }
          }
        } else {
          mWs10073Model = ws10073Model;

          /// 赋值 限红数据 根据 betPointId
          if (mWs10074Model != null && mWs10074Model!.list!.isNotEmpty) {
            for (var ws10074Model in mWs10074Model!.list!) {
              for (var value in mWs10073Model!.betPointLimit!) {
                if (ws10074Model.groupId == value.groupId) {
                  BetOnController.controller
                          .mTableBetPointLimitMapObs[ws10074Model.betPointId!] =
                      value;
                }
              }
            }
          }
        }
      }
    });

    listenWs10074Model =
        WebsocketController.controller.mBootNumberLimitMapObs.listen((onData) {
      // LogUtil.log("--PlayRoomController--listenWs10074Model-");
      var ws10074Model = onData[PlayRouter.mGameTypeId];
      if (mWs10074Model == null ||
          (ws10074Model?.bootNumberLimitListVersion ?? 0) >
              (mWs10074Model?.bootNumberLimitListVersion ?? 0)) {
        mWs10074Model = ws10074Model;

        for (var value in mWs10074Model!.list!) {
          BetOnController.controller
              .mTableBootNumberLimitMapObs[value.betPointId!] = value;
        }
      } else {
        if (null != ws10074Model) {
          mWs10074Model = ws10074Model;
          for (var value in mWs10074Model!.list!) {
            BetOnController.controller
                .mTableBootNumberLimitMapObs[value.betPointId!] = value;
          }
        }
      }
    });
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    // LogUtil.log("--PlayRoomController--onReady-===>${Get.arguments}");
    // LogUtil.log("--PlayRoomController--onReady-");
  }

  @override
  void onClose() {
    // LogUtil.log("--PlayRoomController--onClose-");

    listenWebSocketEvent?.cancel();
    listenGameTableMapObs?.cancel();
    listenWs10073Model?.cancel();
    listenWs10074Model?.cancel();
    super.onClose();
  }

  void onTapClose() async {
    // LogUtil.log("--PlayRoomController--onTapClose-");

    NavigatorUtil.back();
  }

  void onSendEmoji(String text) {
    var param = {
      "chatRoomNo": s3000mode?.chatRoomNo ?? '',
      "originContent": text,
      "chatContentType": 1,
    };
    WebSocketManager.sendMessageSocket(
        socketType: SocketType.LIVE_CHAT_SEND,
        param: param,
        gameTypeId: model.gameTypeId,
        tableId: model.tableId,
        serviceTypeId: ServiceTypeId.CHAT);

    ///todo:测试
    var json = {
      'originContent': text,
      'content': text,
    };
    var md = Ws30002Model.fromJson(json);

    EventBusUtil.fire(WebSocketEvent(30002, value: md));
  }

  void onSendText(String text) {
    var param = {
      "chatRoomNo": s3000mode?.chatRoomNo ?? '',
      "originContent": text,
      "chatContentType": 2,
    };
    WebSocketManager.sendMessageSocket(
        socketType: SocketType.LIVE_CHAT_SEND,
        param: param,
        gameTypeId: model.gameTypeId,
        tableId: model.tableId,
        serviceTypeId: ServiceTypeId.CHAT);

    ///todo:测试
    var json = {
      'originContent': text,
      'content': text,
    };
    var md = Ws30002Model.fromJson(json);

    EventBusUtil.fire(WebSocketEvent(30002, value: md));
  }

  void showMessToast() {
    PlayerEnableChatEnum type =
        PlayerEnableChatEnum.getChatTypeFromValue(playerEnableChat.value);
    String str = '';

    switch (type) {
      case PlayerEnableChatEnum.ENABLE:
        break;
      case PlayerEnableChatEnum.NOT_BET:
        str = '没有下注';
        break;
      case PlayerEnableChatEnum.IDENTITY_NOT_ALLOW:
        str = '身份不正确';
        break;
      case PlayerEnableChatEnum.MUTE:
        str = '禁言';
        break;
      case PlayerEnableChatEnum.PLAYER_DISABLE:
        str = '玩家被禁用';
        break;
      case PlayerEnableChatEnum.PLAYER_AGENT_DISABLE:
        str = '玩家商户不支持聊天';
        break;
      case PlayerEnableChatEnum.PLAYER_BETLIMIT_DISABLE:
        str = '流水限制不够不支持聊天';
        break;
      case PlayerEnableChatEnum.PLAYER_SENDFAST_DISABLE:
        str = '发言频繁请稍后再试';
        break;
    }
    Fluttertoast.showToast(msg: str);
  }

  updateRoundStatusObs(int roundStatus) {}

  ///更新桌台
  onUpdateTableStart(Ws10053TableModel md) {
    model = md;
    messList.clear();

    ///更新视频
    TableController.controller.getFlvUrl();
    update();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
