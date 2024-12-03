import 'package:flutter/material.dart';
import 'package:flutter_main/controllers/global_controller.dart';
import 'package:flutter_main/generated/r.dart';
import 'package:flutter_main/models/chip_model.dart';
import 'package:flutter_main/pages/play/bet_on/index.dart';
import 'package:flutter_main/pages/play/bet_switch/bet_game_switch_play_page.dart';
import 'package:flutter_main/pages/play/widgets/play_bet_on_widget.dart';
import 'package:flutter_main/pages/play/widgets/play_road_tab_widget.dart';
import 'package:flutter_main/widgets/gaps.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../chip_area/chip_area_page.dart';
import '../chip_fly/chip_fly_controller.dart';
import '../chip_fly/chip_fly_page.dart';

class BetOnPage extends GetView<BetOnController> {
  // 获取全局控制器实例
  final GlobalController globalController = GlobalController.controller;

  final ChipFlyController ctl = Get.put(ChipFlyController());

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 0,
        left: 0,
        right: 0,
        child: Column(
          children: [
            //局号
            playTitleArea(),
            //投注-小玩法
            ChipFlyPage(
              chlid:
              PlayBetOnWidget(key: ChipFlyController.controller.globalKey),
            ),
            //投注-确定
            confirmArea(),
            //投注-法码
            playArea(context),
            //路纸图
            PlayRoadTabWidget(),
          ],
        ));
  }

  playTitleArea() {
    return Obx(() {
      return Container(
        margin: EdgeInsets.only(
          left: ScreenUtil().setWidth(8),
          right: ScreenUtil().setWidth(8),
        ),
        padding: const EdgeInsets.only(
          left: 10,
          right: 10,
        ),
        height: ScreenUtil().setWidth(16),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.black.withOpacity(0.2),
              Colors.transparent,
              Colors.transparent,
              Colors.black.withOpacity(0.2),
            ],
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '局号:${controller.tableNoObs.value}',
              textAlign: TextAlign.center,
              style:
              TextStyle(fontSize: 10, color: Colors.white.withOpacity(0.7)),
            ),
            Spacer(),
            Container(
              width: 12,
              height: 12,
              alignment: Alignment.center,
              child: Image.asset(R.playIconPlayWarm),
            ),
            Gaps.w4,
            Text(
              '限红:${controller.tableBootLimit.value}',
              style:
              TextStyle(fontSize: 10, color: Colors.white.withOpacity(0.7)),
            ),
          ],
        ),
      );
    });
  }

  playArea(BuildContext context) {
    return Obx(() {
      return Container(
        padding: EdgeInsets.only(
          left: ScreenUtil().setWidth(8),
          right: ScreenUtil().setWidth(8),
        ),
        width: double.infinity,
        height: ScreenUtil().setWidth(55),
        alignment: Alignment.center,
        child: Row(
          children: [
            Stack(
              children: [
                Container(
                  width: 44,
                  height: ScreenUtil().setWidth(55),
                  alignment: Alignment.center,
                  child: Container(
                    width: 32,
                    height: 32,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(18),
                      ),
                      border: Border.all(
                          color: const Color(0x33FFFFFF), width: 0.8),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withOpacity(0.2),
                          Colors.transparent,
                          Colors.transparent,
                          Colors.black.withOpacity(0.2),
                        ],
                      ),
                    ),
                    child: GestureDetector(
                      onTap: ((){
                        print("点击了游戏切换按钮");
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true, // 允许自定义高度
                          // backgroundColor: AppColors.lightBackgroundColor04,
                          useRootNavigator: true,
                          builder: (final context) => BetGameSwitchPlayPage(),
                        );
                      }),
                      child: Text("Bets".tr,
                          style: TextStyle(fontSize: 10, color: Colors.white,)),
                    )

                  ),
                ),
                if (controller.profitBetPointDTOSMapObs.keys.isNotEmpty)
                  Positioned(
                    top: 5,
                    right: 0,
                    child: Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(40),
                        ),
                        color: Color(0xFFC62828),
                      ),
                      child: Text("返利".tr,
                          style: TextStyle(
                              fontSize: 8,
                              fontWeight: FontWeight.w500,
                              color: Colors.white)),
                    ),
                  ),
              ],
            ),
            Expanded(child: _buildChipAreaList()),
            Container(
              width: 32,
              height: 32,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(18),
                ),
                border: Border.all(color: const Color(0x33FFFFFF), width: 0.8),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.2),
                    Colors.transparent,
                    Colors.transparent,
                    Colors.black.withOpacity(0.2),
                  ],
                ),
              ),
              child: Text("CB".tr,
                  style: TextStyle(fontSize: 10, color: Colors.white)),
            )
          ],
        ),
      );
    });
  }

  /// 选择筹码
  _buildChipAreaList() {
    return ChipAreaPage();
  }

  confirmArea() {
    return Obx(() {
      return Container(
        padding: EdgeInsets.only(
          left: Gaps.d(8),
          right: Gaps.d(8),
        ),
        width: double.infinity,
        height: ScreenUtil().setWidth(41),
        alignment: Alignment.center,
        child: Row(
          children: [
            GestureDetector(
              onTap: controller.onTapCancel,
              behavior: HitTestBehavior.translucent,
              child: Container(
                  padding: const EdgeInsets.only(
                      top: 3, left: 10, right: 10, bottom: 3),
                  height: 34,
                  width: 76,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.all(
                      Radius.circular(18),
                    ),
                  ),
                  child: Text(
                    '取消',
                    style: TextStyle(fontSize: 13, color: Color(0xFFFFFFFF)),
                  )),
            ),
            Gaps.w10,
            GestureDetector(
              onTap: controller.onTapRepeat,
              behavior: HitTestBehavior.translucent,
              child: Container(
                  padding: const EdgeInsets.only(
                      top: 3, left: 10, right: 10, bottom: 3),
                  height: 34,
                  width: 76,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.all(
                      Radius.circular(18),
                    ),
                  ),
                  child: Text(
                    controller.isRepeatObs.value ? '重复' : 'X2',
                    style: TextStyle(fontSize: 13, color: Color(0xFFFFFFFF)),
                  )),
            ),
            Gaps.w10,
            Expanded(
                child: Stack(
                  children: [
                    Container(
                        padding: const EdgeInsets.only(
                            top: 3, left: 10, right: 10, bottom: 3),
                        height: 34,
                        width: double.infinity,
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.all(
                            Radius.circular(18),
                          ),
                        ),
                        child: Text(
                          '${controller.confirmBetAmount.value}',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFFFFFFFF)),
                        )),
                    if(!GlobalController.controller.isQuikBet.value)
                      Positioned(
                      top: 0,
                      bottom: 0,
                      right: 0,
                      child: GestureDetector(
                        onTap: controller.onTapConfirm,
                        behavior: HitTestBehavior.translucent,
                        child: Container(
                            padding: const EdgeInsets.only(
                                top: 3, left: 10, right: 10, bottom: 3),
                            height: 34,
                            width: 76,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.2),
                              borderRadius: BorderRadius.all(
                                Radius.circular(18),
                              ),
                            ),
                            child: Text(
                              '确定',
                              style:
                              TextStyle(fontSize: 13, color: Color(0xFFFFFFFF)),
                            )),
                      ),
                    )
                  ],
                ))
          ],
        ),
      );
    });
  }

  betOnArea() {
    return Container(
      padding: const EdgeInsets.only(
        left: 8,
        right: 8,
      ),
      width: double.infinity,
      height: ScreenUtil().setWidth(174),
      child: Stack(
        children: [
          betOnPlayArea(),
          betOnResultArea(),
        ],
      ),
    );
  }

  betOnPlayArea() {
    return Positioned(
        top: 0,
        left: 0,
        right: 0,
        child: Container(
          height: ScreenUtil().setWidth(94),
          // decoration: BoxDecoration(
          //     image: DecorationImage(
          //         image: AssetImage('assets/images/play/bet_play_bg.png'),
          //         fit: BoxFit.fill)),0x33FFFFFF
          decoration: BoxDecoration(
            // color: Colors.white.withOpacity(0.2),
            border: Border.all(color: Color(0x33FFFFFF), width: 1),
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  child: Column(
                    children: [
                      Gaps.h15,
                      Text("闲对",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFC8DCFF))),
                      Gaps.h7,
                      Text("1:11",
                          style: TextStyle(
                              fontSize: 9,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFCBDDFF))),
                      Gaps.h7,
                      Row(
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            // color: Colors.red,// 背景颜色
                            width: 10, // 给Container设置宽度
                            height: 10, // 给Container设置高度
                            alignment: Alignment.center, // 内容居中对齐
                            child: Image.asset(
                                'assets/images/play/room_person.png'), // Text可设置为需要的内容或占位符
                          ),
                          Gaps.w2,
                          // 金钱的值
                          Text("22",
                              style: TextStyle(
                                  fontSize: 10, color: Color(0xFFFFFFFF))),
                          Gaps.w10,
                          Container(
                            // color: Colors.red,// 背景颜色
                            width: 10, // 给Container设置宽度
                            height: 10, // 给Container设置高度
                            alignment: Alignment.center, // 内容居中对齐
                            child: Image.asset(
                                'assets/images/play/room_zhu.png'), // Text可设置为需要的内容或占位符
                          ),
                          Gaps.w2,
                          // 金钱的值
                          Text("422",
                              style: TextStyle(
                                  fontSize: 10, color: Color(0xFFFFFFFF))),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Container(
                  padding: const EdgeInsets.only(top: 4, bottom: 4),
                  height: ScreenUtil().setWidth(94),
                  width: 0.6,
                  color: Color(0x00FFFFFF)),
              Expanded(
                child: Container(
                  child: Column(
                    children: [
                      Gaps.h15,
                      Text("庄对",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFFFBBC6))),
                      Gaps.h7,
                      Text("1:11",
                          style: TextStyle(
                              fontSize: 9,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFCBDDFF))),
                      Gaps.h7,
                      Row(
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            // color: Colors.red,// 背景颜色
                            width: 10, // 给Container设置宽度
                            height: 10, // 给Container设置高度
                            alignment: Alignment.center, // 内容居中对齐
                            child: Image.asset(
                                'assets/images/play/room_person.png'), // Text可设置为需要的内容或占位符
                          ),
                          Gaps.w2,
                          // 金钱的值
                          Text("22",
                              style: TextStyle(
                                  fontSize: 10, color: Color(0xFFFFFFFF))),
                          Gaps.w10,
                          Container(
                            // color: Colors.red,// 背景颜色
                            width: 10, // 给Container设置宽度
                            height: 10, // 给Container设置高度
                            alignment: Alignment.center, // 内容居中对齐
                            child: Image.asset(
                                'assets/images/play/room_zhu.png'), // Text可设置为需要的内容或占位符
                          ),
                          Gaps.w2,
                          // 金钱的值
                          Text("422",
                              style: TextStyle(
                                  fontSize: 10, color: Color(0xFFFFFFFF))),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  betOnResultArea() {
    return Positioned(
        right: 0,
        left: 0,
        bottom: 0,
        child: Container(
          width: double.infinity,
          height: ScreenUtil().setWidth(104),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                  bottomLeft: Radius.circular(50.0),
                  bottomRight: Radius.circular(50.0),
                ),
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
                ),
              ),
              Positioned(
                left: ScreenUtil().setWidth(11),
                top:
                (ScreenUtil().screenWidth - ScreenUtil().setWidth(108)) / 2,
                child: Container(
                  width: ScreenUtil().setWidth(108),
                  height: ScreenUtil().setWidth(82),
                  decoration: BoxDecoration(
                    // color: Colors.white.withOpacity(0.2),
                      border: Border.all(color: Color(0x33FFFFFF), width: 1),
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                      color: Colors.blue),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      child: Column(
                        children: [
                          Gaps.h15,
                          Text("闲",
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFFC8DCFF))),
                          Gaps.h7,
                          Text("1:1",
                              style: TextStyle(
                                  fontSize: 9,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFFCBDDFF))),
                          Gaps.h7,
                          Row(
                            // crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                // color: Colors.red,// 背景颜色
                                width: 10, // 给Container设置宽度
                                height: 10, // 给Container设置高度
                                alignment: Alignment.center, // 内容居中对齐
                                child: Image.asset(
                                    'assets/images/play/room_person.png'), // Text可设置为需要的内容或占位符
                              ),
                              Gaps.w2,
                              // 金钱的值
                              Text("22",
                                  style: TextStyle(
                                      fontSize: 10, color: Color(0xFFFFFFFF))),
                              Gaps.w10,
                              Container(
                                // color: Colors.red,// 背景颜色
                                width: 10, // 给Container设置宽度
                                height: 10, // 给Container设置高度
                                alignment: Alignment.center, // 内容居中对齐
                                child: Image.asset(
                                    'assets/images/play/room_zhu.png'), // Text可设置为需要的内容或占位符
                              ),
                              Gaps.w2,
                              // 金钱的值
                              Text("422",
                                  style: TextStyle(
                                      fontSize: 10, color: Color(0xFFFFFFFF))),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: Column(
                        children: [
                          Gaps.h15,
                          Text("和",
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFFC0F4CB))),
                          Gaps.h7,
                          Text("1:8",
                              style: TextStyle(
                                  fontSize: 9,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFFCBDDFF))),
                          Gaps.h7,
                          Row(
                            // crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                // color: Colors.red,// 背景颜色
                                width: 10, // 给Container设置宽度
                                height: 10, // 给Container设置高度
                                alignment: Alignment.center, // 内容居中对齐
                                child: Image.asset(
                                    'assets/images/play/room_person.png'), // Text可设置为需要的内容或占位符
                              ),
                              Gaps.w2,
                              // 金钱的值
                              Text("22",
                                  style: TextStyle(
                                      fontSize: 10, color: Color(0xFFFFFFFF))),
                              Gaps.w10,
                              Container(
                                // color: Colors.red,// 背景颜色
                                width: 10, // 给Container设置宽度
                                height: 10, // 给Container设置高度
                                alignment: Alignment.center, // 内容居中对齐
                                child: Image.asset(
                                    'assets/images/play/room_zhu.png'), // Text可设置为需要的内容或占位符
                              ),
                              Gaps.w2,
                              // 金钱的值
                              Text("422",
                                  style: TextStyle(
                                      fontSize: 10, color: Color(0xFFFFFFFF))),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: Column(
                        children: [
                          Gaps.h15,
                          Text("庄",
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFFFFBBC6))),
                          Gaps.h7,
                          Text("1:0.95",
                              style: TextStyle(
                                  fontSize: 9,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFFCBDDFF))),
                          Gaps.h7,
                          Row(
                            // crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                // color: Colors.red,// 背景颜色
                                width: 10, // 给Container设置宽度
                                height: 10, // 给Container设置高度
                                alignment: Alignment.center, // 内容居中对齐
                                child: Image.asset(
                                    'assets/images/play/room_person.png'), // Text可设置为需要的内容或占位符
                              ),
                              Gaps.w2,
                              // 金钱的值
                              Text("22",
                                  style: TextStyle(
                                      fontSize: 10, color: Color(0xFFFFFFFF))),
                              Gaps.w10,
                              Container(
                                // color: Colors.red,// 背景颜色
                                width: 10, // 给Container设置宽度
                                height: 10, // 给Container设置高度
                                alignment: Alignment.center, // 内容居中对齐
                                child: Image.asset(
                                    'assets/images/play/room_zhu.png'), // Text可设置为需要的内容或占位符
                              ),
                              Gaps.w2,
                              // 金钱的值
                              Text("422",
                                  style: TextStyle(
                                      fontSize: 10, color: Color(0xFFFFFFFF))),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
