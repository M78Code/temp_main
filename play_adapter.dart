import 'package:flutter/material.dart';
import 'package:flutter_main/app.dart';

import 'package:flutter_main/utils/Commond/Data/GameEnum.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    } else if (BaccaratBetPointGroupType.PLAYER_NUMBER_PAIR.value ==
        betPointId) {
      return 'game_result95'.tr;
    } else if (BaccaratBetPointGroupType.BANKER_NUMBER_PAIR.value ==
        betPointId) {
      return 'game_result96'.tr;
    } else if (BaccaratBetPointGroupType.PLAYER_DRAGON.value == betPointId) {
      return 'game_result80'.tr;
    } else if (BaccaratBetPointGroupType.SUPER_SIX.value == betPointId) {
      return 'game_result79'.tr;
    } else if (BaccaratBetPointGroupType.BANKER_DRAGON.value == betPointId) {
      return 'game_result81'.tr;
    } else if (BaccaratBetPointGroupType.LUCKY_SEVEN.value == betPointId) {
      return 'game_result109'.tr;
    } else if (BaccaratBetPointGroupType.SUPER_LUCKY_SEVEN.value ==
        betPointId) {
      return 'game_result110'.tr;
    } else if (BaccaratBetPointGroupType.BIG.value == betPointId) {
      return 'game_result104'.tr;
    } else if (BaccaratBetPointGroupType.SMALL.value == betPointId) {
      return 'game_result105'.tr;
    } else if (BaccaratBetPointGroupType.ANY_NUMBER_PAIR.value == betPointId) {
      return 'game_result83'.tr;
    } else if (BaccaratBetPointGroupType.SUPER_PAIR.value == betPointId) {
      return 'game_result82'.tr;
    } else if (BaccaratBetPointGroupType.ALL_PAIR.value == betPointId) {
      return 'game_result84'.tr;
    } else if (BaccaratBetPointGroupType.DRAGON_TIGER_TIE.value == betPointId) {
      return 'game_result92'.tr;
    } else if (BaccaratBetPointGroupType.BANKER_DRAGON.value == betPointId) {
      return 'game_result81'.tr;
    } else if (BaccaratBetPointGroupType.BIG_TIGER.value == betPointId) {
      return 'game_result89'.tr;
    } else if (BaccaratBetPointGroupType.SMALL_TIGER.value == betPointId) {
      return 'game_result90'.tr;
    } else if (BaccaratBetPointGroupType.TIGER_PAIR.value == betPointId) {
      return 'game_result93'.tr;
    } else if (BaccaratBetPointGroupType.PLAYER_SKY.value == betPointId) {
      return 'game_result115'.tr;
    } else if (BaccaratBetPointGroupType.SKY.value == betPointId) {
      return 'game_result116'.tr;
    } else if (BaccaratBetPointGroupType.BANKER_SKY.value == betPointId) {
      return 'game_result114'.tr;
    } else if (BaccaratBetPointGroupType.PANDA_EIGHT.value == betPointId) {
      return 'game_result88'.tr;
    } else if (BaccaratBetPointGroupType.SUPER_TIE.value == betPointId) {
      return 'game_result91'.tr;
    } else if (BaccaratBetPointGroupType.DRAGON_SEVEN.value == betPointId) {
      return 'game_result87'.tr;
    } else if (BaccaratBetPointGroupType.SUPER_TIE_ZERO.value == betPointId) {
      return '${'game_result91'.tr} 0';
    } else if (BaccaratBetPointGroupType.SUPER_TIE_ONE.value == betPointId) {
      return '${'game_result91'.tr} 1';
    } else if (BaccaratBetPointGroupType.SUPER_TIE_TWO.value == betPointId) {
      return '${'game_result91'.tr} 2';
    } else if (BaccaratBetPointGroupType.SUPER_TIE_THREE.value == betPointId) {
      return '${'game_result91'.tr} 3';
    } else if (BaccaratBetPointGroupType.SUPER_TIE_FOUR.value == betPointId) {
      return '${'game_result91'.tr} 4';
    } else if (BaccaratBetPointGroupType.SUPER_TIE_FIVE.value == betPointId) {
      return '${'game_result91'.tr} 5';
    } else if (BaccaratBetPointGroupType.SUPER_TIE_SIX.value == betPointId) {
      return '${'game_result91'.tr} 6';
    } else if (BaccaratBetPointGroupType.SUPER_TIE_SEVEN.value == betPointId) {
      return '${'game_result91'.tr} 7';
    } else if (BaccaratBetPointGroupType.SUPER_TIE_EIGHT.value == betPointId) {
      return '${'game_result91'.tr} 8';
    } else if (BaccaratBetPointGroupType.SUPER_TIE_NINE.value == betPointId) {
      return '${'game_result91'.tr} 9';
    } else {
      return '';
    }
  }

  /// 投注下面 文字样式 庄-和-闲
  static TextStyle? getBottomTextStyle(int betPointId, bool isText) {
    if (BaccaratBetPointGroupType.PLAYER.value == betPointId) {
      //闲
      return TextStyle(
          fontFamily: 'BetPlay',
          fontSize: isText ? 23.sp : 12.sp,
          fontWeight: isText ? FontWeight.w400 : FontWeight.w700,
          color: isText ? const Color(0xFFC8DCFF) : const Color(0xFFCBDDFF));
    } else if (BaccaratBetPointGroupType.TIE.value == betPointId) {
      //和
      return TextStyle(
          fontFamily: 'BetPlay',
          fontSize: isText ? 23.sp : 12.sp,
          fontWeight: isText ? FontWeight.w400 : FontWeight.w700,
          color: isText ? const Color(0xFFC0F4CB) : const Color(0xFFC9F6D3));
    } else if (BaccaratBetPointGroupType.BANKER.value == betPointId) {
      //庄
      return TextStyle(
          fontFamily: 'BetPlay',
          fontSize: isText ? 23.sp : 12.sp,
          fontWeight: isText ? FontWeight.w400 : FontWeight.w700,
          color: isText ? const Color(0xFFFFBBC6) : const Color(0xFFFFBEC9));
    } else {
      return null;
    }
  }

  /// 根据切换玩法获取对应文本样式
  static TextStyle? getTextStyle(int betPlayType, int betPointId, bool isText) {
    if (BetPlayType.CLASSICS.value == betPlayType) {
      return getClassicsTextStyle(betPointId, isText);
    } else if (BetPlayType.SUPER_LUCK_7.value == betPlayType) {
      return getSuperLuck7TextStyle(betPointId, isText);
    } else if (BetPlayType.LUCK_6.value == betPlayType) {
      return getLuck6TextStyle(betPointId, isText);
    } else if (BetPlayType.SUPER_PAIR.value == betPlayType) {
      return getSuperPairTextStyle(betPointId, isText);
    } else if (BetPlayType.SUPER_TIE.value == betPlayType) {
      return getSuperTieTextStyle(betPointId, isText);
    } else if (BetPlayType.LUCK_6_TIGER.value == betPlayType) {
      return getLuck6TigerTextStyle(betPointId, isText);
    } else if (BetPlayType.NATURAL.value == betPlayType) {
      return getNaturalTextStyle(betPointId, isText);
    } else if (BetPlayType.DRAGON_TIGER.value == betPlayType) {
      return getDragonTigerTextStyle(betPointId, isText);
    } else if (BetPlayType.BIG_SMALL.value == betPlayType) {
      return getBigSmallTextStyle(betPointId, isText);
    }
    return null;
  }

  /// 经典玩法 文字样式 闲对-庄对
  static TextStyle? getClassicsTextStyle(int betPointId, bool isText) {
    if (BaccaratBetPointGroupType.PLAYER_NUMBER_PAIR.value == betPointId) {
      //闲对
      return TextStyle(
          fontFamily: 'BetPlay',
          fontSize: isText ? 15.sp : 9.sp,
          fontWeight: isText ? FontWeight.w400 : FontWeight.w700,
          color: isText ? const Color(0xFFC8DCFF) : const Color(0xFFCBDDFF));
    } else if (BaccaratBetPointGroupType.BANKER_NUMBER_PAIR.value ==
        betPointId) {
      //庄对
      return TextStyle(
          fontFamily: 'BetPlay',
          fontSize: isText ? 15.sp : 9.sp,
          fontWeight: isText ? FontWeight.w400 : FontWeight.w700,
          color: isText ? const Color(0xFFFFBBC6) : const Color(0xFFFFBEC9));
    } else {
      return null;
    }
  }

  /// 幸运6
  static TextStyle? getLuck6TextStyle(int betPointId, bool isText) {
    if (BaccaratBetPointGroupType.PLAYER_NUMBER_PAIR.value == betPointId ||
        BaccaratBetPointGroupType.PLAYER_DRAGON.value == betPointId) {
      //闲对/闲龙宝
      return TextStyle(
          fontFamily: 'BetPlay',
          fontSize: isText ? 15.sp : 9.sp,
          fontWeight: isText ? FontWeight.w400 : FontWeight.w700,
          color: isText ? const Color(0xFFC8DCFF) : const Color(0xFFCBDDFF));
    } else if (BaccaratBetPointGroupType.BANKER_NUMBER_PAIR.value ==
            betPointId ||
        BaccaratBetPointGroupType.BANKER_DRAGON.value == betPointId) {
      //庄对/庄龙宝
      return TextStyle(
          fontFamily: 'BetPlay',
          fontSize: isText ? 15.sp : 9.sp,
          fontWeight: isText ? FontWeight.w400 : FontWeight.w700,
          color: isText ? const Color(0xFFFFBBC6) : const Color(0xFFFFBEC9));
    } else if (BaccaratBetPointGroupType.SUPER_SIX.value == betPointId) {
      //幸运6
      return TextStyle(
          fontFamily: 'BetPlay',
          fontSize: isText ? 15.sp : 9.sp,
          fontWeight: isText ? FontWeight.w400 : FontWeight.w700,
          color: isText ? const Color(0xFFFFD687) : const Color(0xFFFFE894));
    } else {
      return null;
    }
  }

  /// 幸运7
  static TextStyle? getSuperLuck7TextStyle(int betPointId, bool isText) {
    if (BaccaratBetPointGroupType.PLAYER_NUMBER_PAIR.value == betPointId ||
        BaccaratBetPointGroupType.LUCKY_SEVEN.value == betPointId) {
      //闲对/幸运7
      return TextStyle(
          fontFamily: 'BetPlay',
          fontSize: isText ? 15.sp : 9.sp,
          fontWeight: isText ? FontWeight.w400 : FontWeight.w700,
          color: isText ? const Color(0xFFC8DCFF) : const Color(0xFFCBDDFF));
    } else if (BaccaratBetPointGroupType.BANKER_NUMBER_PAIR.value ==
            betPointId ||
        BaccaratBetPointGroupType.SUPER_SIX.value == betPointId) {
      //庄对/幸运6
      return TextStyle(
          fontFamily: 'BetPlay',
          fontSize: isText ? 15.sp : 9.sp,
          fontWeight: isText ? FontWeight.w400 : FontWeight.w700,
          color: isText ? const Color(0xFFFFBBC6) : const Color(0xFFFFBEC9));
    } else if (BaccaratBetPointGroupType.SUPER_LUCKY_SEVEN.value ==
        betPointId) {
      //超级幸运7
      return TextStyle(
          fontFamily: 'BetPlay',
          fontSize: isText ? 15.sp : 9.sp,
          fontWeight: isText ? FontWeight.w400 : FontWeight.w700,
          color: isText ? const Color(0xFFFFD687) : const Color(0xFFFFE894));
    } else {
      return null;
    }
  }

  /// 超级对
  static TextStyle? getSuperPairTextStyle(int betPointId, bool isText) {
    if (BaccaratBetPointGroupType.PLAYER_NUMBER_PAIR.value == betPointId) {
      //闲对
      return TextStyle(
          fontFamily: 'BetPlay',
          fontSize: isText ? 15.sp : 9.sp,
          fontWeight: isText ? FontWeight.w400 : FontWeight.w700,
          color: isText ? const Color(0xFFC8DCFF) : const Color(0xFFCBDDFF));
    } else if (BaccaratBetPointGroupType.ANY_NUMBER_PAIR.value == betPointId ||
        BaccaratBetPointGroupType.SUPER_PAIR.value == betPointId ||
        BaccaratBetPointGroupType.ALL_PAIR.value == betPointId) {
      //任意对子-超级对-完美对子
      return TextStyle(
          fontFamily: 'BetPlay',
          fontSize: isText ? 15.sp : 9.sp,
          fontWeight: isText ? FontWeight.w400 : FontWeight.w700,
          color: isText ? const Color(0xFFFFD687) : const Color(0xFFFFE894));
    } else if (BaccaratBetPointGroupType.BANKER_NUMBER_PAIR.value ==
        betPointId) {
      //庄对
      return TextStyle(
          fontFamily: 'BetPlay',
          fontSize: isText ? 15.sp : 9.sp,
          fontWeight: isText ? FontWeight.w400 : FontWeight.w700,
          color: isText ? const Color(0xFFFFBBC6) : const Color(0xFFFFBEC9));
    } else {
      return null;
    }
  }

  /// 超和
  static TextStyle? getSuperTieTextStyle(int betPointId, bool isText) {
    if (BaccaratBetPointGroupType.PLAYER_NUMBER_PAIR.value == betPointId ||
        BaccaratBetPointGroupType.PANDA_EIGHT.value == betPointId) {
      //闲对-熊猫八
      return TextStyle(
          fontFamily: 'BetPlay',
          fontSize: isText ? 15.sp : 9.sp,
          fontWeight: isText ? FontWeight.w400 : FontWeight.w700,
          color: isText ? const Color(0xFFC8DCFF) : const Color(0xFFCBDDFF));
    } else if (BaccaratBetPointGroupType.BANKER_NUMBER_PAIR.value ==
            betPointId ||
        BaccaratBetPointGroupType.DRAGON_SEVEN.value == betPointId) {
      //庄对-龙7
      return TextStyle(
          fontFamily: 'BetPlay',
          fontSize: isText ? 15.sp : 9.sp,
          fontWeight: isText ? FontWeight.w400 : FontWeight.w700,
          color: isText ? const Color(0xFFFFBBC6) : const Color(0xFFFFBEC9));
    } else if (BaccaratBetPointGroupType.SUPER_TIE.value == betPointId) {
      //超和
      return TextStyle(
          fontFamily: 'BetPlay',
          fontSize: isText ? 15.sp : 9.sp,
          fontWeight: isText ? FontWeight.w400 : FontWeight.w700,
          color: isText ? const Color(0xFFC0F4CB) : const Color(0xFFC9F6D3));
    } else {
      return null;
    }
  }

  /// luck6 老虎
  static TextStyle? getLuck6TigerTextStyle(int betPointId, bool isText) {
    if (BaccaratBetPointGroupType.DRAGON_TIGER_TIE.value == betPointId ||
        BaccaratBetPointGroupType.BIG_TIGER.value == betPointId ||
        BaccaratBetPointGroupType.SUPER_SIX.value == betPointId ||
        BaccaratBetPointGroupType.SMALL_TIGER.value == betPointId ||
        BaccaratBetPointGroupType.TIGER_PAIR.value == betPointId) {
      //老虎和
      return TextStyle(
          fontFamily: 'BetPlay',
          fontSize: isText ? 15.sp : 9.sp,
          fontWeight: isText ? FontWeight.w400 : FontWeight.w700,
          color: isText ? const Color(0xFFFFD687) : const Color(0xFFFFE894));
    } else {
      return null;
    }
  }

  /// 天牌
  static TextStyle? getNaturalTextStyle(int betPointId, bool isText) {
    if (BaccaratBetPointGroupType.PLAYER_NUMBER_PAIR.value == betPointId ||
        BaccaratBetPointGroupType.PLAYER_SKY.value == betPointId) {
      //闲对-闲天牌
      return TextStyle(
          fontFamily: 'BetPlay',
          fontSize: isText ? 15.sp : 9.sp,
          fontWeight: isText ? FontWeight.w400 : FontWeight.w700,
          color: isText ? const Color(0xFFC8DCFF) : const Color(0xFFCBDDFF));
    } else if (BaccaratBetPointGroupType.BANKER_NUMBER_PAIR.value ==
            betPointId ||
        BaccaratBetPointGroupType.BANKER_SKY.value == betPointId) {
      //庄对-庄天牌
      return TextStyle(
          fontFamily: 'BetPlay',
          fontSize: isText ? 15.sp : 9.sp,
          fontWeight: isText ? FontWeight.w400 : FontWeight.w700,
          color: isText ? const Color(0xFFFFBBC6) : const Color(0xFFFFBEC9));
    } else if (BaccaratBetPointGroupType.SKY.value == betPointId) {
      //天牌
      return TextStyle(
          fontFamily: 'BetPlay',
          fontSize: isText ? 15.sp : 9.sp,
          fontWeight: isText ? FontWeight.w400 : FontWeight.w700,
          color: isText ? const Color(0xFFFFD687) : const Color(0xFFFFE894));
    } else {
      return null;
    }
  }

  /// 龙虎和
  static TextStyle? getDragonTigerTextStyle(int betPointId, bool isText) {
    if (BaccaratBetPointGroupType.PLAYER_NUMBER_PAIR.value == betPointId ||
        BaccaratBetPointGroupType.TIGER.value == betPointId) {
      //闲对-虎
      return TextStyle(
          fontFamily: 'BetPlay',
          fontSize: isText ? 15.sp : 9.sp,
          fontWeight: isText ? FontWeight.w400 : FontWeight.w700,
          color: isText ? const Color(0xFFC8DCFF) : const Color(0xFFCBDDFF));
    } else if (BaccaratBetPointGroupType.BANKER_NUMBER_PAIR.value ==
            betPointId ||
        BaccaratBetPointGroupType.DRAGON.value == betPointId) {
      //庄对-龙
      return TextStyle(
          fontFamily: 'BetPlay',
          fontSize: isText ? 15.sp : 9.sp,
          fontWeight: isText ? FontWeight.w400 : FontWeight.w700,
          color: isText ? const Color(0xFFFFBBC6) : const Color(0xFFFFBEC9));
    } else if (BaccaratBetPointGroupType.DRAGON_TIGER_TIE.value == betPointId) {
      //龙虎和
      return TextStyle(
          fontFamily: 'BetPlay',
          fontSize: isText ? 15.sp : 9.sp,
          fontWeight: isText ? FontWeight.w400 : FontWeight.w700,
          color: isText ? const Color(0xFFC0F4CB) : const Color(0xFFC9F6D3));
    } else {
      return null;
    }
  }

  /// 大小
  static TextStyle? getBigSmallTextStyle(int betPointId, bool isText) {
    if (BaccaratBetPointGroupType.PLAYER_NUMBER_PAIR.value == betPointId ||
        BaccaratBetPointGroupType.SMALL.value == betPointId) {
      //闲对-小
      return TextStyle(
          fontFamily: 'BetPlay',
          fontSize: isText ? 15.sp : 9.sp,
          fontWeight: isText ? FontWeight.w400 : FontWeight.w700,
          color: isText ? const Color(0xFFC8DCFF) : const Color(0xFFCBDDFF));
    } else if (BaccaratBetPointGroupType.BANKER_NUMBER_PAIR.value ==
            betPointId ||
        BaccaratBetPointGroupType.BIG.value == betPointId) {
      //庄对-大
      return TextStyle(
          fontFamily: 'BetPlay',
          fontSize: isText ? 15.sp : 9.sp,
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

  static String convertProtocolIdText(int protocolId) {
    String showText = '';
    if (103 == protocolId) {
      showText = '洗牌中';
    } else if (104 == protocolId) {
      showText = '下注中';
    } else if (113 == protocolId) {
      showText = '结算中';
    } else if (160 == protocolId) {
      showText = '开牌中';
    } else if (107 == protocolId) {
      showText = '结算中';
    } else if (112 == protocolId) {
      showText = '结算中';
    } else if (207 == protocolId) {
      showText = '维护中';
    }

    return showText;
  }

  // 准备中
  //   READY(0),
  //   /// 洗牌中
  //   SHUFFLE(1),
  //   /// 下注中
  //   BET(2),
  //   /// 开牌中
  //   OPEN(3),
  //   /// 结算中
  //   COUNT(4),
  //   /// 维护中
  //   MAINTAIN(6);
  static String convertGameStatusText(int gameStatus) {
    String showText = '';
    if (GameStatus.READY.value == gameStatus) {
      showText = '准备中';
    } else if (GameStatus.SHUFFLE.value == gameStatus) {
      showText = '洗牌中';
    } else if (GameStatus.BET.value == gameStatus) {
      showText = '下注中';
    }else if (GameStatus.OPEN.value == gameStatus) {
      showText = '开牌中';
    }else if (GameStatus.COUNT.value == gameStatus) {
      showText = '结算中';
    }else if (GameStatus.MAINTAIN.value == gameStatus) {
      showText = '维护中';
    }

    return showText;
  }

  static List getSuperTieList() {
    List<int> superTieList = [];
    superTieList.add(BaccaratBetPointGroupType.SUPER_TIE_ZERO.value);
    superTieList.add(BaccaratBetPointGroupType.SUPER_TIE_ONE.value);
    superTieList.add(BaccaratBetPointGroupType.SUPER_TIE_TWO.value);
    superTieList.add(BaccaratBetPointGroupType.SUPER_TIE_THREE.value);
    superTieList.add(BaccaratBetPointGroupType.SUPER_TIE_FOUR.value);
    superTieList.add(BaccaratBetPointGroupType.SUPER_TIE_FIVE.value);
    superTieList.add(BaccaratBetPointGroupType.SUPER_TIE_SIX.value);
    superTieList.add(BaccaratBetPointGroupType.SUPER_TIE_SEVEN.value);
    superTieList.add(BaccaratBetPointGroupType.SUPER_TIE_EIGHT.value);
    superTieList.add(BaccaratBetPointGroupType.SUPER_TIE_NINE.value);

    return superTieList;
  }
}
