import 'package:flutter/material.dart';
import 'package:flutter_main/app.dart';

import 'package:flutter_main/utils/Commond/Data/GameEnum.dart';
import 'package:get/get.dart';

//     /** 庄 */
//     BANKER(3001),
//     /** 闲 */
//     PLAYER(3002),
//     /** 和 */
//     TIE(3003),
//     /** 庄对 */
//     BANKER_NUMBER_PAIR(3004),
//     /** 闲对 */
//     PLAYER_NUMBER_PAIR(3005),
//     /** 大 */
//     BIG(3006),
//     /** 小 */
//     SMALL(3007),
//     /** 完美对子 */
//     ALL_PAIR(3009),
//     /** 庄龙宝 */
//     BANKER_DRAGON(3010),
//     /** 闲龙宝 */
//     PLAYER_DRAGON(3011),
//     /** 超级6 */
//     SUPER_SIX(3012),
//     /** 庄免佣 */
//     BANKER_FREE(3013),
//     /** 任意对子 */
//     ANY_NUMBER_PAIR(3014),
//     /** 超和(0) */
//     SUPER_TIE_ZERO(4100),
//     /** 超和(1) */
//     SUPER_TIE_ONE(4101),
//     /** 超和(2) */
//     SUPER_TIE_TWO(4102),
//     /** 超和(3) */
//     SUPER_TIE_THREE(4103),
//     /** 超和(4) */
//     SUPER_TIE_FOUR(4104),
//     /** 超和(5) */
//     SUPER_TIE_FIVE(4105),
//     /** 超和(6) */
//     SUPER_TIE_SIX(4106),
//     /** 超和(7) */
//     SUPER_TIE_SEVEN(4107),
//     /** 超和(8) */
//     SUPER_TIE_EIGHT(4108),
//     /** 超和(9) */
//     SUPER_TIE_NINE(4109),
//     /** 超级对 */
//     SUPER_PAIR(4110),
//     /** 龙7 */
//     DRAGON_SEVEN(4111),
//     /** 熊猫8 */
//     PANDA_EIGHT(4112),
//     /** 大老虎 */
//     BIG_TIGER(4113),
//     /** 小老虎 */
//     SMALL_TIGER(4114),
//     /** 庄天牌 */
//     BANKER_SKY(4115),
//     /** 闲天牌 */
//     PLAYER_SKY(4116),
//     /** 天牌 */
//     SKY(4117),
//     /** 龙 */
//     DRAGON(4118),
//     /** 虎 */
//     TIGER(4119),
//     /** 龙虎和 */
//     DRAGON_TIGER_TIE(4120),
//     /** 庄保险(第一轮) */
//     BANKER_INSURANCE_FIRST(4121),
//     /** 庄保险(第二轮) */
//     BANKER_INSURANCE_SECOND(4122),
//     /** 闲保险(第一轮) */
//     PLAYER_INSURANCE_FIRST(4123),
//     /** 闲保险(第二轮) */
//     PLAYER_INSURANCE_SECOND(4124),
//     /** 老虎和 */
//     TIGER_TIE(4204),
//     /** 老虎对 */
//     TIGER_PAIR(4205),
//     /** 不存在,只做映射用 */
//     SUPER_TIE(-1),
//     /** 不存在,只做映射用 */
//     BANKER_PLAYER_DRAGON (-2);
class PlayAdapter {
  static String getTextContent(int betPointId) {
    if (BaccaratBetPointGroupType.PLAYER.value == betPointId) {
      return 'game_result97'.tr;
    } else if (BaccaratBetPointGroupType.TIE.value == betPointId) {
      return 'game_result99'.tr;
    } else if (BaccaratBetPointGroupType.BANKER.value == betPointId) {
      return 'game_result98'.tr;
    }  else if (BaccaratBetPointGroupType.PLAYER_NUMBER_PAIR.value == betPointId) {
      return 'game_result95'.tr;
    }  else if (BaccaratBetPointGroupType.BANKER_NUMBER_PAIR.value == betPointId) {
      return 'game_result96'.tr;
    } else {
      return '';
    }
  }

  static TextStyle? getTextStyle(int betPointId, bool isText) {
    if (BaccaratBetPointGroupType.PLAYER.value == betPointId) {
      //闲
      return TextStyle(
          fontSize: isText ? 24 : 12,
          fontWeight: isText ? FontWeight.w400 : FontWeight.w700,
          color: isText ? const Color(0xFFC8DCFF) : const Color(0xFFCBDDFF));
    } else if (BaccaratBetPointGroupType.TIE.value == betPointId) {
      //和
      return TextStyle(
          fontSize: isText ? 24 : 12,
          fontWeight: isText ? FontWeight.w400 : FontWeight.w700,
          color: isText ? const Color(0xFFC0F4CB) : const Color(0xFFC9F6D3));
    } else if (BaccaratBetPointGroupType.BANKER.value == betPointId) {
      //庄
      return TextStyle(
          fontSize: isText ? 24 : 12,
          fontWeight: isText ? FontWeight.w400 : FontWeight.w700,
          color: isText ? const Color(0xFFFFBBC6) : const Color(0xFFFFBEC9));
    } else if (BaccaratBetPointGroupType.PLAYER_NUMBER_PAIR.value == betPointId) {
      //闲对
      return TextStyle(
          fontSize: isText ? 16 : 9,
          fontWeight: isText ? FontWeight.w400 : FontWeight.w700,
          color: isText ? const Color(0xFFC8DCFF) : const Color(0xFFCBDDFF));
    } else if (BaccaratBetPointGroupType.BANKER_NUMBER_PAIR.value == betPointId) {
      //庄对
      return TextStyle(
          fontSize: isText ? 16 : 9,
          fontWeight: isText ? FontWeight.w400 : FontWeight.w700,
          color: isText ? const Color(0xFFFFBBC6) : const Color(0xFFFFBEC9));
    } else {
      return null;
    }
  }

  static Gradient? getGradient(int betPointId) {
    if (BaccaratBetPointGroupType.PLAYER.value == betPointId) {
      //闲
      return const LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [
          Color.fromRGBO(40, 126, 255, 0.5),
          Color.fromRGBO(40, 126, 255, 1),
        ],
      );
    } else if (BaccaratBetPointGroupType.TIE.value == betPointId) {
      //和
      return const LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [
          Color.fromRGBO(49, 189, 130, 0.5),
          Color.fromRGBO(40, 189, 130, 1),
        ],
      );
    } else if (BaccaratBetPointGroupType.BANKER.value == betPointId) {
      //庄
      return const LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [
          Color.fromRGBO(255, 43, 77, 0.5),
          Color.fromRGBO(255, 43, 77, 1),
        ],
      );
    } else {
      return null;
    }
  }

  static String convertGameStatusText(int protocolId) {
    String showText = '';
    if (103 == protocolId) {
      showText = '洗牌中';
    } else if (104 == protocolId) {
      showText = '下注中';
    } else if (113 == protocolId) {
      showText = '结算中';
    }else if (160 == protocolId) {
      showText = '开牌中';
    }else if (107 == protocolId) {
      showText = '结算中';
    }else if (112 == protocolId) {
      showText = '结算中';
    }else if (207 == protocolId) {
      showText = '维护中';
    }

    return showText;
  }
}
