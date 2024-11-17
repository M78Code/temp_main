import 'package:flutter_main/generated/r.dart';
import 'package:flutter_main/models/event_model/websocket_event.dart';
import 'package:flutter_main/models/pair_triple.dart';
import 'package:flutter_main/models/ws/ws_106_model.dart';
import 'package:flutter_main/models/ws/ws_171_model.dart';
import 'package:flutter_main/utils/event_bus_util.dart';
import 'package:flutter_main/utils/log_util.dart';
import 'package:get/get.dart';

class OpenPokerController extends GetxController {
  static OpenPokerController get controller {
    return Get.find<OpenPokerController>();
  }

  //黑桃1～10，J，Q，K
  final spades = [
    R.playingCardsPokerBg, //index=0是poker背景
    R.spadesBlack1,
    R.spadesBlack2,
    R.spadesBlack3,
    R.spadesBlack4,
    R.spadesBlack5,
    R.spadesBlack6,
    R.spadesBlack7,
    R.spadesBlack8,
    R.spadesBlack9,
    R.spadesBlack10,
    R.spadesBlack11,
    R.spadesBlack12,
    R.spadesBlack13
  ];

  //红心1～10，J，Q，K
  final hearts = [
    R.playingCardsPokerBg, //index=0是poker背景
    R.heartsBlack1,
    R.heartsBlack2,
    R.heartsBlack3,
    R.heartsBlack4,
    R.heartsBlack5,
    R.heartsBlack6,
    R.heartsBlack7,
    R.heartsBlack8,
    R.heartsBlack9,
    R.heartsBlack10,
    R.heartsBlack11,
    R.heartsBlack12,
    R.heartsBlack13
  ];

  //方块1～10，J，Q，K
  final clubs = [
    R.playingCardsPokerBg, //index=0是poker背景
    R.black1,
    R.black2,
    R.black3,
    R.black4,
    R.black5,
    R.black6,
    R.black7,
    R.black8,
    R.black9,
    R.black10,
    R.black11,
    R.black12,
    R.black13
  ];

  //梅花1～10，J，Q，K
  final diamonds = [
    R.playingCardsPokerBg, //index=0是poker背景
    R.diamondsBlack1,
    R.diamondsBlack2,
    R.diamondsBlack3,
    R.diamondsBlack4,
    R.diamondsBlack5,
    R.diamondsBlack6,
    R.diamondsBlack7,
    R.diamondsBlack8,
    R.diamondsBlack9,
    R.diamondsBlack10,
    R.diamondsBlack11,
    R.diamondsBlack12,
    R.diamondsBlack13
  ];

  /*
   * 数字转换为牌型方法：
   * 1. cardNumber/4 + 1 = 1~13的数。1=A，11=J，12=Q，13=K
   * 2. cardNumber%4的余数为花色，0=方片，1=梅花，2=红心，3=黑桃
   *
   * 0=♦️1，   1=♣️1，  2=❤️1，3=♠️1
   * 4=♦️2，   5=♣️2，  6=❤️2，7=♠️2
   * 8=♦️3，   9=♣️3， 10=❤️3，11=♠️3
   * 12=♦️4， 13=♣️4， 14=❤️4，15=♠️4
   * 16=♦️5， 17=♣️5， 18=❤️5，19=♠️5
   * 20=♦️6， 21=♣️6， 22=❤️6，23=♠️6
   * 24=♦️7， 25=♣️7， 26=❤️7，27=♠️7
   * 28=♦️8， 29=♣️8， 30=❤️8，31=♠️8
   * 32=♦️9， 33=♣️9， 34=❤️9，35=♠️9
   * 36=♦️10，37=♣️10，38=❤️9，39=♠️10
   * 40=♦️J， 41=♣️J， 42=❤️J，43=♠️J
   * 44=♦️Q， 45=♣️Q， 46=❤️Q，47=♠️Q
   * 48=♦️K， 49=♣️K， 50=❤️K，51=♠️K
   */

  // 闲三张牌
  var player1PokerNumber = R.playingCardsPokerBg;
  var player2PokerNumber = R.playingCardsPokerBg;
  var player3PokerNumber = R.playingCardsPokerBg;
  var isShowPlayerRepairPoker = false;

  // 庄三张牌
  var banker1PokerNumber = R.playingCardsPokerBg;
  var banker2PokerNumber = R.playingCardsPokerBg;
  var banker3PokerNumber = R.playingCardsPokerBg;
  var isShowBankerRepairPoker = false;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  //开牌信息
  updateOpenPokerInfos(Ws106Model ws106model) {
    // LogUtil.log("开牌信息: $ws106model, cardOwner=${ws106model.cardOwner}");
    if (ws106model.cardOwner == 0) {
      //庄开牌
      //计算庄的第一张牌信息
      if (ws106model.cardIndex == 2) {
        banker1PokerNumber =
            pokerNumber(ws106model.cardOwner, ws106model.cardNumber ?? 0);
      }
      //计算庄的第二张牌信息
      if (ws106model.cardIndex == 4) {
        banker2PokerNumber =
            pokerNumber(ws106model.cardOwner, ws106model.cardNumber ?? 0);
      }
      //计算庄的第三张牌信息（补牌）
      if (ws106model.cardIndex == 6) {
        isShowBankerRepairPoker = true;
        banker3PokerNumber =
            pokerNumber(ws106model.cardOwner, ws106model.cardNumber ?? 0);
      }
    } else if (ws106model.cardOwner == 1) {
      //闲开牌
      //计算闲的第一张牌信息
      if (ws106model.cardIndex == 1) {
        player1PokerNumber =
            pokerNumber(ws106model.cardOwner, ws106model.cardNumber ?? 0);
      }
      //计算闲的第二张牌信息
      if (ws106model.cardIndex == 3) {
        player2PokerNumber =
            pokerNumber(ws106model.cardOwner, ws106model.cardNumber ?? 0);
      }
      //计算闲的第三张牌信息（补牌）
      if (ws106model.cardIndex == 5) {
        isShowPlayerRepairPoker = true;
        player3PokerNumber =
            pokerNumber(ws106model.cardOwner, ws106model.cardNumber ?? 0);
      }
    }
    update(["OpenPokerPage"]);
  }

  //补牌信息
  repairPokerInfos(Ws171Model ws171model) {
    // LogUtil.log("补牌信息: $ws171model");
  }

  String pokerNumber(int? cardOwner, int cardNumber) {
    var pokerNumber = cardNumber ~/ 4 + 1;
    var pokerFlowerColor = cardNumber % 4;
    LogUtil.log(
        "cardOwner=$cardOwner, cardNumber=$cardNumber, pokerNumber=$pokerNumber, pokerFlowerColor=$pokerFlowerColor");
    if (pokerFlowerColor == 0) {
      return clubs[pokerNumber];
    } else if (pokerFlowerColor == 1) {
      return diamonds[pokerNumber];
    } else if (pokerFlowerColor == 2) {
      return hearts[pokerNumber];
    } else if (pokerFlowerColor == 3) {
      return spades[pokerNumber];
    } else {
      return R.playingCardsPokerBg;
    }
  }

  //清空牌信息
  void clearPokerInfo() {
    player1PokerNumber = R.playingCardsPokerBg;
    player2PokerNumber = R.playingCardsPokerBg;
    player3PokerNumber = R.playingCardsPokerBg;
    isShowPlayerRepairPoker = false;
    banker1PokerNumber = R.playingCardsPokerBg;
    banker2PokerNumber = R.playingCardsPokerBg;
    banker3PokerNumber = R.playingCardsPokerBg;
    isShowBankerRepairPoker = false;
  }
}
