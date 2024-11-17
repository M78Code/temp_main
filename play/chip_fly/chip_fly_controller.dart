import 'dart:collection';
import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter_main/models/betting_area.dart';

import 'package:get/get.dart';
import 'package:simple_animations/animation_builder/custom_animation_builder.dart';
import 'package:simple_animations/movie_tween/movie_tween.dart';

import '../../../models/chip_model.dart';
import '../../../models/ws/ws_game_status_model.dart';
import '../../../utils/Commond/Data/GameEnum.dart';
import '../../../utils/chip_util.dart';
import '../../../utils/log_util.dart';
import '../chip_area/chip_area_controller.dart';
import 'fly_model.dart';

class ChipFlyController extends GetxController
    with GetSingleTickerProviderStateMixin {
  static ChipFlyController get controller {
    return Get.find<ChipFlyController>();
  }

  // BaccaratBetPointGroupType
  Queue<FlyModel> queueFlyModel = Queue();

  HashMap<int, List<FlyModel>> stackingFlyMap = HashMap();

  int mGameProtocolId = 0;

  //获取当前Widget大小
  // final RenderBox renderBox =
  // _keyGreen.currentContext.findRenderObject();
  // final sizeGreen = renderBox.size;
  // print("SIZEofgreen: $sizeGreen");

//获取当前屏幕位置
//   final positionGreen = renderBox.localToGlobal(Offset.zero);

  GlobalKey globalKey = GlobalKey();

  double cfWidth = 400.0;
  double cfHeight = 200.0;
  BettingArea _bettingArea = BettingArea(
      offsetArea: Offset(400, 2000), offsetCoordinate: Offset(0, 0));

  late Animation<Offset> animation;
  Control animationControl = Control.play;
  bool hastWeenClear = false;

  // List<FlyModel> stackingFlyModelList = [];
  // Queue<FlyModel> queueFlyModel = Queue();

  @override
  void onInit() {
    super.onInit();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final RenderBox? renderBox =
          globalKey.currentContext?.findRenderObject() as RenderBox?;
      final size = renderBox?.paintBounds.size;
      cfWidth = size?.width ?? 0;
      cfHeight = size?.height ?? 0;
      _bettingArea.offsetArea = Offset(cfWidth, cfHeight);
      print("ChipFlyController size : $size");
      update();

      // offset.dx , offset.dy 就是控件的左上角坐标
      var topLeft = renderBox!.localToGlobal(Offset.zero);
      _bettingArea.offsetArea = topLeft;
      print("ChipFlyController local : $topLeft");
      Offset bottomRight = topLeft.translate(
          renderBox.size.width, renderBox.size.height); //组件右下坐标
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  onCompletedPlayAnimationBuilder(FlyModel fly) {
    var betPointId = fly.betPointId;
    // if (stackingFlyMap.containsKey(fly.betPointId)) {
    //   List<FlyModel> stackingFlyModelList = stackingFlyMap[betPointId]!;
    //   stackingFlyModelList.add(queueFlyModel.removeFirst());
    // } else {
    //   List<FlyModel> stackingFlyModelList = [];
    //   stackingFlyModelList.add(queueFlyModel.removeFirst());
    //   stackingFlyMap[betPointId ?? 0] = stackingFlyModelList;
    // }
    print(
        "onChipFly onCompletedPlayAnimationBuilder = $betPointId  ${queueFlyModel.length}");

    update();
  }

  /// 外部接口调用 betPointId  betAmount playerId
  onChipFly(
      {required int betAmount,
      required int betPointId,
      int? playerId,
      Offset? offset}) {
    playChipAnimation();
    // print("onChipFly betPointId = $betPointId");
    hastWeenClear = false;
    animationControl = Control.play;
    var fy =
        _getFlyModel(ChipUtil.betAmountToChipModelFly(betAmount), betPointId);
    queueFlyModel.add(fy);
    update();
  }

  _getFlyModel(ChipModel chipModel, int betPointId) {
    var offset = Offset.zero;
    double positionedBottom = 0;
    double positionedLeft = 0;

    // BaccaratBetPointGroupType.PLAYER_NUMBER_PAIR.value;

    switch (betPointId) {
      case 3005:
        offset = Offset(-cfWidth / 4 - 30, -cfHeight / 4 * 3 + 30);
        positionedBottom = cfHeight / 4 * 3;
        positionedLeft = cfWidth / 4;

        break;
      case 3004:
        offset = Offset(cfWidth / 4 + 30, -cfHeight / 4 * 3 + 30);
        positionedBottom = cfHeight / 4 * 3;
        positionedLeft = cfWidth / 4 * 3;
        break;
      case 3002:
        offset = Offset(-cfWidth / 6 * 2 + 50, -cfHeight / 4 + 30);
        positionedBottom = cfHeight / 6 * 1;
        positionedLeft = cfWidth / 4;
        break;
      case 3003:
        offset = Offset(-30, -cfHeight / 4 + 30);
        positionedBottom = cfHeight / 6 * 3;
        positionedLeft = cfWidth / 4;
        break;
      case 3001:
        offset = Offset(cfWidth / 6 * 2 - 50, -cfHeight / 4 + 30);
        positionedBottom = cfHeight / 6 * 5;
        positionedLeft = cfWidth / 4;
        break;
    }

    var tween = MovieTween()
      ..scene(
              begin: const Duration(milliseconds: 0),
              end: const Duration(milliseconds: 1))
          .tween("height", Tween(begin: 0.0, end: 50.0))
      ..scene(
              begin: const Duration(milliseconds: 1),
              duration: const Duration(milliseconds: 500))
          .tween('x', Tween(begin: 0.0, end: offset.dx))
      ..scene(
              begin: const Duration(milliseconds: 1),
              duration: const Duration(milliseconds: 500))
          .tween('y', Tween(begin: 0.0, end: offset.dy));

    var tweenClear = MovieTween()
      ..scene(
              begin: const Duration(milliseconds: 0),
              duration: const Duration(milliseconds: 500))
          .tween('x', Tween(begin: offset.dx, end: 1000))
      ..scene(
              begin: const Duration(milliseconds: 0),
              duration: const Duration(milliseconds: 500))
          .tween('y', Tween(begin: offset.dy, end: 1000));

    var fm = FlyModel(
      tween: tween,
      tweenClear: tweenClear,
      chipModel: chipModel,
      endx: offset.dx,
      endy: offset.dy,
      positionedBottom: positionedBottom,
      positionedLeft: positionedLeft,
      betPointId: betPointId,
    );

    if (stackingFlyMap.containsKey(betPointId)) {
      var list = stackingFlyMap[betPointId];
      if (list?.isNotEmpty ?? false) {
        var cen = list?.length ?? 0;
        if ((list?.length ?? 0) > 5) {
          cen = 5;
        }
        fm.positionedBottom = (fm.positionedBottom ?? 0) + (2 * cen);
        fm.endy = offset.dy - (3 * cen);
        // fm.positionedBottom = positionedBottom + (2 * cen);
        fm.tween = MovieTween()
          ..scene(
                  begin: const Duration(milliseconds: 0),
                  end: const Duration(milliseconds: 1))
              .tween("height", Tween(begin: 0.0, end: 50.0))
          ..scene(
                  begin: const Duration(milliseconds: 1),
                  duration: const Duration(milliseconds: 500))
              .tween('x', Tween(begin: 0.0, end: fm.endx))
          ..scene(
                  begin: const Duration(milliseconds: 1),
                  duration: const Duration(milliseconds: 500))
              .tween('y', Tween(begin: 0.0, end: fm.endy));
        switch (betPointId) {
          case 3005:
            fm.tweenClear = MovieTween()
              ..scene(
                      begin: const Duration(milliseconds: 0),
                      duration: const Duration(milliseconds: 500))
                  .tween('x', Tween(begin: fm.endx, end: 0))
              ..scene(
                      begin: const Duration(milliseconds: 0),
                      duration: const Duration(milliseconds: 500))
                  .tween('y', Tween(begin: fm.endy, end: -1000));
            break;
          case 3004:
            fm.tweenClear = MovieTween()
              ..scene(
                      begin: const Duration(milliseconds: 0),
                      duration: const Duration(milliseconds: 500))
                  .tween('x', Tween(begin: fm.endx, end: 0))
              ..scene(
                      begin: const Duration(milliseconds: 0),
                      duration: const Duration(milliseconds: 500))
                  .tween('y', Tween(begin: fm.endy, end: 1000));
            break;
          case 3002:
            fm.tweenClear = MovieTween()
              ..scene(
                      begin: const Duration(milliseconds: 0),
                      duration: const Duration(milliseconds: 500))
                  .tween('x', Tween(begin: fm.endx, end: 0))
              ..scene(
                      begin: const Duration(milliseconds: 0),
                      duration: const Duration(milliseconds: 500))
                  .tween('y', Tween(begin: fm.endy, end: -1000));
            break;
          case 3003:
            fm.tweenClear = MovieTween()
              ..scene(
                      begin: const Duration(milliseconds: 0),
                      duration: const Duration(milliseconds: 500))
                  .tween('x', Tween(begin: fm.endx, end: 0))
              ..scene(
                      begin: const Duration(milliseconds: 0),
                      duration: const Duration(milliseconds: 500))
                  .tween('y', Tween(begin: fm.endy, end: 1000));
            break;
          case 3001:
            fm.tweenClear = MovieTween()
              ..scene(
                      begin: const Duration(milliseconds: 0),
                      duration: const Duration(milliseconds: 500))
                  .tween('x', Tween(begin: fm.endx, end: 0))
              ..scene(
                      begin: const Duration(milliseconds: 0),
                      duration: const Duration(milliseconds: 500))
                  .tween('y', Tween(begin: fm.endy, end: 1000));
            break;
        }
      }
      list?.add(fm);
    } else {
      List<FlyModel> list = [];
      list.add(fm);
      stackingFlyMap[betPointId] = list;
    }
    return fm;
  }

  /// 清空所有有筹码数据
  allChipClear() {
    queueFlyModel.clear();
    stackingFlyMap.clear();
    update();
  }

  /// 清空所有筹码动画
  allChipClearAnimation() {
    hastWeenClear = true;
    animationControl = Control.playReverseFromEnd;
    update();
  }

  /// 清空所有筹码数据和动画
  allChipClearDataAndAnimation() async {
    hastWeenClear = true;
    animationControl = Control.playReverseFromEnd;
    update();
    await Future.delayed(const Duration(milliseconds: 500));
    allChipClear();
  }

  /// 开始投注动画
  playChipAnimation() {
    hastWeenClear = false;
    animationControl = Control.play;
    update();
  }

  /// 取消一个筹码
  cancelPlayChip(int betAmount, betPointId) {
    hastWeenClear = false;
    var list = stackingFlyMap[betPointId];
    if (list?.isNotEmpty ?? false) {
      for (int i = 0; i < (list?.length ?? 0); i++) {
        var item = list?[i];
        if (item?.chipModel?.parValue != betAmount) {
          list?.removeAt(i);
          break;
        }
      }
    }

    if (queueFlyModel.isNotEmpty) {
      queueFlyModel.removeWhere((item) {
        item.animationControl = Control.playReverse;
        return item.chipModel?.parValue == betAmount;
      });
    }
    update();
  }

  /// 取消所有筹码
  cancelPlayAllChip() async {
    hastWeenClear = false;
    animationControl = Control.playReverse;
    update();
    await Future.delayed(const Duration(milliseconds: 500));
    allChipClear();
  }

  updateGameStatusModel(int protocolId,dynamic model) {
    mGameProtocolId = protocolId;
    if (107 == mGameProtocolId) {
      //监听服务器主动推送107（结算 ）-结算中
      /// 发送完 投注记录  清空
    } else if (104 == mGameProtocolId) {
      //监听服务器主动推送104（新一局 ）-下注中并倒计时
      // playChipAnimation();
    } else if (160 == mGameProtocolId) {
      //监听服务器主动推送160（停止下注) -开牌中
      // allChipClearDataAndAnimation();
    } else if (103 == mGameProtocolId) {
      //监听服务器主动推送103（新一靴 ）-洗牌中
    } else if (113 == mGameProtocolId) {
      //监听服务器主动推送113（跳局）-结算中
    }
  }
}
