import 'package:flutter/material.dart';
import 'package:flutter_main/configs/app_colors.dart';
import 'package:flutter_main/configs/app_images.dart';
import 'package:flutter_main/controllers/global_controller.dart';
import 'package:flutter_main/controllers/websocket_controller.dart';
import 'package:flutter_main/pages/play/count_down/count_down_page.dart';
import 'package:flutter_main/pages/play/operation/index.dart';
import 'package:flutter_main/utils/base/base_container.dart';
import 'package:flutter_main/utils/base/base_widget.dart';
import 'package:flutter_main/widgets/gaps.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../utils/hex_color.dart';

class OperationPage extends GetView<OperationController> {
  const OperationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Stack(
        children: [
          switchGema(),
          backArea(),
          amountArea(),
          // 更多按钮
          _CustomBtnWidget(
            top: Gaps.d(6),
            right: Gaps.d(8),
            image: AppImages.playRoomMore(isClick: controller.isShowMore.value),
            onTap: controller.onTapMore,
          ),
          // 帮助
          _CustomBtnWidget(
            top: Gaps.d(6),
            right: Gaps.d(48),
            image: AppImages.playRoomHelp,
            isShow: controller.isShowMore.value,
            onTap: controller.onTapHelp,
          ),
          // 声音设置
          _CustomBtnWidget(
            top: Gaps.d(6),
            right: Gaps.d(88),
            image: AppImages.playRoomVoice,
            isShow: controller.isShowMore.value,
            onTap: controller.onTapVoice,
          ),
          // 视频
          _CustomBtnWidget(
            top: Gaps.d(6),
            right: Gaps.d(128),
            image: AppImages.playRoomVideo,
            isShow: controller.isShowMore.value,
            onTap: controller.onTapVideo,
          ),
          // 礼物按钮
          _CustomBtnWidget(
            top: Gaps.d(46),
            right: Gaps.d(8),
            image: AppImages.playRoomGift,
            isShow: controller.roomController.dealerLogin.value == 0,
            onTap: controller.onTapGift,
          ),
          // 个人信息
          _CustomBtnWidget(
            top: Gaps.d(46),
            right: Gaps.d(48),
            image: AppImages.playRoomInfo,
            isShow: controller.isShowMore.value,
            onTap: controller.onTapInfo,
          ),
          // 换桌
          _CustomBtnWidget(
            top: Gaps.d(46),
            right: Gaps.d(88),
            image: AppImages.playRoomTable,
            isShow: controller.isShowMore.value,
            onTap: controller.onTapGemaSetting,
          ),
          // 发送信息
          _CustomBtnWidget(
            bottom: Gaps.d(435),
            left: Gaps.d(8),
            image: AppImages.playRoomMsg,
            onTap: controller.onTapMessage,
          ),
          // 座位
          _CustomBtnWidget(
            bottom: Gaps.d(435),
            left: Gaps.d(54),
            image: AppImages.playRoomZhuan,
            onTap: controller.onTapVillage,
          ),
          // // 好路
          _CustomBtnWidget(
            bottom: Gaps.d(435),
            right: Gaps.d(8),
            image: AppImages.playRoomRoad,
            onTap: controller.onTapRoadMore,
          ),
          // 倒计时-投注状态
          countDownArea(),
        ],
      );
    });
  }

  backArea() {
    return Positioned(
        top: ScreenUtil().setWidth(6),
        left: ScreenUtil().setWidth(8),
        child: GestureDetector(
          onTap: controller.onTapClose,
          behavior: HitTestBehavior.translucent,
          child: Container(
              padding:
                  const EdgeInsets.only(top: 3, left: 10, right: 10, bottom: 3),
              height: 32,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColors.room_0B0B0C,
                borderRadius: const BorderRadius.all(
                  Radius.circular(16),
                ),
              ),
              child: Text(
                'back'.tr,
                style: const TextStyle(fontSize: 12, color: Colors.white),
              )),
        ));
  }

  amountArea() {
    return Obx(() {
      return Positioned(
          top: ScreenUtil().setWidth(6),
          left: ScreenUtil().setWidth(64),
          child: Container(
            padding:
                const EdgeInsets.only(top: 3, left: 10, right: 10, bottom: 3),
            height: 32,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.room_0B0B0C,
              borderRadius: BorderRadius.all(
                Radius.circular(60),
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  // color: Colors.red,// 背景颜色
                  width: 16, // 给Container设置宽度
                  height: 16, // 给Container设置高度
                  alignment: Alignment.center, // 内容居中对齐
                  child: Image.asset(
                      'assets/images/road/light/icon_coin.png'), // Text可设置为需要的内容或占位符
                ),
                const SizedBox(width: 8),
                // 金钱的值
                Text(
                    controller.isOpenEye.value
                        ? "${GlobalController.controller.mUserInfoModel.value.balance}"
                        : "********",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
                const SizedBox(width: 8),
                // 小眼睛按钮（打开 隐藏）
                Container(
                  width: 16, // 给Container设置宽度
                  height: 16, // 给Container设置高度
                  alignment: Alignment.center, // 内容居中对齐
                  child: GestureDetector(
                    onTap: controller.onTapOpenEye,
                    behavior: HitTestBehavior.translucent,
                    child: Image.asset(controller.isOpenEye.value
                        ? 'assets/images/road/light/yue_icon_on.png'
                        : 'assets/images/road/light/yue_icon_off.png'),
                  ),
                ),
              ],
            ),
          ).intoInkeWell(onTap: controller.onTapPushBettingRecords));
    });
  }

  roadArea() {
    return Positioned(
      // bottom: Get.height - ScreenUtil().setWidth(270 + 36 * 2) + 60,
      // top: Gaps.d(220),
      bottom: Get.height - Gaps.d(270),
      right: ScreenUtil().setWidth(8),
      child: Obx(() => HYContainer(
            alignment: Alignment.center,
            backgroundColor: controller.isGemaOpen.value
                ? HexColor.ColorHex('#000000', opcity: 0.1)
                : Colors.transparent,
            borderRadius:
                BorderRadius.circular(controller.isGemaOpen.value ? 18 : 0),
            child: Wrap(
              direction: Axis.vertical,
              spacing: 10,
              children: [
                if (controller.isGemaOpen.value) ...[
                  HYContainer(
                    backgroundImage: 'assets/images/play/icon_warm.png',
                    width: 36,
                    height: 36,
                    onTap: controller.onTapGemaInfo,
                  ),
                  HYContainer(
                    backgroundImage: AppImages.playRoomHelp,
                    width: 36,
                    height: 36,
                    onTap: controller.onTapGemaWeb,
                  ),
                  HYContainer(
                    backgroundImage: AppImages.playRoomTable,
                    width: 36,
                    height: 36,
                    onTap: controller.onTapGemaSetting,
                  )
                ],
                HYContainer(
                  backgroundImage: 'assets/images/play/icon_play_more.png',
                  width: 36,
                  height: 36,
                  onTap: controller.onTapRoadMore,
                ),
              ],
            ),
          )),
    );
  }

  countDownArea() {
    return Positioned(
        top: Gaps.d(158),
        right: Gaps.d(80),
        child: Container(
          width: 44,
          height: 44,
          child: CountDownPage(),
        ));
  }

  switchGema() {
    return Positioned(
        child: GestureDetector(
      child:
          SizedBox(width: double.infinity, height: ScreenUtil().setWidth(324)),
      onVerticalDragUpdate: (details) {
        // 判断滑动方向
        if (details.primaryDelta! > 0) {
          // 向下滑动
        } else if (details.primaryDelta! < 0) {
          // 向上滑动
        }
      },
      onVerticalDragEnd: (details) {},
    ));
  }
}

class _CustomBtnWidget extends StatelessWidget {
  final String image;
  final double? left;
  final double? top;
  final double? right;
  final double? bottom;
  final bool isShow;
  final VoidCallback? onTap;

  const _CustomBtnWidget({
    super.key,
    required this.image,
    this.left,
    this.top,
    this.right,
    this.bottom,
    this.isShow = true,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: left,
      right: right,
      bottom: bottom,
      child: Visibility(
        visible: isShow,
        child: GestureDetector(
            onTap: onTap,
            behavior: HitTestBehavior.translucent,
            child: Container(
              width: 36,
              height: 36,
              alignment: Alignment.center,
              child: Image.asset(image),
            )),
      ),
    );
  }
}
