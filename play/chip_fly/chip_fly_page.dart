import 'dart:collection';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:simple_animations/animation_builder/custom_animation_builder.dart';
import 'package:simple_animations/animation_builder/play_animation_builder.dart';
import 'package:simple_animations/movie_tween/movie_tween.dart';

import '../../../models/pair_triple.dart';
import '../../../utils/event_bus_util.dart';
import '../widgets/chip_fly_text.dart';
import '../widgets/chip_text.dart';
import 'chip_fly_controller.dart';
import 'fly_model.dart';

class ChipFlyPage extends StatelessWidget {
  ChipFlyPage({super.key, this.chlid});
  Widget? chlid;

  final ChipFlyController ctl = Get.put(ChipFlyController());

  @override
  Widget build(BuildContext context) {
    return _rootView(context);
  }

  _rootView(BuildContext context) {
    return Opacity(
      opacity: 1.0,
      child: Listener(
        child: Stack(
          children: <Widget>[
            chlid ?? SizedBox.expand(),
            // IgnorePointer
            IgnorePointer(
              ignoring: false,
              child: GetBuilder<ChipFlyController>(
                  init: ctl,
                  builder: (ChipFlyController controller) {
                    return Container(
                      // color: Colors.white,
                      height: ctl.cfHeight,
                      width: ctl.cfWidth,
                      padding: EdgeInsets.zero,
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          ..._animationFlyModelView(ctl.queueFlyModel),
                          ..._stackingFlyMap(),
                        ],
                      ),
                    );
                  }),
            ),
          ],
        ),
        onPointerDown: (event) {
          print("点击了整体区域");
        },
      ),
    );
  }

  List<CustomAnimationBuilder<Movie>> _animationFlyModelView(
      Queue<FlyModel> queueFlyModel) {
    var list = queueFlyModel.map((item) {
      var tween = item.tween;
      var tweenClear = item.tweenClear;
      var hastWeenClear = ctl.hastWeenClear;
      var myTween = hastWeenClear ? tweenClear : tween;
      var chip = item.chipModel;

      var animationControl = item.animationControl;

      return CustomAnimationBuilder<Movie>(
        control: animationControl ?? ctl.animationControl,
        tween: myTween,
        // Pass in tween
        duration: myTween.duration,
        // Obtain duration
        onStarted: () {
          print("onChipFly onStarted");
        },
        onCompleted: () {
          ctl.onCompletedPlayAnimationBuilder(item);
        },
        builder: (context, value, child) {
          final x = value.get('x');
          final y = value.get('y');
          return Transform.translate(
            // Get animated offset
            key: Key(DateTime.now().millisecondsSinceEpoch.toString()),
            offset: Offset(x, y),
            child: Container(
              width: 30,
              height: 30,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    height: 30,
                    width: 30,
                    chip?.icon ?? "",
                  ),
                  Transform(
                    alignment: Alignment.center, //相对于坐标系原点的对齐方式
                    transform: Matrix4.skewX(0.3), //沿Y轴倾斜0.3弧度
                    child: ChipFlyTextWidget(
                        maxWidth: 25, parValue: chip?.parValue ?? 0),
                  ),
                ],
              ),
            ),
          );
        },
      );
    }).toList();

    return list;
  }

  _stackingChipsViewStack(List<FlyModel> list) {
    return Container(
      height: 10,
      child: Stack(
        children: [
          ..._stackingChipsView(list),
        ],
      ),
    );
  }

  _stackingChipsView(List<FlyModel> list) {
    return list
        .asMap()
        .map((index, item) {
          var chip = item.chipModel;
          var b = (item.positionedBottom ?? 0) + (index * 2);
          var m = MapEntry(
            index,
            Positioned(
              bottom: b,
              left: item.positionedLeft,
              child: Image.asset(
                height: 30,
                width: 30,
                "assets/images/chips/common_chip_fly_1.png",
              ),
            ),
          );
          return m;
        })
        .values
        .toList();
  }

  _stackingFlyMap() {
    var v = ctl.stackingFlyMap.entries.map((item) {
      List<FlyModel> list = item.value;

      int totalAmount = 0;
      FlyModel? fm;
      if (list.isNotEmpty) {
        fm = list[list.length - 1];
        list.forEach((it) {
          totalAmount += it.chipModel?.parValue ?? 0;
        });
        // fm = list[0];
        EventBusRoadUtil.eventBus.fire(Pair("TotalBet", totalAmount));
      }
      print("ChipFlyController positionedBottom ${fm?.positionedBottom}");
      return Positioned(
        bottom: fm?.positionedBottom ?? 0 + 200.0,
        left: fm?.positionedLeft ?? 0 + 5.0,
        child: Container(),
        /*
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 2, horizontal: 10),
          decoration: BoxDecoration(
            color: Color(0xaa000000), // 背景颜色
            borderRadius: BorderRadius.circular(2.0), // 圆角半径
          ),
          child: Text(
            "$totalAmount",
            style: TextStyle(color: Colors.white, fontSize: 8),
          ),
        ),*/
      );
    }).toList();
    return v;
  }
}
