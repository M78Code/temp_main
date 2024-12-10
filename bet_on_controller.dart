import 'dart:async';

import 'package:flutter/animation.dart';
import 'package:flutter_main/controllers/global_controller.dart';
import 'package:flutter_main/models/chip_model.dart';
import 'package:flutter_main/models/common/table_bet_info_model.dart';
import 'package:flutter_main/models/common/table_bet_point_detail.dart';
import 'package:flutter_main/models/road_model/road_home_table_model_manager.dart';
import 'package:flutter_main/models/ws/request/ws_105_bo.dart';
import 'package:flutter_main/models/ws/request/ws_271_bo.dart';
import 'package:flutter_main/models/ws/ws_10040_model.dart';
import 'package:flutter_main/models/ws/ws_104_model.dart';
import 'package:flutter_main/models/ws/ws_105_model.dart';
import 'package:flutter_main/models/ws/ws_106_model.dart';
import 'package:flutter_main/models/ws/ws_107_model.dart';
import 'package:flutter_main/models/ws/ws_110_model.dart';
import 'package:flutter_main/models/ws/ws_116_model.dart';
import 'package:flutter_main/models/ws/ws_162_model.dart';
import 'package:flutter_main/models/ws/ws_171_model.dart';
import 'package:flutter_main/models/ws/ws_271_model.dart';
import 'package:flutter_main/models/ws/ws_273_model.dart' as ws_273_model;
import 'package:flutter_main/models/ws/ws_401_model.dart' as ws_401_model;
import 'package:flutter_main/models/ws/ws_401_model.dart';
import 'package:flutter_main/net/socket/base/Enum.dart';
import 'package:flutter_main/net/socket/websocket_manager.dart';
import 'package:flutter_main/pages/play/chip_area/chip_area_controller.dart';
import 'package:flutter_main/pages/play/chip_fly/chip_fly_controller.dart';
import 'package:flutter_main/pages/play/gameplay_des/gameplay_des_dialog.dart';
import 'package:flutter_main/pages/play/gema/game_info_drawer_page.dart';
import 'package:flutter_main/pages/play/play_room/index.dart';
import 'package:flutter_main/pages/play/play_router.dart';
import 'package:flutter_main/pages/play/poker/open_poker_controller.dart';
import 'package:flutter_main/pages/play/widgets/play_adapter.dart';
import 'package:flutter_main/utils/Commond/Data/GameEnum.dart';
import 'package:flutter_main/utils/RoadPaper/Data/RoadPaperEnum.dart';
import 'package:flutter_main/utils/RoadPaper/Tool/RoadPaperUIDataTool_Baccarat.dart';
import 'package:flutter_main/utils/utils.dart';
import 'package:get/get.dart';

import '../../../models/pair_triple.dart';
import '../../../models/ws/ws_117_model.dart';
import '../../../utils/my_queue.dart';
import '../play_room/base_room_controller.dart';

class BetOnController extends BaseRoomController
    with GetSingleTickerProviderStateMixin {
  /// 是否开牌
  late AnimationController _animationController;
  late Animation<Offset> slideAnimation; //平移动画
  late Animation<double> fadeAnimation; //渐变动画
  /// 每次下注记录下 下注信息
  /// 保存当前操作的 下注信息
  /// 队列保存 方便存取删除
  var betMyQueue = MyQueue<List<BetInfosBo>>();

  /// 结算更新 当前赢 的玩法
  // RxMap<int, num> mWinPointsMapObs = RxMap<int, num>({});

  Ws107Model? mWs107Model;

  Timer? _timer;
  int currentTime = 0;

  /// 开始高亮显示  赢的玩法
  void startHighLightTimer() {
    cancelHighLightTimer();

    var winPoints = mWs107Model?.winPoints;

    if (winPoints == null) {
      return;
    }

    Map<int, num> tempWinPointsMap = {};

    for (var value in winPoints.keys) {
      tempWinPointsMap[int.parse(value)] = winPoints[value];
    }

    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(oneSec, (Timer timer) {
      currentTime++;
      // LogUtil.log("--BetOnController--startTimer-currentTime=$currentTime");
      if (currentTime % 2 == 0) {
        mWinPointsMapObs.value = tempWinPointsMap;
      } else {
        mWinPointsMapObs.clear();
      }

      if (mWinPointsMapObs
          .containsKey(BaccaratBetPointGroupType.PLAYER.value)) {
        //闲赢
        EventBusUtil.fire(Pair(0, BaccaratBetPointGroupType.PLAYER.value));
      } else if ((mWinPointsMapObs
          .containsKey(BaccaratBetPointGroupType.TIE.value))) {
        // EventBusUtil.fire(Pair(1, BaccaratBetPointGroupType.TIE.value));
      } else if ((mWinPointsMapObs
          .containsKey(BaccaratBetPointGroupType.BANKER.value))) {
        EventBusUtil.fire(Pair(2, BaccaratBetPointGroupType.BANKER.value));
      } else {
        // LogUtil.log("------没有结果-------");
      }
    });
  }

  void cancelHighLightTimer() {
    _timer?.cancel();
    mWinPointsMapObs.clear();
  }

  static BetOnController get controller {
    return Get.find<BetOnController>();
  }

  @override
  void onInit() {
    // 访问 Ws10000Model 的值
    currentWs10000Model = wsGlobalController.mWs10000Model.value;

    super.onInit();

    /// 初始化路子的数据
    initRoadData();

    /// 监听路子数据的下发 116
    EventBusRoadUtil.eventBus
        .on<Ws116RoadGameTableDetailModelEvent>()
        .listen((event) {
      // print("116的数据监听到");
      var model = event.mainModel;
      ws116Model.value = model;
    });
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    slideAnimation = Tween<Offset>(
      begin: const Offset(0, 2), //初始位置（底部）
      end: Offset.zero, //最终位置（正常位置）
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
    fadeAnimation = Tween<double>(
      begin: 0.0, //完全透明
      end: 1.0, //完全不透明
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  void openPokerAnimation(isOpen) {
    if (isOpen) {
      _animationController.forward(); //向上显示
    } else {
      _animationController.reset(); //向下隐藏
    }
    update(["openPoker"]);
  }

  @override
  void onReady() {
    super.onReady();
    // LogUtil.log("--BetOnController--onReady-");
    ///监听投注总额数据
    EventBusRoadUtil.eventBus.on<Pair>().listen((event) {
      if (event.first == "TotalBet") {
        confirmBetAmount.value = event.second;
        // LogUtil.log("--BetOnController--onReady---TotalBet---${event.second}");
      }
    });
  }

  @override
  void onClose() {
    _animationController.dispose();
    cancelHighLightTimer();
    super.onClose();
  }

  void updateConfirmBetAmount(int amount) {
    if (0 == amount) {
      confirmBetAmount.value = 0;
    } else {
      confirmBetAmount.value += amount;
    }
  }

  ///you游戏介绍
  void onTapGemaInfo() async {
    GameInfoDrawerPage.push(context: Get.context!);
  }

  /// 点击每个小玩法 回调
  void onTapBetOn(int betPointId) async {
    LogUtil.log("--BetOnController--onTapBetOn-${betPointId}");
    if (BaccaratBetPointGroupType.SUPER_TIE.value == betPointId) {
      onTapSuperTie();
      return;
    }
    var parValue =
        ChipAreaController.controller.selectedChipModel?.parValue ?? 0;

    if (0 == parValue) {
      ToastUtil.showToast('请选择砝码');
      return;
    }

    var betOn = isBetOn(betPointId, parValue);

    if (!betOn) {
      LogUtil.log("--BetOnController--onTapBetOn-下注失败");
      return;
    }

    if (1 == PlayRoomController.controller.bettingMode) {
      var betInfos = BetInfosBo();
      betInfos.betPointId = betPointId;
      betInfos.betIndex = AppUtil.currentTimeMillis;
      betInfos.betAmount = parValue;

      /// todo 记得飞法码
      betInfosListCurrent.add(betInfos);
      isRepeatObs.value = false;

      sendWs105Bo();
    } else {
      final existingIndex = betInfosListCurrent
          .indexWhere((value) => value.betPointId == betPointId);

      if (existingIndex != -1) {
        // 更新现有信息
        var betInfosCurrent = betInfosListCurrent[existingIndex];
        var betAmountCurrent = betInfosCurrent.betAmount ?? 0;
        betAmountCurrent = betAmountCurrent + parValue;
        betInfosCurrent.betIndex = AppUtil.currentTimeMillis;
      } else {
        var betInfos = BetInfosBo();
        betInfos.betPointId = betPointId;
        betInfos.betIndex = AppUtil.currentTimeMillis;
        betInfos.betAmount = parValue;

        betInfosListCurrent.add(betInfos);
        isRepeatObs.value = false;
      }

      updateConfirmBetAmount(parValue);

      /// todo 普通下注  手动 飞 法码
      _onChipFly(
          betAmount: parValue,
          betPointId: betPointId,
          playerId: GlobalController.controller.playerId);
    }
  }

  /// 点击每个小玩法 右上角  帮助按钮 回调
  void onTapBetHelp(int betPointId) async {
    LogUtil.log("--BetOnController--onTapBetHelp-");
    GamePlayDesDialog.show(betPointId: betPointId);
  }

  /// 点击超超和玩法
  void onTapSuperTie() async {
    LogUtil.log("--BetOnController--onTapSuperTie-");
    isSuperTieOpenObs.value = !isSuperTieOpenObs.value;
  }

  void onTapSuperTieClose() async {
    LogUtil.log("--BetOnController--onTapSuperTieClose-");
    isSuperTieOpenObs.value = !isSuperTieOpenObs.value;
  }

  void onTapSuperTieAllIn() async {
    LogUtil.log("--BetOnController--onTapSuperTieAllIn-");

    var parValue =
        ChipAreaController.controller.selectedChipModel?.parValue ?? 0;

    if (0 == parValue) {
      ToastUtil.showToast('请选择砝码');
      return;
    }

    var superTieList = PlayAdapter.getSuperTieList();

    for (var betPointId in superTieList) {
      var betOn = isBetOn(betPointId, parValue);

      if (!betOn) {
        LogUtil.log("--BetOnController--onTapBetOn-下注失败");
        return;
      }

      if (1 == PlayRoomController.controller.bettingMode) {
        var betInfos = BetInfosBo();
        betInfos.betPointId = betPointId;
        betInfos.betIndex = AppUtil.currentTimeMillis;
        betInfos.betAmount = parValue;

        /// todo 记得飞法码
        betInfosListCurrent.add(betInfos);
        isRepeatObs.value = false;
      } else {
        final existingIndex = betInfosListCurrent
            .indexWhere((value) => value.betPointId == betPointId);

        if (existingIndex != -1) {
          // 更新现有信息
          var betInfosCurrent = betInfosListCurrent[existingIndex];
          var betAmountCurrent = betInfosCurrent.betAmount ?? 0;
          betAmountCurrent = betAmountCurrent + parValue;
          betInfosCurrent.betIndex = AppUtil.currentTimeMillis;
        } else {
          var betInfos = BetInfosBo();
          betInfos.betPointId = betPointId;
          betInfos.betIndex = AppUtil.currentTimeMillis;
          betInfos.betAmount = parValue;

          betInfosListCurrent.add(betInfos);
          isRepeatObs.value = false;
        }

        updateConfirmBetAmount(parValue);

        /// todo 普通下注  手动 飞 法码
        _onChipFly(
            betAmount: parValue,
            betPointId: betPointId,
            playerId: GlobalController.controller.playerId);
      }
    }

    if (1 == PlayRoomController.controller.bettingMode) {
      sendWs105Bo();
    }
  }

  /// 点击 取消 回调
  void onTapCancel() async {
    LogUtil.log("--BetOnController--onTapCancel-");
    if (104 != mGameProtocolId) {
      ToastUtil.showToast('非下注不能操作！');
      return;
    }
    if (1 == PlayRoomController.controller.bettingMode) {
      //如果是快速投注-直接发送取消-同步服务端
      var dequeue = betMyQueue.dequeue();
      if (dequeue != null) {
        List<int> betPointIdList = [];
        for (var value in dequeue) {
          betPointIdList.add(value.betPointId!);
        }
        sendWs271Bo(betPointIdList);
      }
    } else {
      //如果不是快速投注-等确认取消-等确认去同步服务端
      //只能取消未下注的；已经确定下注的取消不了
      betInfosListCurrent.clear();

      // 只要当前没有下注法码 显示重复按钮
      isRepeatObs.value = true;

      updateConfirmBetAmount(0);

      //todo 法码取消动画
      ChipFlyController.controller.allChipClearDataAndAnimation();
    }
  }

  /// 点击重复 X2 回调
  void onTapRepeat() async {
    LogUtil.log("--BetOnController--onTapRepeat-");

    if (isRepeatObs.value) {
      //重复
      // 上次有投注记录  复用
      if (betInfosListLast.isNotEmpty) {
        outerLoop:
        for (var value in betInfosListLast) {
          var betInfos = BetInfosBo();
          betInfos.betPointId = value.betPointId;
          betInfos.betIndex = AppUtil.currentTimeMillis;
          betInfos.betAmount = value.betAmount;

          var betOn = isBetOn(betInfos.betPointId!, betInfos.betAmount!);

          if (!betOn) {
            break outerLoop;
          }

          /// todo 记得飞法码
          betInfosListCurrent.add(betInfos);
          isRepeatObs.value = false;
        }
        if (1 == PlayRoomController.controller.bettingMode) {
          sendWs105Bo();
        } else {
          for (var value in betInfosListCurrent) {
            updateConfirmBetAmount(value.betAmount!);
          }
        }
      }
    } else {
      //X2

      if (1 == PlayRoomController.controller.bettingMode) {
        outerLoop:
        for (var value in betInfosListLast) {
          var betInfos = BetInfosBo();
          betInfos.betPointId = value.betPointId;
          betInfos.betIndex = AppUtil.currentTimeMillis;
          betInfos.betAmount = value.betAmount;

          var betOn = isBetOn(betInfos.betPointId!, betInfos.betAmount!);

          if (!betOn) {
            break outerLoop;
          }

          /// todo 记得飞法码
          betInfosListCurrent.add(betInfos);
        }

        sendWs105Bo();
      } else {
        outerLoop:
        for (var value in betInfosListCurrent) {
          value.betIndex = AppUtil.currentTimeMillis;

          /// 显示确认金额
          updateConfirmBetAmount(value.betAmount!);

          value.betAmount = (value.betAmount ?? 0 * 2);

          var betOn = isBetOn(value.betPointId!, value.betAmount!);

          if (!betOn) {
            break outerLoop;
          }

          /// todo 记得飞法码
        }
      }
    }
  }

  /// 点击确定按钮 回调
  void onTapConfirm() async {
    LogUtil.log("--BetOnController--onTapConfirm-");
    if (104 != mGameProtocolId) {
      ToastUtil.showToast('非下注不能操作！');
      return;
    }

    sendWs105Bo();
  }

  _onChipFly({
    required int betAmount,
    required int betPointId,
    int? playerId,
    Offset? offset,
  }) {
    final chip = ChipAreaController.controller.selectedChipModel ?? ChipModel();
    ChipFlyController.controller.onChipFly(
        betAmount: betAmount,
        betPointId: betPointId,
        playerId: playerId,
        offset: offset);
  }

  updateGameStatusModel(int protocolId, dynamic model) {
    mGameProtocolId = protocolId;
    switch (protocolId) {
      case 401:
        var ws401gameTableDetailModel = model as Ws401GameTableDetailModel;
        var gameStatus = ws401gameTableDetailModel.gameStatus ?? 0;

        if (GameStatus.BET.value == gameStatus) {
          mGameProtocolId = 104;
        }

        var roundNo = ws401gameTableDetailModel.roundNo ?? '';
        var roundId = ws401gameTableDetailModel.roundId ?? 0;
        updateTableNoObs(roundId, roundNo);

        //判断当前是否为下注中、开牌中状态
        if (2 == gameStatus || 3 == gameStatus) {
          var tableBetInfoList = ws401gameTableDetailModel.tableBetInfoList;
          if (tableBetInfoList != null && tableBetInfoList.isNotEmpty) {
            updateTableBetInfoModelMapObs(tableBetInfoList);
          }
        }
        break;
      case 106: //开牌
        // isOpenPoker.value = true;
        openPokerAnimation(true);
        var ws106model = model as Ws106Model;
        OpenPokerController.controller.updateOpenPokerInfos(ws106model);
        break;
      case 104: //监听服务器主动推送104（新一局 ）-下注中并倒计时
        // isOpenPoker.value = false;
        openPokerAnimation(false);
        OpenPokerController.controller.clearPokerInfo();
        var ws104model = model as Ws104Model;
        var roundId = ws104model.roundId ?? 0;
        var roundNo = ws104model.roundNo ?? '';
        updateTableNoObs(roundId, roundNo);

        tableBetPointDetailMapObs.clear();

        ToastUtil.showCenterToast("开始下注");
        betOnBottomTotalAmount = 0;
        tableBetPointDetailMapObs.clear();

        cancelHighLightTimer();

        ChipFlyController.controller.allChipClearDataAndAnimation();
        break;
      case 107: //监听服务器主动推送107（结算 ）-结算中
        mWs107Model = model as Ws107Model;

        /// 结算 开始高亮显示 赢的玩法
        startHighLightTimer();

        /// 发送完 投注记录  清空
        betMyQueue.clearEnqueue();
        betInfosListCurrent.clear();

        PlayRouter.sendWs168Bo();

        ChipFlyController.controller.allChipClearDataAndAnimation();
        break;
      case 160: //监听服务器主动推送160（停止下注) -开牌中
        ToastUtil.showCenterToast("停止下注");
        PlayRouter.sendWs168Bo();
        break;
      case 103: //监听服务器主动推送103（新一靴 ）-洗牌中
        betOnBottomTotalAmount = 0;
        tableBetPointDetailMapObs.clear();
        break;
      case 113: //监听服务器主动推送113（跳局）-结算中
        betOnBottomTotalAmount = 0;
        tableBetPointDetailMapObs.clear();
        PlayRouter.sendWs168Bo();
        break;
      case 171: //补牌
        var ws171model = model as Ws171Model;
        OpenPokerController.controller.repairPokerInfos(ws171model);
        break;
      case 117: //停止下注
        var ws117model = model as Ws117Model;
        //0-不弹出， 1-咪庄牌 2-咪闲牌 3-咪庄闲家牌
        var needMi = ws117model.needMi ?? 0;
        LogUtil.log("咪牌：$needMi");
        break;
    }
  }

  /// 初始化路子的数据
  void initRoadData() {
    var roadPaper10053 = RoadHomeTableModelManager().gameDetailModel.roadPaper;
    // print("当前游戏页面初始化数据为 ${roadPaper10053?.bigRoad} ");
    ws116Model.update((model) {
      model?.roadPaper.bigRoad = roadPaper10053?.bigRoad;
      model?.roadPaper.winPointPlateRoad = roadPaper10053?.winPointPlateRoad;
      model?.roadPaper.dragonBonusPlateRoad =
          roadPaper10053?.dragonBonusPlateRoad;
      model?.roadPaper.bigPairRoad = roadPaper10053?.bigPairRoad;
      model?.roadPaper.beatPlateRoad = roadPaper10053?.beatPlateRoad;
      model?.roadPaper.winLoseRoad = roadPaper10053?.winLoseRoad;
      model?.roadPaper.cockroachPig = roadPaper10053?.cockroachPig;
      model?.roadPaper.smallRoad = roadPaper10053?.smallRoad;
      model?.roadPaper.bigEyeBoy = roadPaper10053?.bigEyeBoy;
      model?.roadPaper.bigSmallPlateRoad = roadPaper10053?.bigSmallPlateRoad;
      model?.roadPaper.newBigPairRoad = roadPaper10053?.newBigPairRoad;
    });
  }

  /// 获取左侧路子图
  // 1、庄闲珠盘路（对应RoadPaperType枚举 MAIN_ROAD）
  // 对应116协议服务器字段：roadPaper.beatPlateRoad
  // 2、大小珠盘路（对应RoadPaperType枚举 BIG_SMALL）
  // 对应116协议服务器字段：roadPaper.bigSmallPlateRoad
  // 3、龙宝珠盘路（对应RoadPaperType枚举 DRAG_BOUNS）
  // 对应116协议服务器字段：roadPaper.dragonBonusPlateRoad
  // 4、点数珠盘路（对应RoadPaperType枚举 WIN_POINT）
  // 对应116协议服务器字段：roadPaper.winPointPlateRoad
  // 以上4种路子对应图片集为cn_baccarat_main_road_60x60
  List<List<String>> getLeftRoadData(RoadPaperType_Baccarat roadType) {
    var roadData = ws116Model.value;
    // 加密的路子字符串
    // String _secretRoadStr = "";

    RoadPaperType_Baccarat RoadPaperType_BaccaratType;

    switch (roadType) {
      case RoadPaperType_Baccarat.MAIN_ROAD:
        //  加密路子 字符串
        var secretRoadStr = roadData.roadPaper?.beatPlateRoad ?? "";

        /// 解密路子图
        var roadInfoListData = RoadPaperUIDataTool_Baccarat.GetRoadPaperUIData(
            secretRoadStr, RoadPaperType_Baccarat.MAIN_ROAD);
        var roadInfoList =
            roadInfoListData?.baseUIData?.allRoadPaperTextList ?? [[]];
        return roadInfoList;

      case RoadPaperType_Baccarat.BIG_SMALL:
        //  加密路子 字符串
        var bigPairRoadStr = roadData.roadPaper?.bigSmallPlateRoad ?? "";

        /// 解密路子图
        var roadInfoListData = RoadPaperUIDataTool_Baccarat.GetRoadPaperUIData(
            bigPairRoadStr, RoadPaperType_Baccarat.BIG_SMALL);
        var roadInfoList =
            roadInfoListData?.baseUIData?.allRoadPaperTextList ?? [[]];
        return roadInfoList;

      case RoadPaperType_Baccarat.NONE:
      // TODO: Handle this case.
      case RoadPaperType_Baccarat.BIG_ROAD:
      // TODO: Handle this case.
      case RoadPaperType_Baccarat.BIG_EYE_ROAD:
      // TODO: Handle this case.
      case RoadPaperType_Baccarat.SMALL_ROAD:
      // TODO: Handle this case.
      case RoadPaperType_Baccarat.SMALL_Q_ROAD:
      // TODO: Handle this case.
      case RoadPaperType_Baccarat.DRAG_BOUNS:
      // TODO: Handle this case.
      case RoadPaperType_Baccarat.WIN_POINT:
      // TODO: Handle this case.
      case RoadPaperType_Baccarat.BIG_PAIR_ROAD:
      // TODO: Handle this case.
      case RoadPaperType_Baccarat.BIG_PAIR_AND_SUPER_SIX_ROAD:
        //  加密路子 字符串
        var secretRoadStr = roadData.roadPaper?.beatPlateRoad ?? "";

        /// 解密路子图
        var roadInfoListData = RoadPaperUIDataTool_Baccarat.GetRoadPaperUIData(
            secretRoadStr, RoadPaperType_Baccarat.BIG_PAIR_AND_SUPER_SIX_ROAD);
        var roadInfoList =
            roadInfoListData?.baseUIData?.allRoadPaperTextList ?? [[]];
        return roadInfoList;

      case RoadPaperType_Baccarat.ZHI_SHA:
      // TODO: Handle this case.
    }

    return [[]];
  }

  // 右下3个 从左到右分别为
  // 大眼路（对应RoadPaperType枚举 BIG_EYE_ROAD）
  // 对应116协议服务器字段：roadPaper.bigEyeBoy
  // 小路（对应RoadPaperType枚举SMALL_ROAD）
  // 对应116协议服务器字段：roadPaper.smallRoad
  // 小强路（对应RoadPaperType枚举SMALL_Q_ROAD）
  // 对应116协议服务器字段：roadPaper.cockroachPig
  // 以上3种路子对应图片集为baccarat_other_road_16x16
  List<List<String>> getSectorRoadData(RoadPaperType_Baccarat roadType) {
    var roadData = ws116Model.value;
    // 加密的路子字符串
    String secretRoadStr = "";

    switch (roadType) {
      case RoadPaperType_Baccarat.NONE:
      // TODO: Handle this case.
      case RoadPaperType_Baccarat.MAIN_ROAD:
        secretRoadStr = roadData.roadPaper?.beatPlateRoad ?? "";
        break;
      case RoadPaperType_Baccarat.BIG_ROAD:
      // TODO: Handle this case.
      case RoadPaperType_Baccarat.BIG_EYE_ROAD:
        secretRoadStr = roadData.roadPaper?.bigEyeBoy ?? "";
        break;
      case RoadPaperType_Baccarat.SMALL_ROAD:
        secretRoadStr = roadData.roadPaper?.smallRoad ?? "";
        break;
      case RoadPaperType_Baccarat.SMALL_Q_ROAD:
        secretRoadStr = roadData.roadPaper?.cockroachPig ?? "";
        break;
      case RoadPaperType_Baccarat.DRAG_BOUNS:
      // TODO: Handle this case.
      case RoadPaperType_Baccarat.WIN_POINT:
      // TODO: Handle this case.
      case RoadPaperType_Baccarat.BIG_PAIR_ROAD:
      // TODO: Handle this case.
      case RoadPaperType_Baccarat.BIG_PAIR_AND_SUPER_SIX_ROAD:
      // TODO: Handle this case.
      case RoadPaperType_Baccarat.BIG_SMALL:
      // TODO: Handle this case.
      case RoadPaperType_Baccarat.ZHI_SHA:
      // TODO: Handle this case.
    }

    /// 解密路子图
    var roadInfoListData = RoadPaperUIDataTool_Baccarat.GetRoadPaperUIData(
        secretRoadStr, roadType);
    var roadInfoList =
        roadInfoListData?.baseUIData?.allRoadPaperTextList ?? [[]];
    // print("当前解密的小路路子图为${roadInfoList}");
    return roadInfoList;
  }

  /// 获取大路非直杀相关的路子信息
  List<List<String>> getBigPairNormalRoadData() {
    var roadData = ws116Model.value;
    var secretRoadStr = roadData.roadPaper?.bigPairRoad ?? "";
    var roadType = RoadPaperType_Baccarat.BIG_PAIR_ROAD;
    // print("♥大路是超级六${roadData.tableId}");
    // print("♥大路是超级六${isCommissionOrSuperSix()}");
    // 是否为超级六或者免佣百家乐 （大路才有）
    if (isCommissionOrSuperSix()) {
      roadType = RoadPaperType_Baccarat.BIG_PAIR_AND_SUPER_SIX_ROAD;
      // secretRoadStr = roadData.roadPaper?.newBigPairRoad ?? "";
    } else {
      roadType = RoadPaperType_Baccarat.BIG_PAIR_ROAD;
      // secretRoadStr = roadData.roadPaper?.bigPairRoad ?? "";
    }
    // print("♥大路是超级六${secretRoadStr}");

    /// 解密路子图
    var roadInfoListData = RoadPaperUIDataTool_Baccarat.GetRoadPaperUIData(
        secretRoadStr, roadType);
    // print("♥大路是超级六${roadInfoListData}");

    var roadInfoList =
        roadInfoListData?.baseUIData?.allRoadPaperTextList ?? [[]];

    // print("♥大路是超级六非直杀${roadInfoList}");

    return roadInfoList;
  }

  /// 获取大路直杀相关的路子信息
  List<List<String>> getBigPairZhiShaRoadData() {
    var roadData = ws116Model.value;
    var secretRoadStr = roadData.roadPaper?.newBigPairRoad ?? "";
    var roadType = RoadPaperType_Baccarat.ZHI_SHA;

    // 是否为超级六或者免佣百家乐 （大路才有）
    // if (isCommissionOrSuperSix()) {
    //   secretRoadStr = roadData.roadPaper?.newBigPairRoad ?? "";
    // } else {
    //   secretRoadStr = roadData.roadPaper?.bigPairRoad ?? "";
    // }
    // print("♥大路是超级六直杀${secretRoadStr}");

    /// 解密路子图
    var roadInfoListData = RoadPaperUIDataTool_Baccarat.GetRoadPaperUIData(
        secretRoadStr, roadType);
    var roadInfoList =
        roadInfoListData?.baseUIData?.allRoadPaperTextList ?? [[]];
    // print("♥大路是超级六直杀${roadInfoList}");
    return roadInfoList;
  }

  /// 判断是否为超级六或者免佣百家乐 (大路才有)
  bool isCommissionOrSuperSix() {
    //老代码
    //免庄判断用户登录后服务器下发 commissionStatus是否=1
    bool isCommission = (currentWs10000Model.data?.commissionStatus == 1);
    //游戏类型判断 用户登录后服务器下发defaultWaysToPlay判断
    var betPanelType = currentWs10000Model.data?.defaultWaysToPlay.toString();
    //PC端
    bool isSuperSix = betPanelType == "8" ||
        betPanelType == "5" ||
        betPanelType == "2" ||
        betPanelType == "1001" ||
        betPanelType == "1004" ||
        betPanelType == "1007";

    return isCommission || isSuperSix;
  }

  /// 获取大路的数据(案例测试 非实际使用)
  List<List<String>> getBigRoadData() {
    var roadData = ws116Model.value;
    //  加密路子 字符串
    var bigPairRoadStr = roadData.roadPaper?.bigPairRoad ?? "";

    /// 解密路子图
    var roadInfoListData = RoadPaperUIDataTool_Baccarat.GetRoadPaperUIData(
        bigPairRoadStr, RoadPaperType_Baccarat.BIG_PAIR_ROAD);
    var roadInfoList =
        roadInfoListData?.baseUIData?.allRoadPaperTextList ?? [[]];

    return roadInfoList;
  }

  void updateTableBetPointDetailMapObs(Ws110Model ws110Model) {
    List<VirtualTableDetail>? virtualTableDetailList =
        ws110Model.virtualTableDetail;
    if (virtualTableDetailList != null && virtualTableDetailList.isNotEmpty) {
      betOnBottomTotalAmount = 0;
      for (var value in virtualTableDetailList) {
        var betPointId = value.betPointId!;
        var amount = value.amount ?? 0;

        if (BaccaratBetPointGroupType.PLAYER.value == betPointId ||
            BaccaratBetPointGroupType.TIE.value == betPointId ||
            BaccaratBetPointGroupType.BANKER.value == betPointId) {
          betOnBottomTotalAmount = betOnBottomTotalAmount + amount;
        }

        var tableBetPointDetail = TableBetPointDetail();
        tableBetPointDetail.player = 1;
        tableBetPointDetail.amount = value.amount;

        tableBetPointDetailMapObs.update(
            betPointId,
            (value) => TableBetPointDetail(
                player: (value.player! + 1), amount: value.amount! + amount),
            ifAbsent: () => TableBetPointDetail(player: 1, amount: amount));
      }
    }
  }

  void updateProfitBetPointDTOSMapObs(Ws10040Model ws10040Model) {
    ActivityList? activityListData = ws10040Model.activityList?.first;

    if (activityListData != null) {
      var serverTime = activityListData.serverTime ?? 0;
      var activityStartTime = activityListData.activityStartTime ?? 0;
      var activityEndTime = activityListData.activityEndTime ?? 0;
      if (serverTime >= activityStartTime && serverTime <= activityEndTime) {
        var list = activityListData.returnProfitBetPointDTOS ?? [];
        if (list.isNotEmpty) {
          profitBetPointDTOSMapObs.clear();

          for (var value in list) {
            profitBetPointDTOSMapObs[value.betPointId!] = value;
          }
        }
      }
    }
  }

  @override
  updateTableNoObs(int roundId, String roundNo) {
    // LogUtil.log(
    //     "--BetOnController--updateTableNoObs-roundId=${roundId}");
    if (roundNo.isNotEmpty && tableNoObs.value != roundNo) {
      tableNoObs.value = roundNo;
    }
    mRoundId = roundId;
  }

  @override
  updateTableBootLimit(String bootLimit) {
    if (bootLimit.isNotEmpty && tableBootLimit.value != bootLimit) {
      tableBootLimit.value = bootLimit;
    }
  }

  /// 判断是否可以满足下注
  bool isBetOn(int betPointId, int betAmount) {
    var mTableBootNumberLimitMapOb = mTableBootNumberLimitMapObs[betPointId];

    if (104 != mGameProtocolId) {
      ToastUtil.showToast('非下注不能操作！');
      return false;
    }

    var status = mTableBootNumberLimitMapOb?.status ?? 0;
    if (status == 0) {
      ToastUtil.showToast('该玩法停用！');
      return false;
    }

    var bootLimitCount = mTableBootNumberLimitMapOb?.bootLimitCount ?? 0;
    if (PlayRoomController.controller.mBootTotalCount > bootLimitCount) {
      ToastUtil.showToast('超过限制局数！');
      return false;
    }

    var tableBetPointLimit = mTableBetPointLimitMapObs[betPointId];
    var min = tableBetPointLimit?.min ?? 0;
    var max = tableBetPointLimit?.max ?? 0;

    if (GlobalController.controller.mUserInfoModel.value.balance! < min) {
      ToastUtil.showToast('不足最低下注金额!');
      return false;
    }
    LogUtil.log("betAmount=$betAmount, max=$max");
    if (betAmount > max) {
      ToastUtil.showToast('超过最大限制金额，自动选择最大投注金额！');
      betAmount = max;
    }

    return true;
  }

  /// 发送下注请求
  void sendWs105Bo() {
    LogUtil.log("--BetOnController--sendWs105Bo-");

    if (betInfosListCurrent.isEmpty) {
      LogUtil.log("--BetOnController--sendWs105Bo-当前下注列表为空");
      return;
    }

    var ws105bo = Ws105Bo(
        betInfos: betInfosListCurrent,
        betSource: 1,
        bettingMode: PlayRoomController.controller.bettingMode,
        roundId: mRoundId);

    WebSocketManager.sendMessageSocket(
        socketType: SocketType.BET,
        param: ws105bo.toJson(),
        gameTypeId: PlayRouter.mGameTypeId,
        tableId: PlayRouter.mCurrentTableId,
        serviceTypeId: ServiceTypeId.GAME);
  }

  /// 取消发送下注请求
  void sendWs271Bo(List<int> betPointIdList) {
    LogUtil.log(
        "--BetOnController--sendWs271Bo-取消下注-betPointIdList=${betPointIdList}");

    var ws271bo = Ws271Bo(
      tableId: PlayRouter.mCurrentTableId,
      roundId: mRoundId,
      playerId: GlobalController.controller.playerId,
      gameTypeId: PlayRouter.mGameTypeId,
      isAll: 1,
      gameMode: 1,
      betMode: 0,
      betSource: 0,
      bettingType: 1,
      betPointIdList: betPointIdList,
    );

    WebSocketManager.sendMessageSocket(
        socketType: SocketType.FAST_BET_REQUEST,
        param: ws271bo.toJson(),
        gameTypeId: PlayRouter.mGameTypeId,
        tableId: PlayRouter.mCurrentTableId,
        serviceTypeId: ServiceTypeId.GAME);

    ///同步服务端取消之后 记得清楚本地临时保存的法码取消list
    // tempCancelBetInfosList.clear();
  }

  void updateWs271Model(Ws271Model value) {
    // LogUtil.log("--BetOnController--updateWs271Model-");
    ToastUtil.showCenterToast("取消下注成功");
    //移除队列取消的下注记录
    var removeFirst = betMyQueue.removeFirst();
    // LogUtil.log("--BetOnController--updateWs271Model-取消下注=${removeFirst}");

    var cancelBettings = value.cancelBettings;
    if (cancelBettings != null && cancelBettings.isNotEmpty) {
      for (var value1 in cancelBettings) {
        // LogUtil.log(
        //     "--BetOnController--updateWs271Model-取消下注成功=${value1.betPointId}");
        //todo 法码取消动画
        ChipFlyController.controller
            .cancelPlayChip(value1.cancelAmount!, value1.betPointId);
      }
    }
  }

  void updateWs105Model(Ws105Model value) {
    // LogUtil.log("--BetOnController--updateWs105Model-");
    ToastUtil.showCenterToast("下注成功");

    betMyQueue.enqueue(betInfosListCurrent);

    if (1 == PlayRoomController.controller.bettingMode) {
      var betInfos = value.betInfos;
      if (betInfos != null && value.betInfos!.isNotEmpty) {
        for (var value1 in value.betInfos!) {
          // LogUtil.log(
          //     "--BetOnController--updateWs105Model-下注成功=${value1.betPointId}");
          /// todo 快速投注  成功  飞法码
          _onChipFly(
              betAmount: value1.betAmount ?? 0,
              betPointId: value1.betPointId!,
              playerId: GlobalController.controller.playerId);
        }
      }
    }

    //保存当前下注信息-重复使用
    betInfosListLast.clear();
    betInfosListLast.addAll(betInfosListCurrent);

    // 当前下注信息清空
    betInfosListCurrent.clear();

    // 更新当前下注确认显示 金额 为0
    updateConfirmBetAmount(0);
  }

  void updateWs162Model(Ws162Model value) {
    var playerId = value.playerId;

    if (tableBetInfoModelMap.containsKey(playerId)) {
      var tableBetInfoModel = tableBetInfoModelMap[playerId]!;

      tableBetInfoModel.playerId = value.playerId;
      tableBetInfoModel.currency = value.currency;
      tableBetInfoModel.balance = value.balance;
      tableBetInfoModel.roundId = value.roundId;
      tableBetInfoModel.tableId = value.tableId;
      tableBetInfoModel.seatId = value.seatId;

      var betInfosMap = tableBetInfoModel.betInfosMap;

      if (value.betInfos != null && value.betInfos!.isNotEmpty) {
        for (var value1 in value.betInfos!) {
          betInfosMap!.update(
              value1.betPointId!,
              (value) => TableBetInfoModelBetInfos(
                  betPointId: value1.betPointId,
                  betAmount: value.betAmount! + value1.betAmount!,
                  betPointName: value1.betPointName,
                  betResult: value1.betResult),
              ifAbsent: () => TableBetInfoModelBetInfos(
                  betPointId: value1.betPointId,
                  betAmount: value1.betAmount,
                  betPointName: value1.betPointName,
                  betResult: value1.betResult));
        }
      }
    } else {
      var tableBetInfoModel = TableBetInfoModel();
      Map<int, TableBetInfoModelBetInfos> tableBetInfoModelBetInfosMap = {};

      tableBetInfoModel.playerId = value.playerId;
      tableBetInfoModel.currency = value.currency;
      tableBetInfoModel.balance = value.balance;
      tableBetInfoModel.roundId = value.roundId;
      tableBetInfoModel.tableId = value.tableId;
      tableBetInfoModel.seatId = value.seatId;

      if (value.betInfos != null && value.betInfos!.isNotEmpty) {
        for (var value in value.betInfos!) {
          var tableBetInfoModelBetInfos = TableBetInfoModelBetInfos();
          tableBetInfoModelBetInfos.betPointId = value.betPointId;
          tableBetInfoModelBetInfos.betPointName = value.betPointName;
          tableBetInfoModelBetInfos.betAmount = value.betAmount;
          tableBetInfoModelBetInfos.betResult = value.betResult;
          tableBetInfoModelBetInfosMap[value.betPointId!] =
              tableBetInfoModelBetInfos;
        }
      }
    }

    ///todo 飞法码
  }

  void updateWs273Model(ws_273_model.Ws273Model value) {
    var playerId = value.playerId;
    if (tableBetInfoModelMap.containsKey(playerId)) {
      //存在该玩家-走取消法码流程

      var tableBetInfoModel = tableBetInfoModelMap[playerId]!;
      var betInfosMap = tableBetInfoModel.betInfosMap!;

      if (value.cancelBettings != null && value.cancelBettings!.isNotEmpty) {
        for (var value1 in value.cancelBettings!) {
          if (betInfosMap.containsKey(value1.betPointId)) {
            betInfosMap[value1.betPointId!]!.betAmount =
                betInfosMap[value1.betPointId!]!.betAmount! -
                    value1.cancelAmount!;

            ///todo 飞法码
          }
        }
      }
    }
  }

  void updateTableBetInfoModelMapObs(
      List<ws_401_model.TableBetInfoList> tableBetInfoList) {
    tableBetInfoModelMap.clear();
    for (var value in tableBetInfoList) {
      var tableBetInfoModel = TableBetInfoModel();
      Map<int, TableBetInfoModelBetInfos> tableBetInfoModelBetInfosMap = {};

      tableBetInfoModel.playerId = value.playerId;
      tableBetInfoModel.currency = value.currency;
      tableBetInfoModel.betTwoStatusFlag = value.betTwoStatusFlag;

      var tableBetInfoModelBetInfos = TableBetInfoModelBetInfos();
      tableBetInfoModelBetInfos.betPointId = value.betPointId;
      tableBetInfoModelBetInfos.betAmount = value.betAmount;
      tableBetInfoModelBetInfos.betResult = value.betResult;

      tableBetInfoModelBetInfosMap[value.betPointId!] =
          tableBetInfoModelBetInfos;

      tableBetInfoModel.betInfosMap = tableBetInfoModelBetInfosMap;

      tableBetInfoModelMap[value.playerId!] = tableBetInfoModel;
    }
  }
}
