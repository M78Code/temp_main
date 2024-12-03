import 'package:flutter/material.dart';
import 'package:flutter_main/utils/RoadPaper/Data/RoadPaperAllBitMapCharacterList_Baccrart.dart';
import 'package:flutter_main/utils/RoadPaper/Data/RoadPaperDataBase.dart';
import 'package:flutter_main/utils/RoadPaper/Data/RoadPaperEnum.dart';
import 'package:flutter_main/utils/RoadPaper/Data/RoadPaperEnum.dart';

/**
 * 百家乐问路的数据
 */
class RoadPaperBaccaratAskRoadData {
  /*该路点在百家乐路子中是哪一列*/
  int baccaratAskRoadColumn;
  /*该路点在百家乐路子中是哪一行*/
  int baccaratAskRoadRow;
  /**百家乐当前问路的结果*/
  String baccaratAskRoadResult;
  /**百家乐开奖状态，庄赢、闲赢、和局*/
  RoadPaperBaccaratAskRoadWinState baccaratAskRoadState;

  RoadPaperBaccaratAskRoadData({
    required this.baccaratAskRoadColumn,
    required this.baccaratAskRoadRow,
    required this.baccaratAskRoadResult,
    required this.baccaratAskRoadState,
  });
}

/**
 * 百家乐的路子数据
 */
class RoadPaperData_Baccarat {
  /**基础数据，路纸有多少行、多少列、组成的二维字符串等 */
  RoadPaperDataBase? baseUIData;
  /**百家乐庄问路的数据 */
  RoadPaperBaccaratAskRoadData? bankerAskInfo;
  /**百家乐闲问路的数据 */
  RoadPaperBaccaratAskRoadData? playerAskInfo;

  RoadPaperData_Baccarat({
     this.baseUIData,
     this.bankerAskInfo,
     this.playerAskInfo,
  });
}

/**
 * 百家乐的路子中单点的结果
 */
class RoadPaperSingleResultData_Baccarat {
   /**结果 -1-空白点，0庄赢，1闲赢，2是和，3庄赢且为庄6点，4是龙赢（龙虎游戏类型），5是虎赢（龙虎游戏类型），6是凤赢（龙虎游戏类型对应百家乐和）*/
  BaccaratResult result;
  /**和局数量*/
  int tieNumber;
  /**对子索引 0无对，1闲对，2庄对，3庄闲对*/
  int pairIndex;
  /**直杀 0没直杀 1直杀*/
  int zhiSha;
  /**对子值 对子类型 0非庄闲对 1非庄对闲对 2庄对非闲对 3庄闲对*/
  int pair;
  /**是否龙宝*/
  bool isDragonBouns;
  /**点数*/
  int point;
  /**是否是问路*/
  bool isAskRoad;
   /**是大还是小 */
  bool isBig;

  RoadPaperSingleResultData_Baccarat({
    required this.result,
    required this.tieNumber,
    required this.pairIndex,
    required this.zhiSha,
    required this.pair,
    required this.isDragonBouns,
    required this.point,
    required this.isAskRoad,
    required this.isBig,
  });

}
