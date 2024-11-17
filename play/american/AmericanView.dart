import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_main/utils/base/base_text.dart';
import 'package:get/get.dart';

import '../../../generated/r.dart';
import 'AmericanController.dart';
import 'AmericanModel.dart';
import 'corona_model.dart';

class AmericanView extends GetView<AmericanController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() => Transform.scale(
          scale: controller.scale.value,
          alignment: Alignment.topCenter,
          child: LayoutBuilder(builder: (c, BoxConstraints b) {
            controller.nX = b.maxWidth / 14;
            controller.nY = b.maxHeight / 15;

            return GestureDetector(
              child: Stack(
                children: [
                  Container(
                    width: b.maxWidth,
                    height: b.maxHeight,
                    color: Colors.transparent,
                    child: buildBlinkView(),
                  ),
                  Container(
                    width: b.maxWidth,
                    height: b.maxHeight,
                    color: Colors.transparent,
                    child: bettingView(),
                  )
                ],
              ),
              onTapDown: (d) {
                controller.onTapDown(d.localPosition);
              },
            );
          }),
        ));
  }

  Widget bettingView() {
    return Obx(() {
      var list = <Widget>[];
      controller.bettingMap.value.forEach((key, value) {
        var md = AmericanModel.getModel(key);
        list.add(bettingItem(md, value));
      });

      return Stack(
        children: list,
      );
    });
  }

  Widget bettingItem(AmericanModel md, List<int> value) {
    var x = controller.nX * md.x;
    var y = controller.nY * md.y;
    var isZ = [4, 8, 10].contains(md.x) &&
        [2.5, 3.5, 4.5, 5.5, 6.5, 7.5, 8.5, 9.5, 10.5, 11.5, 12.5, 13.5]
            .contains(md.y);
    return Positioned(
      left: x + (isZ ? 0 : -5),
      top: y - 30,
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.fromLTRB(3, 1, 3, 3),
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(R.coronaUnion),
                  fit: BoxFit.fill,
                  centerSlice: Rect.fromLTRB(0, 0, 96, 56)),
              // 圆角边框
            ),
            child: Text(
              '${value.length * 100}',
              style: const TextStyle(
                color: Color(0xFFFAE28C),
                fontSize: 8,
                fontFamily: 'PingFang SC',
                fontWeight: FontWeight.w500,
                // height: 0.10,
              ),
            ),
          ),
          Container(
              width: 24,
              height: 24,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(R.chipsCommonChipCustom),
                    fit: BoxFit.fill,
                    centerSlice: Rect.fromLTRB(0, 0, 97, 96)),
                // 圆角边框
              ),
              child: Transform(
                  alignment: Alignment.center, // 设置旋转轴心
                  transform: Matrix4.identity()
                    ..rotateX(math.pi * 0.3)
                    ..rotateY(math.pi * 0.1)
                    ..rotateZ(math.pi * 0.1), // 沿 X 轴旋转 90 度
                  child: ZsText(
                    '100',
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.bold,
                    fontSize: 8,
                  ))),
        ],
      ),
    );
  }

  Widget buildBlinkView() {
    return Column(
      children: [
        Expanded(
          flex: 2,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: Container(),
              ),
              ...controller.c0.map((e) => itemModel(e)).toList(),
            ],
          ),
        ),
        Expanded(
            flex: 13,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [row1(), row2()],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: row3(),
                ),
                Expanded(
                  flex: 2,
                  child: row4(),
                ),
                Expanded(
                  flex: 2,
                  child: row5(),
                ),
              ],
            )),
      ],
    );
  }

  Widget row1() {
    return Expanded(
        flex: 2,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ...controller.r1.map((e) => itemModel(e)).toList(),
            Expanded(child: Container()),
          ],
        ));
  }

  Widget row2() {
    return Expanded(
        flex: 2,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ...controller.r2.map((e) => itemModel(e)).toList(),
            Expanded(child: Container()),
          ],
        ));
  }

  Widget row3() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: controller.r3.map((e) => itemModel(e)).toList(),
    );
  }

  Widget row4() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: controller.r4.map((e) => itemModel(e)).toList(),
    );
  }

  Widget row5() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: controller.r5.map((e) => itemModel(e)).toList(),
    );
  }

  Widget itemModel(CoronaModel md) {
    if (md.name == '0') {
      return Expanded(
          flex: md.flex,
          child: Obx(() {
            if (controller.selectSet.contains(md.name)) {
              return AnimatedBuilder(
                  animation: controller.imageAnimation,
                  builder: (context, child) {
                    var str = controller.imageAnimation.value == 1
                        ? R.corona0
                        : R.corona0S;
                    return Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(str),
                            fit: BoxFit.fill,
                            centerSlice: const Rect.fromLTRB(0, 0, 496, 92)),
                        // 圆角边框
                      ),
                      child: Text(
                        md.name,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    );
                  });
            } else {
              return Container(
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(R.corona0),
                      fit: BoxFit.fill,
                      centerSlice: Rect.fromLTRB(0, 0, 496, 92)),
                  // 圆角边框
                ),
                child: Text(
                  md.name,
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                ),
              );
            }
          }));
    }

    return Expanded(
        flex: md.flex,
        child: Obx(() {
          Widget view;
          if (['红', '黑'].contains(md.name)) {
            view = Image.asset(
              md.name == '红' ? R.coronaRed : R.coronaBlack,
              width: controller.nX * 0.7,
              fit: BoxFit.cover,
            );
          } else {
            view = Text(md.name,
                style: const TextStyle(color: Colors.white, fontSize: 12));
          }
          if (controller.selectSet.contains(md.name.replaceAll('\n', ''))) {
            var animation = [
              controller.colorAnimation,
              controller.redAnimation,
              controller.blackAnimation
            ][md.colorType];

            return AnimatedBuilder(
              animation: animation,
              builder: (context, child) {
                return Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: animation.value,
                    border: Border.all(
                      color:
                          Colors.white.withOpacity(0.30000001192092896), // 边框颜色
                    ),
                    borderRadius: controller.radius[md.borderRadius], // 圆角边框
                  ),
                  child: view,
                );
              },
            );
          }
          return Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: controller.colors[md.colorType], // 背景色
              border: Border.all(
                color: Colors.white.withOpacity(0.30000001192092896), // 边框颜色
              ),
              borderRadius: controller.radius[md.borderRadius], // 圆角边框
            ),
            child: view,
          );
        }));
  }
}
