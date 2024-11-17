import 'package:flutter/material.dart';
import 'package:flutter_main/generated/r.dart';
import 'package:flutter_main/pages/play/bet_on/index.dart';
import 'package:flutter_main/pages/play/widgets/play_adapter.dart';
import 'package:flutter_main/utils/Commond/Data/GameEnum.dart';
import 'package:flutter_main/widgets/gaps.dart';
import 'package:flutter_main/widgets/theme_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

/// 百家乐-经典玩法
class PlayBetOnWidget extends GetView<BetOnController> {
  PlayBetOnWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
        width: double.infinity,
        height: ScreenUtil().setWidth(176),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(R.playBetOnTopBrBg),
            fit: BoxFit.fill,
          ),
        ),
        child: Stack(
          // alignment: Alignment.center,
          children: [
            betOnBottomWidget(),
            if (BetPlayType.CLASSICS.value == controller.mBetPlayType.value)
              betOnTopClassicsWidget(),
            if (BetPlayType.SUPER_LUCK_7.value == controller.mBetPlayType.value)
              betOnTopSuperLucky7Widget(),
            if (BetPlayType.LUCK_6.value == controller.mBetPlayType.value)
              betOnTopLucky6Widget(),
            if (BetPlayType.SUPER_PAIR.value == controller.mBetPlayType.value)
              betOnTopSuperPairWidget(),
            if (BetPlayType.SUPER_TIE.value == controller.mBetPlayType.value)
              controller.isSuperTieOpenObs.value
                  ? betOnTopSuperTieOpenWidget()
                  : betOnTopSuperTieWidget(),
            if (BetPlayType.LUCK_6_TIGER.value == controller.mBetPlayType.value)
              betOnTopLuck6TigerWidget(),
            if (BetPlayType.NATURAL.value == controller.mBetPlayType.value)
              betOnTopNaturalWidget(),
            if (BetPlayType.DRAGON_TIGER.value == controller.mBetPlayType.value)
              betOnTopDragonTigerWidget(),
            if (BetPlayType.BIG_SMALL.value == controller.mBetPlayType.value)
              betOnTopBigSmallWidget(),
          ],
        ),
      );
    });
  }

  /// 投注区域-经典玩法
  betOnTopClassicsWidget() {
    return Container(
      padding: const EdgeInsets.only(
        top: 5,
        left: 8,
        right: 8,
      ),
      width: double.infinity,
      alignment: Alignment.topCenter,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _CustomPlayWidget(
            betPointId: BaccaratBetPointGroupType.PLAYER_NUMBER_PAIR.value,
            betOnController: controller,
            betPlayType: BetPlayType.CLASSICS.value,
            isFirst: true,
          ),
          Container(
            margin: const EdgeInsets.only(
              top: 10,
            ),
            width: 0.6,
            height: 60,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.white.withOpacity(0.4),
                  Colors.transparent,
                ],
              ),
            ),
          ),
          _CustomPlayWidget(
            betPointId: BaccaratBetPointGroupType.BANKER_NUMBER_PAIR.value,
            betOnController: controller,
            betPlayType: BetPlayType.CLASSICS.value,
          ),
        ],
      ),
    );
  }

  /// 投注区域-幸运6
  betOnTopLucky6Widget() {
    return Container(
      padding: const EdgeInsets.only(
        top: 5,
        left: 8,
        right: 8,
      ),
      width: double.infinity,
      alignment: Alignment.topCenter,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _CustomPlayWidget(
            betPointId: BaccaratBetPointGroupType.PLAYER_NUMBER_PAIR.value,
            betOnController: controller,
            betPlayType: BetPlayType.LUCK_6.value,
            isFirst: true,
          ),
          Container(
            margin: const EdgeInsets.only(
              top: 10,
            ),
            width: 0.6,
            height: 60,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.white.withOpacity(0.4),
                  Colors.transparent,
                ],
              ),
            ),
          ),
          _CustomPlayWidget(
            betPointId: BaccaratBetPointGroupType.PLAYER_DRAGON.value,
            betOnController: controller,
            betPlayType: BetPlayType.LUCK_6.value,
          ),
          Container(
            margin: const EdgeInsets.only(
              top: 10,
            ),
            width: 0.6,
            height: 60,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.white.withOpacity(0.4),
                  Colors.transparent,
                ],
              ),
            ),
          ),
          _CustomPlayWidget(
            betPointId: BaccaratBetPointGroupType.SUPER_SIX.value,
            betOnController: controller,
            betPlayType: BetPlayType.LUCK_6.value,
          ),
          Container(
            margin: const EdgeInsets.only(
              top: 10,
            ),
            width: 0.6,
            height: 60,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.white.withOpacity(0.4),
                  Colors.transparent,
                ],
              ),
            ),
          ),
          _CustomPlayWidget(
            betPointId: BaccaratBetPointGroupType.BANKER_DRAGON.value,
            betOnController: controller,
            betPlayType: BetPlayType.LUCK_6.value,
          ),
          Container(
            margin: const EdgeInsets.only(
              top: 10,
            ),
            width: 0.6,
            height: 60,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.white.withOpacity(0.4),
                  Colors.transparent,
                ],
              ),
            ),
          ),
          _CustomPlayWidget(
            betPointId: BaccaratBetPointGroupType.BANKER_NUMBER_PAIR.value,
            betOnController: controller,
            betPlayType: BetPlayType.LUCK_6.value,
          ),
        ],
      ),
    );
  }

  /// 投注区域-超级幸运7
  betOnTopSuperLucky7Widget() {
    return Container(
      padding: const EdgeInsets.only(
        top: 5,
        left: 8,
        right: 8,
      ),
      width: double.infinity,
      alignment: Alignment.topCenter,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _CustomPlayWidget(
            betPointId: BaccaratBetPointGroupType.PLAYER_NUMBER_PAIR.value,
            betOnController: controller,
            betPlayType: BetPlayType.SUPER_LUCK_7.value,
            isFirst: true,
          ),
          Container(
            margin: const EdgeInsets.only(
              top: 10,
            ),
            width: 0.6,
            height: 60,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.white.withOpacity(0.4),
                  Colors.transparent,
                ],
              ),
            ),
          ),
          _CustomPlayWidget(
            betPointId: BaccaratBetPointGroupType.LUCKY_SEVEN.value,
            betOnController: controller,
            betPlayType: BetPlayType.SUPER_LUCK_7.value,
          ),
          Container(
            margin: const EdgeInsets.only(
              top: 10,
            ),
            width: 0.6,
            height: 60,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.white.withOpacity(0.4),
                  Colors.transparent,
                ],
              ),
            ),
          ),
          _CustomPlayWidget(
            betPointId: BaccaratBetPointGroupType.SUPER_LUCKY_SEVEN.value,
            betOnController: controller,
            betPlayType: BetPlayType.SUPER_LUCK_7.value,
          ),
          Container(
            margin: const EdgeInsets.only(
              top: 10,
            ),
            width: 0.6,
            height: 60,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.white.withOpacity(0.4),
                  Colors.transparent,
                ],
              ),
            ),
          ),
          _CustomPlayWidget(
            betPointId: BaccaratBetPointGroupType.SUPER_SIX.value,
            betOnController: controller,
            betPlayType: BetPlayType.SUPER_LUCK_7.value,
          ),
          Container(
            margin: const EdgeInsets.only(
              top: 10,
            ),
            width: 0.6,
            height: 60,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.white.withOpacity(0.4),
                  Colors.transparent,
                ],
              ),
            ),
          ),
          _CustomPlayWidget(
            betPointId: BaccaratBetPointGroupType.BANKER_NUMBER_PAIR.value,
            betOnController: controller,
            betPlayType: BetPlayType.SUPER_LUCK_7.value,
          ),
        ],
      ),
    );
  }

  /// 投注区域-超对
  betOnTopSuperPairWidget() {
    return Container(
      padding: const EdgeInsets.only(
        top: 5,
        left: 8,
        right: 8,
      ),
      width: double.infinity,
      alignment: Alignment.topCenter,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _CustomPlayWidget(
            betPointId: BaccaratBetPointGroupType.PLAYER_NUMBER_PAIR.value,
            betOnController: controller,
            betPlayType: BetPlayType.SUPER_PAIR.value,
            isFirst: true,
          ),
          Container(
            margin: const EdgeInsets.only(
              top: 10,
            ),
            width: 0.6,
            height: 60,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.white.withOpacity(0.4),
                  Colors.transparent,
                ],
              ),
            ),
          ),
          _CustomPlayWidget(
            betPointId: BaccaratBetPointGroupType.ANY_NUMBER_PAIR.value,
            betOnController: controller,
            betPlayType: BetPlayType.SUPER_PAIR.value,
          ),
          Container(
            margin: const EdgeInsets.only(
              top: 10,
            ),
            width: 0.6,
            height: 60,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.white.withOpacity(0.4),
                  Colors.transparent,
                ],
              ),
            ),
          ),
          _CustomPlayWidget(
            betPointId: BaccaratBetPointGroupType.SUPER_PAIR.value,
            betOnController: controller,
            betPlayType: BetPlayType.SUPER_PAIR.value,
          ),
          Container(
            margin: const EdgeInsets.only(
              top: 10,
            ),
            width: 0.6,
            height: 60,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.white.withOpacity(0.4),
                  Colors.transparent,
                ],
              ),
            ),
          ),
          _CustomPlayWidget(
            betPointId: BaccaratBetPointGroupType.ALL_PAIR.value,
            betOnController: controller,
            betPlayType: BetPlayType.SUPER_PAIR.value,
          ),
          Container(
            margin: const EdgeInsets.only(
              top: 10,
            ),
            width: 0.6,
            height: 60,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.white.withOpacity(0.4),
                  Colors.transparent,
                ],
              ),
            ),
          ),
          _CustomPlayWidget(
            betPointId: BaccaratBetPointGroupType.BANKER_NUMBER_PAIR.value,
            betOnController: controller,
            betPlayType: BetPlayType.SUPER_PAIR.value,
          ),
        ],
      ),
    );
  }

  /// 投注区域-超和
  betOnTopSuperTieWidget() {
    return Container(
      padding: const EdgeInsets.only(
        top: 5,
        left: 8,
        right: 8,
      ),
      width: double.infinity,
      alignment: Alignment.topCenter,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _CustomPlayWidget(
            betPointId: BaccaratBetPointGroupType.PLAYER_NUMBER_PAIR.value,
            betOnController: controller,
            betPlayType: BetPlayType.SUPER_TIE.value,
            isFirst: true,
          ),
          Container(
            margin: const EdgeInsets.only(
              top: 10,
            ),
            width: 0.6,
            height: 60,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.white.withOpacity(0.4),
                  Colors.transparent,
                ],
              ),
            ),
          ),
          _CustomPlayWidget(
            betPointId: BaccaratBetPointGroupType.PANDA_EIGHT.value,
            betOnController: controller,
            betPlayType: BetPlayType.SUPER_TIE.value,
          ),
          Container(
            margin: const EdgeInsets.only(
              top: 10,
            ),
            width: 0.6,
            height: 60,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.white.withOpacity(0.4),
                  Colors.transparent,
                ],
              ),
            ),
          ),
          _CustomPlayTieWidget(
            betPointId: BaccaratBetPointGroupType.SUPER_TIE.value,
            betOnController: controller,
            betPlayType: BetPlayType.SUPER_TIE.value,
          ),
          Container(
            margin: const EdgeInsets.only(
              top: 10,
            ),
            width: 0.6,
            height: 60,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.white.withOpacity(0.4),
                  Colors.transparent,
                ],
              ),
            ),
          ),
          _CustomPlayWidget(
            betPointId: BaccaratBetPointGroupType.DRAGON_SEVEN.value,
            betOnController: controller,
            betPlayType: BetPlayType.SUPER_TIE.value,
          ),
          Container(
            margin: const EdgeInsets.only(
              top: 10,
            ),
            width: 0.6,
            height: 60,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.white.withOpacity(0.4),
                  Colors.transparent,
                ],
              ),
            ),
          ),
          _CustomPlayWidget(
            betPointId: BaccaratBetPointGroupType.BANKER_NUMBER_PAIR.value,
            betOnController: controller,
            betPlayType: BetPlayType.SUPER_TIE.value,
          ),
        ],
      ),
    );
  }

  /// 投注区域-luck6 老虎
  betOnTopLuck6TigerWidget() {
    return Container(
      padding: const EdgeInsets.only(
        top: 5,
        left: 8,
        right: 8,
      ),
      width: double.infinity,
      alignment: Alignment.topCenter,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _CustomPlayWidget(
            betPointId: BaccaratBetPointGroupType.DRAGON_TIGER_TIE.value,
            betOnController: controller,
            betPlayType: BetPlayType.LUCK_6_TIGER.value,
            isFirst: true,
          ),
          Container(
            margin: const EdgeInsets.only(
              top: 10,
            ),
            width: 0.6,
            height: 60,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.white.withOpacity(0.4),
                  Colors.transparent,
                ],
              ),
            ),
          ),
          _CustomPlayWidget(
            betPointId: BaccaratBetPointGroupType.BIG_TIGER.value,
            betOnController: controller,
            betPlayType: BetPlayType.LUCK_6_TIGER.value,
          ),
          Container(
            margin: const EdgeInsets.only(
              top: 10,
            ),
            width: 0.6,
            height: 60,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.white.withOpacity(0.4),
                  Colors.transparent,
                ],
              ),
            ),
          ),
          _CustomPlayWidget(
            betPointId: BaccaratBetPointGroupType.SUPER_SIX.value,
            betOnController: controller,
            betPlayType: BetPlayType.LUCK_6_TIGER.value,
          ),
          Container(
            margin: const EdgeInsets.only(
              top: 10,
            ),
            width: 0.6,
            height: 60,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.white.withOpacity(0.4),
                  Colors.transparent,
                ],
              ),
            ),
          ),
          _CustomPlayWidget(
            betPointId: BaccaratBetPointGroupType.SMALL_TIGER.value,
            betOnController: controller,
            betPlayType: BetPlayType.LUCK_6_TIGER.value,
          ),
          Container(
            margin: const EdgeInsets.only(
              top: 10,
            ),
            width: 0.6,
            height: 60,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.white.withOpacity(0.4),
                  Colors.transparent,
                ],
              ),
            ),
          ),
          _CustomPlayWidget(
            betPointId: BaccaratBetPointGroupType.TIGER_PAIR.value,
            betOnController: controller,
            betPlayType: BetPlayType.LUCK_6_TIGER.value,
          ),
        ],
      ),
    );
  }

  /// 投注区域-天牌
  betOnTopNaturalWidget() {
    return Container(
      padding: const EdgeInsets.only(
        top: 5,
        left: 8,
        right: 8,
      ),
      width: double.infinity,
      alignment: Alignment.topCenter,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _CustomPlayWidget(
            betPointId: BaccaratBetPointGroupType.PLAYER_NUMBER_PAIR.value,
            betOnController: controller,
            betPlayType: BetPlayType.NATURAL.value,
            isFirst: true,
          ),
          Container(
            margin: const EdgeInsets.only(
              top: 10,
            ),
            width: 0.6,
            height: 60,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.white.withOpacity(0.4),
                  Colors.transparent,
                ],
              ),
            ),
          ),
          _CustomPlayWidget(
            betPointId: BaccaratBetPointGroupType.PLAYER_SKY.value,
            betOnController: controller,
            betPlayType: BetPlayType.NATURAL.value,
          ),
          Container(
            margin: const EdgeInsets.only(
              top: 10,
            ),
            width: 0.6,
            height: 60,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.white.withOpacity(0.4),
                  Colors.transparent,
                ],
              ),
            ),
          ),
          _CustomPlayWidget(
            betPointId: BaccaratBetPointGroupType.SKY.value,
            betOnController: controller,
            betPlayType: BetPlayType.NATURAL.value,
          ),
          Container(
            margin: const EdgeInsets.only(
              top: 10,
            ),
            width: 0.6,
            height: 60,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.white.withOpacity(0.4),
                  Colors.transparent,
                ],
              ),
            ),
          ),
          _CustomPlayWidget(
            betPointId: BaccaratBetPointGroupType.BANKER_SKY.value,
            betOnController: controller,
            betPlayType: BetPlayType.NATURAL.value,
          ),
          Container(
            margin: const EdgeInsets.only(
              top: 10,
            ),
            width: 0.6,
            height: 60,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.white.withOpacity(0.4),
                  Colors.transparent,
                ],
              ),
            ),
          ),
          _CustomPlayWidget(
            betPointId: BaccaratBetPointGroupType.BANKER_NUMBER_PAIR.value,
            betOnController: controller,
            betPlayType: BetPlayType.NATURAL.value,
          ),
        ],
      ),
    );
  }

  /// 投注区域-龙和虎
  betOnTopDragonTigerWidget() {
    return Container(
      padding: const EdgeInsets.only(
        top: 5,
        left: 8,
        right: 8,
      ),
      width: double.infinity,
      alignment: Alignment.topCenter,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _CustomPlayWidget(
            betPointId: BaccaratBetPointGroupType.PLAYER_NUMBER_PAIR.value,
            betOnController: controller,
            betPlayType: BetPlayType.DRAGON_TIGER.value,
            isFirst: true,
          ),
          Container(
            margin: const EdgeInsets.only(
              top: 10,
            ),
            width: 0.6,
            height: 60,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.white.withOpacity(0.4),
                  Colors.transparent,
                ],
              ),
            ),
          ),
          _CustomPlayWidget(
            betPointId: BaccaratBetPointGroupType.TIGER.value,
            betOnController: controller,
            betPlayType: BetPlayType.DRAGON_TIGER.value,
          ),
          Container(
            margin: const EdgeInsets.only(
              top: 10,
            ),
            width: 0.6,
            height: 60,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.white.withOpacity(0.4),
                  Colors.transparent,
                ],
              ),
            ),
          ),
          _CustomPlayWidget(
            betPointId: BaccaratBetPointGroupType.DRAGON_TIGER_TIE.value,
            betOnController: controller,
            betPlayType: BetPlayType.DRAGON_TIGER.value,
          ),
          Container(
            margin: const EdgeInsets.only(
              top: 10,
            ),
            width: 0.6,
            height: 60,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.white.withOpacity(0.4),
                  Colors.transparent,
                ],
              ),
            ),
          ),
          _CustomPlayWidget(
            betPointId: BaccaratBetPointGroupType.DRAGON.value,
            betOnController: controller,
            betPlayType: BetPlayType.DRAGON_TIGER.value,
          ),
          Container(
            margin: const EdgeInsets.only(
              top: 10,
            ),
            width: 0.6,
            height: 60,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.white.withOpacity(0.4),
                  Colors.transparent,
                ],
              ),
            ),
          ),
          _CustomPlayWidget(
            betPointId: BaccaratBetPointGroupType.BANKER_NUMBER_PAIR.value,
            betOnController: controller,
            betPlayType: BetPlayType.DRAGON_TIGER.value,
          ),
        ],
      ),
    );
  }

  /// 投注区域-大小
  betOnTopBigSmallWidget() {
    return Container(
      padding: const EdgeInsets.only(
        top: 5,
        left: 8,
        right: 8,
      ),
      width: double.infinity,
      alignment: Alignment.topCenter,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _CustomPlayWidget(
            betPointId: BaccaratBetPointGroupType.PLAYER_NUMBER_PAIR.value,
            betOnController: controller,
            betPlayType: BetPlayType.BIG_SMALL.value,
            isFirst: true,
          ),
          Container(
            margin: const EdgeInsets.only(
              top: 10,
            ),
            width: 0.6,
            height: 60,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.white.withOpacity(0.4),
                  Colors.transparent,
                ],
              ),
            ),
          ),
          _CustomPlayWidget(
            betPointId: BaccaratBetPointGroupType.SMALL.value,
            betOnController: controller,
            betPlayType: BetPlayType.BIG_SMALL.value,
          ),
          Container(
            margin: const EdgeInsets.only(
              top: 10,
            ),
            width: 0.6,
            height: 60,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.white.withOpacity(0.4),
                  Colors.transparent,
                ],
              ),
            ),
          ),
          _CustomPlayWidget(
            betPointId: BaccaratBetPointGroupType.BIG.value,
            betOnController: controller,
            betPlayType: BetPlayType.BIG_SMALL.value,
          ),
          Container(
            margin: const EdgeInsets.only(
              top: 10,
            ),
            width: 0.6,
            height: 60,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.white.withOpacity(0.4),
                  Colors.transparent,
                ],
              ),
            ),
          ),
          _CustomPlayWidget(
            betPointId: BaccaratBetPointGroupType.BANKER_NUMBER_PAIR.value,
            betOnController: controller,
            betPlayType: BetPlayType.BIG_SMALL.value,
          ),
        ],
      ),
    );
  }


  /// 投注区域-超和-展开
  betOnTopSuperTieOpenWidget() {
    return Container(
      padding: EdgeInsets.only(
        top: 7.w,
        left: 8,
        right: 8,
      ),
      width: double.infinity,
      alignment: Alignment.topCenter,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
            width: 30.w,
            height: 70.w,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(R.playSuperTieLeft),
                fit: BoxFit.fill,
              ),
            ),
            child: GestureDetector(
                onTap: controller.onTapSuperTieClose,
                child: Container(
                  width: 14.w,
                  height: 14.w,
                  alignment: Alignment.center,
                  // 内容居中对齐
                  child: Image.asset(R.playSuperTieClear),
                ),
              ),
            ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _SuperTieItemWidget(
                      betPointId: BaccaratBetPointGroupType.SUPER_TIE_ZERO.value,
                      betOnController: controller,
                    ),
                    _SuperTieItemWidget(
                      betPointId: BaccaratBetPointGroupType.SUPER_TIE_ONE.value,
                      betOnController: controller,
                    ),
                    _SuperTieItemWidget(
                      betPointId: BaccaratBetPointGroupType.SUPER_TIE_TWO.value,
                      betOnController: controller,
                    ),
                    _SuperTieItemWidget(
                      betPointId: BaccaratBetPointGroupType.SUPER_TIE_THREE.value,
                      betOnController: controller,
                    ),
                    _SuperTieItemWidget(
                      betPointId: BaccaratBetPointGroupType.SUPER_TIE_FOUR.value,
                      betOnController: controller,
                    ),
                  ],
                ),
                Container(
                  width: ScreenUtil().screenWidth-105.w,
                  height: 0.6,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Colors.transparent,
                        Colors.white.withOpacity(0.2),
                        Colors.white.withOpacity(0.4),
                        Colors.white.withOpacity(0.2),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _SuperTieItemWidget(
                      betPointId: BaccaratBetPointGroupType.SUPER_TIE_FIVE.value,
                      betOnController: controller,
                    ),
                    _SuperTieItemWidget(
                      betPointId: BaccaratBetPointGroupType.SUPER_TIE_SIX.value,
                      betOnController: controller,
                    ),
                    _SuperTieItemWidget(
                      betPointId: BaccaratBetPointGroupType.SUPER_TIE_SEVEN.value,
                      betOnController: controller,
                    ),
                    _SuperTieItemWidget(
                      betPointId: BaccaratBetPointGroupType.SUPER_TIE_EIGHT.value,
                      betOnController: controller,
                    ),
                    _SuperTieItemWidget(
                      betPointId: BaccaratBetPointGroupType.SUPER_TIE_NINE.value,
                      betOnController: controller,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.topCenter,
            width: 30.w,
            height: 70.w,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(R.playSuperTieRight),
                fit: BoxFit.fill,
              ),
            ),
            child: GestureDetector(
              onTap: controller.onTapSuperTieAllIn,
              child: Container(
                alignment: Alignment.center,
                // 内容居中对齐
                child:  Text(
                  'bet_allin'.tr,
                  textAlign: TextAlign.center,
                  style:
                  TextStyle(fontSize: 10.sp, color: Colors.white.withOpacity(0.7)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// 投注区域-闲和庄
  betOnBottomWidget() {
    return Container(
      padding: const EdgeInsets.only(
        left: 8,
        right: 8,
      ),
      width: double.infinity,
      height: double.infinity,
      alignment: Alignment.bottomCenter,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(controller.profitBetPointDTOSMapObs
                  .containsKey(BaccaratBetPointGroupType.TIE.value)
              ? R.playBottomBgRebateCn
              : R.playBetOnBottomBg),
          fit: BoxFit.fill,
        ),
      ),
      child: Row(
        children: [
          _CustomPlayWidget2(
            betPointId: BaccaratBetPointGroupType.PLAYER.value,
            betOnController: controller,
          ),
          _CustomPlayWidget2(
            betPointId: BaccaratBetPointGroupType.TIE.value,
            betOnController: controller,
          ),
          _CustomPlayWidget2(
            betPointId: BaccaratBetPointGroupType.BANKER.value,
            betOnController: controller,
          ),
        ],
      ),
    );
  }
}

class _CustomPlayWidget extends StatelessWidget {
  final int betPointId;
  final BetOnController betOnController;
  final int betPlayType;
  final bool isFirst;

  const _CustomPlayWidget({
    super.key,
    required this.betPointId,
    required this.betOnController,
    required this.betPlayType,
    this.isFirst = false,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          betOnController.onTapBetOn(betPointId);
        },
        child: Stack(
          children: [
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Gaps.gh(12),
                  Text(PlayAdapter.getTextContent(betPointId),
                      style: PlayAdapter.getTextStyle(
                          betPlayType, betPointId, true)),
                  Gaps.gh(2),
                  Text(
                      betOnController.mTableBootNumberLimitMapObs[betPointId]
                              ?.playRate ??
                          "0:0",
                      style: PlayAdapter.getTextStyle(
                          betPlayType, betPointId, false)),
                  Gaps.gh(4),
                  Row(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 10.w,
                        height: 10.w,
                        alignment: Alignment.center,
                        child: Image.asset(R.playIconPlayPlayer),
                      ),
                      Gaps.gw(2),
                      Text(
                          "${betOnController.tableBetPointDetailMapObs.containsKey(betPointId) ? betOnController.tableBetPointDetailMapObs[betPointId]?.player ?? 0 : 0}",
                          style: TextStyle(
                              fontSize: 10.sp, color: Color(0xFFFFFFFF))),
                      Gaps.gw(10),
                      Container(
                        width: 10.w,
                        height: 10.w,
                        alignment: Alignment.center,
                        child: Image.asset(R.playIconPlayAmount),
                      ),
                      Gaps.gw(2),
                      Text(
                          "${betOnController.tableBetPointDetailMapObs.containsKey(betPointId) ? betOnController.tableBetPointDetailMapObs[betPointId]?.amount ?? 0 : 0}",
                          style: TextStyle(
                              fontSize: 10.sp, color: Color(0xFFFFFFFF))),
                    ],
                  )
                ],
              ),
            ),
            Positioned(
                top: 5.w,
                right: 8.w,
                child: GestureDetector(
                  onTap: betOnController.onTapBetHelp,
                  child: Container(
                    width: 10.w,
                    height: 10.w,
                    alignment: Alignment.center,
                    // 内容居中对齐
                    child: Image.asset(R.playIconPlayHelp),
                  ),
                )),
            if (betOnController.tableBetPointDetailMapObs
                .containsKey(betPointId))
              Positioned(
                top: 5.w,
                child: ThemeImage(
                  width: 25.w,
                  height: 25.w,
                  isFirst ? R.playIconRebateRCn : R.playIconRebateCn,
                ),
              ),
          ],
        ),
      ),
    );
  }
}


class _CustomPlayWidget2 extends StatelessWidget {
  final int betPointId;
  final BetOnController betOnController;

  const _CustomPlayWidget2({
    super.key,
    required this.betPointId,
    required this.betOnController,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          betOnController.onTapBetOn(betPointId);
        },
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(PlayAdapter.getTextContent(betPointId),
                  style: PlayAdapter.getBottomTextStyle(betPointId, true)),
              // Gaps.gh(1),
              Text(
                  betOnController
                          .mTableBootNumberLimitMapObs[betPointId]?.playRate ??
                      "0:0",
                  style: PlayAdapter.getBottomTextStyle(betPointId, false)),
              Gaps.gh(5),
              Container(
                // betOnBottomTotalAmount 50
                width: getAmountRatio(betPointId),
                height: 2.w,
                decoration: BoxDecoration(
                  gradient: PlayAdapter.getGradient(betPointId),
                ),
              ),
              Gaps.gh(5),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 10.w, // 给Container设置宽度
                    height: 10.w, // 给Container设置高度
                    alignment: Alignment.center, // 内容居中对齐
                    child:
                        Image.asset(R.playIconPlayPlayer), // Text可设置为需要的内容或占位符
                  ),
                  Gaps.gw(2),
                  Text(
                      "${betOnController.tableBetPointDetailMapObs.containsKey(betPointId) ? betOnController.tableBetPointDetailMapObs[betPointId]?.player ?? 0 : 0}",
                      style:
                          TextStyle(fontSize: 10.sp, color: Color(0xFFFFFFFF))),
                  Gaps.gw(10),
                  Container(
                    // color: Colors.red,// 背景颜色
                    width: 10.w, // 给Container设置宽度
                    height: 10.w, // 给Container设置高度
                    alignment: Alignment.center, // 内容居中对齐
                    child:
                        Image.asset(R.playIconPlayAmount), // Text可设置为需要的内容或占位符
                  ),
                  Gaps.gw(2),
                  Text(
                      "${betOnController.tableBetPointDetailMapObs.containsKey(betPointId) ? betOnController.tableBetPointDetailMapObs[betPointId]?.amount ?? 0 : 0}",
                      style:
                          TextStyle(fontSize: 10.sp, color: Color(0xFFFFFFFF))),
                ],
              ),
              Gaps.gh(16),
            ],
          ),
        ),
      ),
    );
  }

  double getAmountRatio(int betPointId) {
    if (!betOnController.tableBetPointDetailMapObs.containsKey(betPointId) ||
        0 == betOnController.betOnBottomTotalAmount) {
      return 2;
    }
    var amount =
        betOnController.tableBetPointDetailMapObs[betPointId]?.amount ?? 0;
    if (0 == amount) {
      return 2;
    }

    var d = amount / betOnController.betOnBottomTotalAmount;

    return 50 * d;
  }
}

/// 超和单独处理
class _CustomPlayTieWidget extends StatelessWidget {
  final int betPointId;
  final BetOnController betOnController;
  final int betPlayType;
  final bool isFirst;

  const _CustomPlayTieWidget({
    super.key,
    required this.betPointId,
    required this.betOnController,
    required this.betPlayType,
    this.isFirst = false,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          betOnController.onTapBetOn(betPointId);
        },
        child: Stack(
          children: [
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Gaps.gh(12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(PlayAdapter.getTextContent(betPointId),
                          style: PlayAdapter.getTextStyle(
                              betPlayType, betPointId, true)),
                      Gaps.gw(2),
                      GestureDetector(
                        onTap: betOnController.onTapSuperTie,
                        child: Container(
                          width: 10.w,
                          height: 10.w,
                          alignment: Alignment.center,
                          // 内容居中对齐
                          child: Image.asset(
                              betOnController.isSuperTieOpenObs.value
                                  ? R.playSuperTieOpen
                                  : R.playSuperTieClose),
                        ),
                      ),
                    ],
                  ),
                  Gaps.gh(2),
                  Text(
                      betOnController.mTableBootNumberLimitMapObs[betPointId]
                              ?.playRate ??
                          "0:0",
                      style: PlayAdapter.getTextStyle(
                          betPlayType, betPointId, false)),
                  Gaps.gh(4),
                  Row(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 10.w,
                        height: 10.w,
                        alignment: Alignment.center,
                        child: Image.asset(R.playIconPlayPlayer),
                      ),
                      Gaps.gw(2),
                      Text(
                          "${betOnController.tableBetPointDetailMapObs.containsKey(betPointId) ? betOnController.tableBetPointDetailMapObs[betPointId]?.player ?? 0 : 0}",
                          style: TextStyle(
                              fontSize: 10.sp, color: Color(0xFFFFFFFF))),
                      Gaps.gw(10),
                      Container(
                        width: 10.w,
                        height: 10.w,
                        alignment: Alignment.center,
                        child: Image.asset(R.playIconPlayAmount),
                      ),
                      Gaps.gw(2),
                      Text(
                          "${betOnController.tableBetPointDetailMapObs.containsKey(betPointId) ? betOnController.tableBetPointDetailMapObs[betPointId]?.amount ?? 0 : 0}",
                          style: TextStyle(
                              fontSize: 10.sp, color: Color(0xFFFFFFFF))),
                    ],
                  )
                ],
              ),
            ),
            Positioned(
                top: 5.w,
                right: 8.w,
                child: GestureDetector(
                  onTap: betOnController.onTapBetHelp,
                  child: Container(
                    width: 10.w,
                    height: 10.w,
                    alignment: Alignment.center,
                    // 内容居中对齐
                    child: Image.asset(R.playIconPlayHelp),
                  ),
                )),
            if (betOnController.tableBetPointDetailMapObs
                .containsKey(betPointId))
              Positioned(
                top: 5.w,
                child: ThemeImage(
                  width: 25.w,
                  height: 25.w,
                  isFirst ? R.playIconRebateRCn : R.playIconRebateCn,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _SuperTieItemWidget extends StatelessWidget {
  final int betPointId;
  final BetOnController betOnController;

  const _SuperTieItemWidget({
    super.key,
    required this.betPointId,
    required this.betOnController,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          betOnController.onTapBetOn(betPointId);
        },
        child: Column(
          children: [
            Gaps.gh(5),
            Text(PlayAdapter.getTextContent(betPointId),
                style: TextStyle(
                    fontFamily: 'BetPlay',
                    fontSize: 9.sp,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFFC0F4CB))),
            // Gaps.gh(2),
            Text(
                betOnController
                        .mTableBootNumberLimitMapObs[betPointId]?.playRate ??
                    "0:0",
                style: TextStyle(
                    fontFamily: 'BetPlay',
                    fontSize: 8.sp,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFFA8DAB3))),
          ],
        ),
      ),
    );
  }
}
