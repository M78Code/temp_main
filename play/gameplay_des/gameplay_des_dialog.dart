import 'package:flutter/material.dart';
import 'package:flutter_main/configs/app_colors.dart';
import 'package:flutter_main/controllers/global_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

import '../../../configs/app_style.dart';
import '../../../generated/r.dart';
import 'dart:math' as math;

import '../../../utils/Commond/Data/GameEnum.dart';

// 百家乐玩法说明
class GamePlayDesDialog extends StatelessWidget {
  static void show({int betPointId = 1}) async {
    SmartDialog.show(
        builder: (context) {
          return GamePlayDesDialog(betPointId: betPointId);
        },
        alignment: Alignment.bottomCenter,
        keepSingle: true);
  }

  final int betPointId;

  GamePlayDesDialog({
    super.key,
    required this.betPointId,
  });

  final bool isDark = GlobalController.controller.isDark;
  String _title = '';

  getWidgetList() {
    List<Widget> list = [];
    // 闲对
    if (betPointId == BaccaratBetPointGroupType.PLAYER_NUMBER_PAIR.value) {
      _title = 'game_result95'.tr;
      list = [
        buildItem(
          des: 'gameplay_des_sd'.tr,
          zCard1: isDark ? R.diamondsBlack10 : R.diamondsNormal10,
          zCard2: isDark ? R.heartsBlack1 : R.heartsNormal1,
          zCard3: isDark ? R.diamondsBlack8 : R.diamondsNormal8,
          zIsH: true,
          zIsSum: false,
          xCard1: isDark ? R.diamondsBlack2 : R.diamondsNormal2,
          xCard2: isDark ? R.heartsBlack2 : R.heartsNormal2,
          xCard3: isDark ? R.diamondsBlack7 : R.diamondsNormal7,
          xIsH: true,
          xIsSum: false,
        ),
      ];
    }
    // 庄对
    if (betPointId == BaccaratBetPointGroupType.BANKER_NUMBER_PAIR.value) {
      _title = 'game_result96'.tr;
      list = [
        buildItem(
          des: 'gameplay_des_zd'.tr,
          zCard1: isDark ? R.diamondsBlack10 : R.diamondsNormal10,
          zCard2: isDark ? R.heartsBlack10 : R.heartsNormal10,
          zCard3: isDark ? R.diamondsBlack8 : R.diamondsNormal8,
          zIsH: true,
          zIsSum: false,
          xCard1: isDark ? R.diamondsBlack10 : R.diamondsNormal10,
          xCard2: isDark ? R.heartsBlack1 : R.heartsNormal1,
          xCard3: isDark ? R.diamondsBlack8 : R.diamondsNormal8,
          xIsH: true,
          xIsSum: false,
        ),
      ];
    }
    // 幸运7
    if (betPointId == BaccaratBetPointGroupType.LUCKY_SEVEN.value) {
      _title = 'game_result109'.tr;
      list = [
        buildItem(
          des: 'gameplay_des_xy7_1'.tr,
          zCard1: isDark ? R.diamondsBlack2 : R.diamondsNormal2,
          zCard2: isDark ? R.heartsBlack10 : R.heartsNormal10,
          zCard3: isDark ? R.diamondsBlack1 : R.diamondsNormal1,
          zSum: '3',
          xCard1: isDark ? R.diamondsBlack6 : R.diamondsNormal6,
          xCard2: isDark ? R.heartsBlack1 : R.heartsNormal1,
          xSum: '7',
        ),
        12.verticalSpace,
        buildItem(
          des: 'gameplay_des_xy7_2'.tr,
          zCard1: isDark ? R.diamondsBlack2 : R.diamondsNormal2,
          zCard2: isDark ? R.heartsBlack1 : R.heartsNormal1,
          zCard3: isDark ? R.diamondsBlack2 : R.diamondsNormal2,
          zSum: '5',
          xCard1: isDark ? R.diamondsBlack5 : R.diamondsNormal5,
          xCard2: isDark ? R.heartsBlack10 : R.heartsNormal10,
          xCard3: isDark ? R.diamondsBlack2 : R.diamondsNormal2,
          xSum: '7',
        ),
        12.verticalSpace,
      ];
    }
    // 超级幸运7
    if (betPointId == BaccaratBetPointGroupType.SUPER_LUCKY_SEVEN.value) {
      _title = 'game_result110'.tr;
      list = [
        buildItem(
          des: 'gameplay_des_cjxy7_1'.tr,
          zCard1: isDark ? R.diamondsBlack10 : R.diamondsNormal10,
          zCard2: isDark ? R.heartsBlack6 : R.heartsNormal6,
          zSum: '6',
          xCard1: isDark ? R.diamondsBlack7 : R.diamondsNormal7,
          xCard2: isDark ? R.heartsBlack10 : R.heartsNormal10,
          xSum: '7',
        ),
        12.verticalSpace,
        buildItem(
          des: 'gameplay_des_cjxy7_2'.tr,
          zCard1: isDark ? R.diamondsBlack10 : R.diamondsNormal10,
          zCard2: isDark ? R.heartsBlack6 : R.heartsNormal6,
          zSum: '6',
          xCard1: isDark ? R.diamondsBlack5 : R.diamondsNormal5,
          xCard2: isDark ? R.heartsBlack10 : R.heartsNormal10,
          xCard3: isDark ? R.diamondsBlack2 : R.diamondsNormal2,
          xSum: '7',
        ),
        12.verticalSpace,
        buildItem(
          des: 'gameplay_des_cjxy7_3'.tr,
          zCard1: isDark ? R.diamondsBlack1 : R.diamondsNormal1,
          zCard2: isDark ? R.heartsBlack2 : R.heartsNormal2,
          zCard3: isDark ? R.diamondsBlack3 : R.diamondsNormal3,
          zSum: '6',
          xCard1: isDark ? R.diamondsBlack5 : R.diamondsNormal5,
          xCard2: isDark ? R.heartsBlack10 : R.heartsNormal10,
          xCard3: isDark ? R.diamondsBlack2 : R.diamondsNormal2,
          xSum: '7',
        ),
        12.verticalSpace,
      ];
    }
    // 幸运6
    if (betPointId == BaccaratBetPointGroupType.SUPER_SIX.value) {
      _title = 'game_result108'.tr;
      list = [
        buildItem(
          des: 'gameplay_des_xy6_1'.tr,
          zCard1: isDark ? R.diamondsBlack10 : R.diamondsNormal10,
          zCard2: isDark ? R.heartsBlack6 : R.heartsNormal6,
          zSum: '6',
          xCard1: isDark ? R.diamondsBlack2 : R.diamondsNormal2,
          xCard2: isDark ? R.heartsBlack10 : R.heartsNormal10,
          xCard3: isDark ? R.heartsBlack1 : R.heartsNormal1,
          xSum: '3',
        ),
        12.verticalSpace,
        buildItem(
          des: 'gameplay_des_xy6_2'.tr,
          zCard1: isDark ? R.diamondsBlack2 : R.diamondsNormal2,
          zCard2: isDark ? R.heartsBlack1 : R.heartsNormal1,
          zCard3: isDark ? R.diamondsBlack3 : R.diamondsNormal3,
          zSum: '6',
          xCard1: isDark ? R.diamondsBlack2 : R.diamondsNormal2,
          xCard2: isDark ? R.heartsBlack10 : R.heartsNormal10,
          xCard3: isDark ? R.diamondsBlack1 : R.diamondsNormal1,
          xSum: '3',
        ),
        12.verticalSpace,
      ];
    }
    // 闲龙宝
    if (betPointId == BaccaratBetPointGroupType.PLAYER_DRAGON.value) {
      _title = 'game_result80'.tr;
      list = [
        buildItem(
          des: 'gameplay_des_xlb_1'.tr,
          zCard1: isDark ? R.diamondsBlack2 : R.diamondsNormal2,
          zCard2: isDark ? R.diamondsBlack10 : R.diamondsNormal10,
          zSum: '2',
          xCard1: isDark ? R.diamondsBlack10 : R.diamondsNormal10,
          xCard2: isDark ? R.diamondsBlack8 : R.diamondsNormal8,
          xSum: '8',
        ),
        12.verticalSpace,
        buildItem(
          des: 'gameplay_des_xlb_2'.tr,
          zCard1: isDark ? R.diamondsBlack1 : R.diamondsNormal1,
          zCard2: isDark ? R.heartsBlack10 : R.heartsNormal10,
          zCard3: isDark ? R.diamondsBlack1 : R.diamondsNormal1,
          zSum: '2',
          xCard1: isDark ? R.diamondsBlack1 : R.diamondsNormal1,
          xCard2: isDark ? R.heartsBlack10 : R.heartsNormal10,
          xCard3: isDark ? R.diamondsBlack5 : R.diamondsNormal5,
          xSum: '6',
        ),
        12.verticalSpace,
      ];
    }
    // 庄龙宝
    if (betPointId == BaccaratBetPointGroupType.BANKER_DRAGON.value) {
      _title = 'game_result81'.tr;
      list = [
        buildItem(
          des: 'gameplay_des_zlb_1'.tr,
          zCard1: isDark ? R.diamondsBlack10 : R.diamondsNormal10,
          zCard2: isDark ? R.diamondsBlack9 : R.diamondsNormal9,
          zSum: '9',
          xCard1: isDark ? R.diamondsBlack2 : R.diamondsNormal2,
          xCard2: isDark ? R.diamondsBlack10 : R.diamondsNormal10,
          xSum: '2',
        ),
        12.verticalSpace,
        buildItem(
          des: 'gameplay_des_zlb_2'.tr,
          zCard1: isDark ? R.diamondsBlack3 : R.diamondsNormal3,
          zCard2: isDark ? R.heartsBlack1 : R.heartsNormal1,
          zCard3: isDark ? R.diamondsBlack5 : R.diamondsNormal5,
          zSum: '9',
          xCard1: isDark ? R.diamondsBlack2 : R.diamondsNormal2,
          xCard2: isDark ? R.heartsBlack10 : R.heartsNormal10,
          xCard3: isDark ? R.diamondsBlack3 : R.diamondsNormal3,
          xSum: '5',
        ),
        12.verticalSpace,
      ];
    }
    // 任意对子
    if (betPointId == BaccaratBetPointGroupType.ANY_NUMBER_PAIR.value) {
      _title = 'game_result83'.tr;
      list = [
        buildItem(
          des: 'gameplay_des_rydz'.tr,
          zCard1: isDark ? R.diamondsBlack10 : R.diamondsNormal10,
          zCard2: isDark ? R.heartsBlack10 : R.heartsNormal10,
          zCard3: isDark ? R.diamondsBlack8 : R.diamondsNormal8,
          zIsH: true,
          zIsSum: false,
          xCard1: isDark ? R.diamondsBlack2 : R.diamondsNormal2,
          xCard2: isDark ? R.heartsBlack2 : R.heartsNormal2,
          xCard3: isDark ? R.diamondsBlack7 : R.diamondsNormal7,
          xIsH: true,
          xIsSum: false,
        ),
      ];
    }
    // 完美对子
    if (betPointId == BaccaratBetPointGroupType.ALL_PAIR.value) {
      _title = 'game_result84'.tr;
      list = [
        buildItem(
          des: 'gameplay_des_wmdz'.tr,
          zCard1: isDark ? R.diamondsBlack10 : R.diamondsNormal10,
          zCard2: isDark ? R.heartsBlack1 : R.heartsNormal1,
          zCard3: isDark ? R.diamondsBlack8 : R.diamondsNormal8,
          zIsH: true,
          zIsSum: false,
          xCard1: isDark ? R.diamondsBlack2 : R.diamondsNormal2,
          xCard2: isDark ? R.heartsBlack2 : R.heartsNormal2,
          xCard3: isDark ? R.diamondsBlack7 : R.diamondsNormal7,
          xIsH: true,
          xIsSum: false,
        ),
      ];
    }
    // 超级对
    if (betPointId == BaccaratBetPointGroupType.SUPER_PAIR.value) {
      _title = 'game_result82'.tr;
      list = [
        buildItem(
          des: 'gameplay_des_cjdz'.tr,
          zCard1: isDark ? R.diamondsBlack10 : R.diamondsNormal10,
          zCard2: isDark ? R.heartsBlack10 : R.heartsNormal10,
          zCard3: isDark ? R.diamondsBlack8 : R.diamondsNormal8,
          zIsH: true,
          zIsSum: false,
          xCard1: isDark ? R.diamondsBlack3 : R.diamondsNormal3,
          xCard2: isDark ? R.heartsBlack2 : R.heartsNormal2,
          xCard3: isDark ? R.diamondsBlack7 : R.diamondsNormal7,
          xIsH: true,
          xIsSum: false,
        ),
      ];
    }
    // 熊猫8
    if (betPointId == BaccaratBetPointGroupType.PANDA_EIGHT.value) {
      _title = 'game_result88'.tr;
      list = [
        buildItem(
          des: 'gameplay_des_xm8'.tr,
          zCard1: isDark ? R.diamondsBlack10 : R.diamondsNormal10,
          zCard2: isDark ? R.heartsBlack10 : R.heartsNormal10,
          zCard3: isDark ? R.diamondsBlack7 : R.diamondsNormal7,
          zSum: '7',
          xCard1: isDark ? R.diamondsBlack2 : R.diamondsNormal2,
          xCard2: isDark ? R.heartsBlack2 : R.heartsNormal2,
          xCard3: isDark ? R.diamondsBlack4 : R.diamondsNormal4,
          xSum: '8',
        ),
      ];
    }
    // 超和
    if (betPointId == -1) {
      _title = 'game_result91'.tr;
      list = [
        buildItem(
          des: 'gameplay_des_ch'.tr,
          zCard1: isDark ? R.diamondsBlack1 : R.diamondsNormal1,
          zCard2: isDark ? R.heartsBlack1 : R.heartsNormal1,
          zCard3: isDark ? R.diamondsBlack8 : R.diamondsNormal8,
          zSum: '0',
          xCard1: isDark ? R.diamondsBlack1 : R.diamondsNormal1,
          xCard2: isDark ? R.heartsBlack10 : R.heartsNormal10,
          xCard3: isDark ? R.diamondsBlack9 : R.diamondsNormal9,
          xSum: '0',
          liru: 'such_as_ch'.tr,
        ),
      ];
    }
    // 龙7
    if (betPointId == BaccaratBetPointGroupType.DRAGON_SEVEN.value) {
      _title = 'game_result87'.tr;
      list = [
        buildItem(
          des: 'gameplay_des_l7'.tr,
          zCard1: isDark ? R.diamondsBlack10 : R.diamondsNormal10,
          zCard2: isDark ? R.heartsBlack10 : R.heartsNormal10,
          zCard3: isDark ? R.diamondsBlack7 : R.diamondsNormal7,
          zSum: '7',
          xCard1: isDark ? R.diamondsBlack2 : R.diamondsNormal2,
          xCard2: isDark ? R.heartsBlack2 : R.heartsNormal2,
          xCard3: isDark ? R.diamondsBlack10 : R.diamondsNormal10,
          xSum: '4',
        ),
      ];
    }
    // 老虎和
    if (betPointId == BaccaratBetPointGroupType.TIGER_TIE.value) {
      _title = 'game_result92'.tr;
      list = [
        buildItem(
          des: 'gameplay_des_lhh'.tr,
          zCard1: isDark ? R.diamondsBlack1 : R.diamondsNormal1,
          zCard2: isDark ? R.heartsBlack10 : R.heartsNormal10,
          zCard3: isDark ? R.diamondsBlack5 : R.diamondsNormal5,
          zSum: '6',
          xCard1: isDark ? R.diamondsBlack2 : R.diamondsNormal2,
          xCard2: isDark ? R.heartsBlack1 : R.heartsNormal1,
          xCard3: isDark ? R.diamondsBlack3 : R.diamondsNormal3,
          xSum: '6',
        ),
      ];
    }
    // 大老虎
    if (betPointId == BaccaratBetPointGroupType.BIG_TIGER.value) {
      _title = 'game_result89'.tr;
      list = [
        buildItem(
          des: 'gameplay_des_dlh'.tr,
          zCard1: isDark ? R.diamondsBlack10 : R.diamondsNormal10,
          zCard2: isDark ? R.heartsBlack1 : R.heartsNormal1,
          zCard3: isDark ? R.diamondsBlack5 : R.diamondsNormal5,
          zSum: '6',
          xCard1: isDark ? R.diamondsBlack2 : R.diamondsNormal2,
          xCard2: isDark ? R.heartsBlack1 : R.heartsNormal1,
          xCard3: isDark ? R.diamondsBlack1 : R.diamondsNormal1,
          xSum: '4',
        ),
      ];
    }
    // 小老虎
    if (betPointId == BaccaratBetPointGroupType.SMALL_TIGER.value) {
      _title = 'game_result90'.tr;
      list = [
        buildItem(
          des: 'gameplay_des_xlh'.tr,
          zCard1: isDark ? R.diamondsBlack10 : R.diamondsNormal10,
          zCard2: isDark ? R.heartsBlack6 : R.heartsNormal6,
          zSum: '6',
          xCard1: isDark ? R.diamondsBlack2 : R.diamondsNormal2,
          xCard2: isDark ? R.heartsBlack1 : R.heartsNormal1,
          xCard3: isDark ? R.diamondsBlack1 : R.diamondsNormal1,
          xSum: '4',
        ),
      ];
    }
    // 老虎对
    if (betPointId == BaccaratBetPointGroupType.TIGER_PAIR.value) {
      _title = 'game_result93'.tr;
      list = [
        buildItem(
          des: 'gameplay_des_lhd_1'.tr,
          zCard1: isDark ? R.diamondsBlack10 : R.diamondsNormal10,
          zCard2: isDark ? R.diamondsBlack10 : R.diamondsBlack10,
          zCard3: isDark ? R.diamondsBlack8 : R.diamondsNormal8,
          zIsH: true,
          zIsSum: false,
          xCard1: isDark ? R.diamondsBlack10 : R.diamondsNormal10,
          xCard2: isDark ? R.diamondsBlack10 : R.diamondsBlack10,
          xCard3: isDark ? R.diamondsBlack7 : R.diamondsNormal7,
          xIsH: true,
          xIsSum: false,
        ),
        12.verticalSpace,
        buildItem(
          des: 'gameplay_des_lhd_2'.tr,
          zCard1: isDark ? R.diamondsBlack10 : R.diamondsNormal10,
          zCard2: isDark ? R.heartsBlack10 : R.heartsNormal10,
          zCard3: isDark ? R.diamondsBlack8 : R.diamondsNormal8,
          zIsH: true,
          zIsSum: false,
          xCard1: isDark ? R.diamondsBlack2 : R.diamondsNormal2,
          xCard2: isDark ? R.heartsBlack2 : R.heartsNormal2,
          xCard3: isDark ? R.diamondsBlack7 : R.diamondsNormal7,
          xIsH: true,
          xIsSum: false,
        ),
        12.verticalSpace,
        buildItem(
          des: 'gameplay_des_lhd_3'.tr,
          zCard1: isDark ? R.diamondsBlack10 : R.diamondsNormal10,
          zCard2: isDark ? R.heartsBlack1 : R.heartsNormal1,
          zCard3: isDark ? R.diamondsBlack8 : R.diamondsNormal8,
          zIsH: true,
          zIsSum: false,
          xCard1: isDark ? R.diamondsBlack2 : R.diamondsNormal2,
          xCard2: isDark ? R.heartsBlack2 : R.heartsNormal2,
          xCard3: isDark ? R.diamondsBlack7 : R.diamondsNormal7,
          xIsH: true,
          xIsSum: false,
        ),
        12.verticalSpace,
      ];
    }
    // 闲天牌
    if (betPointId == BaccaratBetPointGroupType.PLAYER_SKY.value) {
      _title = 'game_result115'.tr;
      list = [
        buildItem(
          des: 'gameplay_des_xtp'.tr,
          zCard1: isDark ? R.diamondsBlack10 : R.diamondsNormal10,
          zCard2: isDark ? R.heartsBlack7 : R.heartsNormal7,
          zSum: '7',
          xCard1: isDark ? R.diamondsBlack9 : R.diamondsNormal9,
          xCard2: isDark ? R.heartsBlack10 : R.heartsNormal10,
          xSum: '9',
        ),
      ];
    }
    // 天牌
    if (betPointId == BaccaratBetPointGroupType.SKY.value) {
      _title = 'game_result116'.tr;
      list = [
        buildItem(
          des: 'gameplay_des_tp'.tr,
          zCard1: isDark ? R.diamondsBlack10 : R.diamondsNormal10,
          zCard2: isDark ? R.diamondsBlack8 : R.diamondsNormal8,
          zSum: '8',
          xCard1: isDark ? R.diamondsBlack8 : R.diamondsNormal8,
          xCard2: isDark ? R.diamondsBlack10 : R.diamondsNormal10,
          xSum: '8',
        ),
      ];
    }
    // 庄天牌
    if (betPointId == BaccaratBetPointGroupType.BANKER_SKY.value) {
      _title = 'game_result114'.tr;
      list = [
        buildItem(
          des: 'gameplay_des_ztp'.tr,
          zCard1: isDark ? R.diamondsBlack10 : R.diamondsNormal10,
          zCard2: isDark ? R.diamondsBlack8 : R.diamondsNormal8,
          zSum: '7',
          xCard1: isDark ? R.diamondsBlack7 : R.diamondsNormal7,
          xCard2: isDark ? R.diamondsBlack10 : R.diamondsNormal10,
          xSum: '9',
        ),
      ];
    }
    // 虎
    if (betPointId == BaccaratBetPointGroupType.TIGER.value) {
      _title = 'game_result70'.tr;
      list = [
        buildItem(
          des: 'gameplay_des_hu'.tr,
          zCard1: isDark ? R.diamondsBlack2 : R.diamondsNormal2,
          zCard2: isDark ? R.heartsBlack1 : R.heartsNormal1,
          zCard3: isDark ? R.diamondsBlack8 : R.diamondsNormal8,
          zIsH: true,
          zIsSum: false,
          xCard1: isDark ? R.diamondsBlack3 : R.diamondsNormal3,
          xCard2: isDark ? R.diamondsBlack10 : R.diamondsNormal10,
          xCard3: isDark ? R.diamondsBlack4 : R.diamondsNormal4,
          xIsH: true,
          xIsSum: false,
        ),
      ];
    }
    // 龙虎和
    if (betPointId == BaccaratBetPointGroupType.DRAGON_TIGER_TIE.value) {
      _title = 'game_result111'.tr;
      list = [
        buildItem(
          des: 'gameplay_des_lhuh'.tr,
          zCard1: isDark ? R.diamondsBlack2 : R.diamondsNormal2,
          zCard2: isDark ? R.heartsBlack1 : R.heartsNormal1,
          zCard3: isDark ? R.diamondsBlack4 : R.diamondsNormal4,
          zIsH: true,
          zIsSum: false,
          xCard1: isDark ? R.diamondsBlack3 : R.diamondsNormal3,
          xCard2: isDark ? R.diamondsBlack10 : R.diamondsNormal10,
          xCard3: isDark ? R.diamondsBlack4 : R.diamondsNormal4,
          xIsH: true,
          xIsSum: false,
        ),
      ];
    }
    // 龙
    if (betPointId == BaccaratBetPointGroupType.DRAGON.value) {
      _title = 'game_result69'.tr;
      list = [
        buildItem(
          des: 'gameplay_des_long'.tr,
          zCard1: isDark ? R.diamondsBlack10 : R.diamondsNormal10,
          zCard2: isDark ? R.heartsBlack1 : R.heartsNormal1,
          zCard3: isDark ? R.diamondsBlack8 : R.diamondsNormal8,
          zIsH: true,
          zIsSum: false,
          xCard1: isDark ? R.diamondsBlack2 : R.diamondsNormal2,
          xCard2: isDark ? R.diamondsBlack10 : R.diamondsNormal10,
          xCard3: isDark ? R.diamondsBlack7 : R.diamondsNormal7,
          xIsH: true,
          xIsSum: false,
        ),
      ];
    }
    // 小
    if (betPointId == BaccaratBetPointGroupType.SMALL.value) {
      _title = 'game_result105'.tr;
      list = [
        buildItem(
          des: 'gameplay_des_small'.tr,
          zCard1: isDark ? R.heartsBlack8 : R.heartsNormal8,
          zCard2: isDark ? R.diamondsBlack8 : R.diamondsNormal8,
          zIsSum: false,
          xCard1: isDark ? R.heartsBlack8 : R.heartsNormal8,
          xCard2: isDark ? R.diamondsBlack8 : R.diamondsNormal8,
          xIsSum: false,
        ),
      ];
    }
    // 大
    if (betPointId == BaccaratBetPointGroupType.BIG.value) {
      _title = 'game_result104'.tr;
      list = [
        buildItem(
          des: 'gameplay_des_big'.tr,
          zCard1: isDark ? R.diamondsBlack10 : R.diamondsNormal10,
          zCard2: isDark ? R.heartsBlack1 : R.heartsNormal1,
          zCard3: isDark ? R.diamondsBlack8 : R.diamondsNormal8,
          zIsH: true,
          zIsSum: false,
          xCard1: isDark ? R.diamondsBlack10 : R.diamondsNormal10,
          xCard2: isDark ? R.heartsBlack1 : R.heartsNormal1,
          xCard3: isDark ? R.diamondsBlack8 : R.diamondsNormal8,
          xIsH: true,
          xIsSum: false,
        ),
      ];
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    final listWidget = getWidgetList();

    return Container(
      padding: PageStyle.mkPaddingOnly(
        top: 5,
        bottom: 20,
      ),
      height: 335.w,
      width: Get.width,
      decoration: BoxDecoration(
          color: !isDark ? AppColors.color_F4F9FF : AppColors.color_262D40,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16), topRight: Radius.circular(16))),
      child: Column(
        children: [
          topWidget(),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: listWidget,
            ),
          )
        ],
      ),
    );
  }

  Widget topWidget() {
    return Stack(
      children: [
        Container(
          height: 46.w,
          alignment: Alignment.center,
          child: Text(
            _title,
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 17.sp,
                color: isDark
                    ? AppColors.darkTextColor07
                    : AppColors.lightGameSwitchTextColor02),
          ),
        ),
        Positioned(
            left: 0,
            child: IconButton(
              icon: const Icon(Icons.close),
              color:
                  isDark ? AppColors.darkTextColor07 : AppColors.color_253D61,
              onPressed: () => SmartDialog.dismiss(),
            )),
      ],
    );
  }

  Widget buildItem({
    String? des,
    String? zCard1,
    String? zCard2,
    String? zCard3,
    bool zIsH = false, // 是否横
    bool zIsSum = true, // 是否显示和
    String? zSum = '', // 和
    String? xCard1,
    String? xCard2,
    String? xCard3,
    bool xIsH = false, // 是否横
    bool xIsSum = true, // 是否显示和
    String? xSum = '', // 和
    String? liru, //
  }) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            des ?? '',
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              color: isDark
                  ? AppColors.darkTextColor07
                  : AppColors.lightGameSwitchTextColor01,
            ),
          ),
          15.verticalSpace,
          Text(
            liru ?? 'such_as'.tr,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              color: isDark
                  ? AppColors.darkTextColor07
                  : AppColors.lightGameSwitchTextColor01,
            ),
          ),
          10.verticalSpace,
          // 庄
          buildCard(
              title: '${'game_result98'.tr}:',
              card1: zCard1,
              card2: zCard2,
              card3: zCard3,
              isH: zIsH,
              isSum: zIsSum,
              sum: zSum),
          10.verticalSpace,
          // 闲
          buildCard(
              title: '${'game_result97'.tr}:',
              card1: xCard1,
              card2: xCard2,
              card3: xCard3,
              isH: xIsH,
              isSum: xIsSum,
              sum: xSum),
        ],
      ),
    ).marginSymmetric(horizontal: 14.w);
  }

  /// 庄、闲
  Widget buildCard({
    String? title,
    String? card1,
    String? card2,
    String? card3,
    bool isH = false, // 最后一张是否为横图
    bool isSum = true, //是否需要求和
    String? sum = '6',
  }) {
    return Row(
      children: [
        Text(
          title ?? '',
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
            color: isDark
                ? AppColors.darkTextColor07
                : AppColors.lightGameSwitchTextColor01,
          ),
        ),
        12.horizontalSpace,
        // 第一张
        Image.asset(card1 ?? '', width: 40.w, height: 56.w),
        isSum
            ? Container(
                width: 26.w,
                alignment: Alignment.center,
                child: Text(
                  '+',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: isDark
                        ? AppColors.darkTextColor07
                        : AppColors.lightGameSwitchTextColor01,
                  ),
                ),
              )
            : Container(
                width: 26.w,
              ),
        // 第二张
        Image.asset(card2 ?? '', width: 40.w, height: 56.w),
        isSum
            ? Container(
                width: 26.w,
                alignment: Alignment.center,
                child: Text(
                  card3 == null ? '=' : '+',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: isDark
                        ? AppColors.darkTextColor07
                        : AppColors.lightGameSwitchTextColor01,
                  ),
                ),
              )
            : Container(
                width: 26.w,
              ),
        // 第三张
        card3 == null
            ? Container()
            : isH
                ? SizedBox(
                    width: 56.w,
                    height: 56.w,
                    child: Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.rotationZ(math.pi / 2),
                      child:
                          Image.asset(card3 ?? '', width: 40.w, height: 56.w),
                    ))
                : Image.asset(card3 ?? '', width: 40.w, height: 56.w),
        card3 == null
            ? Container()
            : isSum
                ? Container(
                    width: 26.w,
                    alignment: Alignment.center,
                    child: Text(
                      '=',
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: isDark
                            ? AppColors.darkTextColor07
                            : AppColors.lightGameSwitchTextColor01,
                      ),
                    ),
                  )
                : Container(
                    width: 26.w,
                  ),
        // 和值
        isSum
            ? Text(
                sum ?? '',
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w500,
                  color: isDark
                      ? AppColors.darkTextColor07
                      : AppColors.lightGameSwitchTextColor01,
                ),
              )
            : Container(),
      ],
    );
  }
}
