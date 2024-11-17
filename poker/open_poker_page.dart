import 'package:flutter/material.dart';
import 'package:flutter_main/generated/r.dart';
import 'package:flutter_main/widgets/gaps.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'open_poker_controller.dart';

class OpenPokerPage extends GetView<OpenPokerController> {
  const OpenPokerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OpenPokerController>(
      id: "OpenPokerPage",
      builder: (logic) {
        return Row(
          children: [
            Expanded(
              child: _buildPlayerWidget(),
            ),
            Expanded(
              child: _buildBankerWidget(),
            )
          ],
        );
      },
    );
  }

  /// 庄
  Widget _buildBankerWidget() {
    return Container(
      padding: EdgeInsets.zero,
      width: double.infinity,
      height: ScreenUtil().setHeight(102),
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(
            R.playingCardsPokerRed,
          ),
        ),
      ),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.end,
        children: [
          _banker1PokerWidget(),
          Gaps.w10,
          _banker2PokerWidget(),
          Gaps.w10,
          _banker3PokerWidget(),
        ],
      ).paddingOnly(left: ScreenUtil().setWidth(10)),
    );
  }

  /// 闲
  Widget _buildPlayerWidget() {
    return Container(
      padding: EdgeInsets.zero,
      width: double.infinity,
      height: ScreenUtil().setHeight(102),
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(
            R.playingCardsPokerBlue,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          _player1PokerWidget(),
          Gaps.w10,
          _player2PokerWidget(),
          Gaps.w10,
          _player3PokerWidget(),
        ],
      ).paddingOnly(right: ScreenUtil().setWidth(10)),
    );
  }

  /// 闲第一张扑克（补牌）
  Widget _player1PokerWidget() {
    return Visibility(
      visible: controller.isShowPlayerRepairPoker,
      child: Column(
        children: [
          Text(
            "",
            style: TextStyle(
              color: Colors.white,
              fontSize: ScreenUtil().setSp(24),
              fontWeight: FontWeight.w600,
            ),
          ),
          Gaps.h2,
          Image.asset(
            controller.player1PokerNumber,
            width: ScreenUtil().setWidth(44),
            height: ScreenUtil().setHeight(60),
          ),
        ],
      ),
    );
    return Obx(() {
      return Visibility(
        visible: controller.isShowPlayerRepairPoker,
        child: Column(
          children: [
            Text(
              "",
              style: TextStyle(
                color: Colors.white,
                fontSize: ScreenUtil().setSp(24),
                fontWeight: FontWeight.w600,
              ),
            ),
            Gaps.h2,
            Image.asset(
              controller.player1PokerNumber,
              width: ScreenUtil().setWidth(44),
              height: ScreenUtil().setHeight(60),
            ),
          ],
        ),
      );
    });
  }

  /// 闲第二张扑克
  Widget _player2PokerWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          "闲",
          style: TextStyle(
            color: Colors.white,
            fontSize: ScreenUtil().setSp(24),
            fontWeight: FontWeight.w600,
          ),
        ),
        Gaps.h2,
        Image.asset(
          controller.player2PokerNumber,
          width: ScreenUtil().setWidth(44),
          height: ScreenUtil().setHeight(60),
        ),
      ],
    );
  }

  /// 闲第三张扑克
  Widget _player3PokerWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "10",
          style: TextStyle(
            color: Colors.white,
            fontSize: ScreenUtil().setSp(24),
            fontWeight: FontWeight.w600,
          ),
        ),
        Gaps.h2,
        Image.asset(
          controller.player3PokerNumber,
          width: ScreenUtil().setWidth(44),
          height: ScreenUtil().setHeight(60),
        ),
      ],
    );
  }

  /// 庄第一张扑克
  Widget _banker1PokerWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          "庄",
          style: TextStyle(
            color: Colors.white,
            fontSize: ScreenUtil().setSp(24),
            fontWeight: FontWeight.w600,
          ),
        ),
        Gaps.h2,
        Image.asset(
          controller.banker1PokerNumber,
          width: ScreenUtil().setWidth(44),
          height: ScreenUtil().setHeight(60),
        ),
      ],
    );
  }

  /// 庄第二张扑克
  Widget _banker2PokerWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "10",
          style: TextStyle(
            color: Colors.white,
            fontSize: ScreenUtil().setSp(24),
            fontWeight: FontWeight.w600,
          ),
        ),
        Gaps.h2,
        Image.asset(
          controller.banker2PokerNumber,
          width: ScreenUtil().setWidth(44),
          height: ScreenUtil().setHeight(60),
        ),
      ],
    );
  }

  /// 庄第三张扑克（补牌）
  Widget _banker3PokerWidget() {
    return Visibility(
      visible: controller.isShowBankerRepairPoker,
      child: Column(
        children: [
          Text(
            "",
            style: TextStyle(
              color: Colors.white,
              fontSize: ScreenUtil().setSp(24),
              fontWeight: FontWeight.w600,
            ),
          ),
          Gaps.h2,
          Image.asset(
            controller.banker3PokerNumber,
            width: ScreenUtil().setWidth(44),
            height: ScreenUtil().setHeight(60),
          ),
        ],
      ),
    );
    return Obx(() {
      return Visibility(
        visible: controller.isShowBankerRepairPoker,
        child: Column(
          children: [
            Text(
              "",
              style: TextStyle(
                color: Colors.white,
                fontSize: ScreenUtil().setSp(24),
                fontWeight: FontWeight.w600,
              ),
            ),
            Gaps.h2,
            Image.asset(
              controller.banker3PokerNumber,
              width: ScreenUtil().setWidth(44),
              height: ScreenUtil().setHeight(60),
            ),
          ],
        ),
      );
    });
  }
}
