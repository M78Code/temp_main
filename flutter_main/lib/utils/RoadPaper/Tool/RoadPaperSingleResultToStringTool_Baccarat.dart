import 'package:collection/collection.dart';
//import '../Data/RoadPaperEnum.dart';
import '../Data/RoadPaperAllBitMapCharacterList_Baccrart.dart';
import '../Data/RoadPaperData_Baccarat.dart';
import 'package:flutter_main/utils/RoadPaper/Data/RoadPaperDataBase.dart';
import 'package:flutter_main/utils/RoadPaper/Data/RoadPaperEnum.dart';
import 'package:flutter_main/utils/RoadPaper/Tool/RoadPaperUIDataTool_Baccarat.dart';




/**
 * 将单个路点的结果转换为Bitmap Font字体中对应图片所代表的文字的工具
 * 因为路子是使用的Bitmap Font一个位图字体实现的，
 * Bitmap Font就是通过将字符的ASCII/Unicode 值作为对应图片的ID进行转换
 */
class RoadPaperSingleResultToStringTool_Baccarat {
  	/**
	 * 将单个路点的结果转换为Bitmap Font字体中对应图片所代表的文字
	 * 因为路子是使用的Bitmap Font一个位图字体实现的，
	 * Bitmap Font就是通过将字符的ASCII/Unicode 值作为对应图片的ID进行转换
	 * @param curResult 结果
	 * @param roadPaperType 路子类型
	 * @returns 
	 */
  static String RoadPaperSingleResulToString(RoadPaperSingleResultData_Baccarat curResult,RoadPaperType_Baccarat roadPaperType) {
    switch (roadPaperType) {
      case RoadPaperType_Baccarat.BIG_PAIR_ROAD:
        return getBigPairRoadResultToString(curResult);
      case RoadPaperType_Baccarat.BIG_PAIR_AND_SUPER_SIX_ROAD:
        return getBigPairAndSuperSixResultToString(curResult);
      case RoadPaperType_Baccarat.MAIN_ROAD:
        return getMainRoadResultToString(curResult);
      case RoadPaperType_Baccarat.BIG_ROAD:
        return getBigRoadResultToString(curResult);
      case RoadPaperType_Baccarat.BIG_SMALL:
        return getBigSmallRoadResultToString(curResult);
      case RoadPaperType_Baccarat.DRAG_BOUNS:
        return getDragonBounsRoadResultToString(curResult);
      case RoadPaperType_Baccarat.WIN_POINT:
        return getWinPointRoadResultToString(curResult);
      case RoadPaperType_Baccarat.ZHI_SHA:
        return getZhiShaRoadResultToString(curResult);
      case RoadPaperType_Baccarat.BIG_EYE_ROAD:
        return getBigEyeRoadResultToString(curResult);
      case RoadPaperType_Baccarat.SMALL_ROAD:
        return getSmallRoadResultToString(curResult);
      case RoadPaperType_Baccarat.SMALL_Q_ROAD:
        return getSmallQRoadResultToString(curResult);
      case RoadPaperType_Baccarat.NONE:
        // TODO: Handle this case.
    }
    return '';
  }

  /**
	 * 大路带对子以及超级6路纸的单个路点的结果转换为Bitmap Font字体中对应图片所代表的文字
	 * 因为路子是使用的Bitmap Font一个位图字体实现的，
	 * Bitmap Font就是通过将字符的ASCII/Unicode 值作为对应图片的ID进行转换
	 */
  static String getBigPairAndSuperSixResultToString(RoadPaperSingleResultData_Baccarat curResult) {
    List<List<String>>? characterList;
    switch (curResult.result) {
      case BaccaratResult.BANKER_SIX:
        characterList =
            RoadPaperAllBitMapCharacterList_Baccrart.bigRoadBankerSixWin;
        break;
      case BaccaratResult.BANKER_WIN:
        characterList =
            RoadPaperAllBitMapCharacterList_Baccrart.bigRoadBankerWin;
        break;
      case BaccaratResult.PLAYER_WIN:
        characterList =
            RoadPaperAllBitMapCharacterList_Baccrart.bigRoadPlayerWin;
        break;
      case BaccaratResult.TIE:
        characterList = RoadPaperAllBitMapCharacterList_Baccrart.bigRoadTie;
        break;
      case BaccaratResult.EMPTY:
        return RoadPaperAllBitMapCharacterList_Baccrart.emptyChar;
      case BaccaratResult.DRAGON_WIN:
        // TODO: Handle this case.
      case BaccaratResult.TIGER_WIN:
        // TODO: Handle this case.
      case BaccaratResult.PHENIX_WIN:
        // TODO: Handle this case.
    }
    if (characterList != null) {
      //使用第几个是由合连续出现多少次决定的，因为合在大路是圈里加绿色的斜杠
      var index = (curResult.tieNumber >= characterList.length)? (characterList.length - 1): curResult.tieNumber;
      var pairIndex = curResult.pairIndex.clamp(0, 3);
      if (characterList[index] != null) {
        return characterList[index][pairIndex];
      }
    }
    return '';
  }

  /**
	 * 大路带对子路纸的单个路点的结果转换为Bitmap Font字体中对应图片所代表的文字
	 * 因为路子是使用的Bitmap Font一个位图字体实现的，
	 * Bitmap Font就是通过将字符的ASCII/Unicode 值作为对应图片的ID进行转换
	 */
  static String getBigPairRoadResultToString(RoadPaperSingleResultData_Baccarat curResult) {
    //某种结果所使用的位图对应字符的集合
		//比如庄赢，可能有很多种玩法的形式，有庄赢、庄赢带庄对、庄赢带庄对闲对等
    List<List<String>>? characterList;
    // print("当前路子状态为❤️${curResult.result}");
    switch (curResult.result) {
      case BaccaratResult.BANKER_SIX:
      case BaccaratResult.BANKER_WIN:
        characterList =
            RoadPaperAllBitMapCharacterList_Baccrart.bigRoadBankerWin;
        break;
      case BaccaratResult.PLAYER_WIN:
        characterList =
            RoadPaperAllBitMapCharacterList_Baccrart.bigRoadPlayerWin;
        break;
      case BaccaratResult.TIE:
        characterList = RoadPaperAllBitMapCharacterList_Baccrart.bigRoadTie;
        break;
      case BaccaratResult.EMPTY:
        return RoadPaperAllBitMapCharacterList_Baccrart.emptyChar;
      case BaccaratResult.DRAGON_WIN:

      case BaccaratResult.TIGER_WIN:

      case BaccaratResult.PHENIX_WIN:

    }
    if (characterList != null) {    
      //使用第几个是由合连续出现多少次决定的，因为合在大路是圈里加绿色的斜杠
      var index = (curResult.tieNumber >= characterList.length)? (characterList.length - 1): curResult.tieNumber;
      //获得对子类型
      var pairIndex = curResult.pairIndex.clamp(0, 3);
      if (characterList[index] != null) {
        return characterList[index][pairIndex];
      }
    }
    return '';
  }

	/**
	 * 庄闲珠盘路
	 */
  static String getMainRoadResultToString(RoadPaperSingleResultData_Baccarat curResult) {
    String resultToString = '';
    switch (curResult.result) {
      case BaccaratResult.BANKER_WIN:
        resultToString = RoadPaperAllBitMapCharacterList_Baccrart
            .mainRoadBankerWin[curResult.pairIndex];
        break;
      case BaccaratResult.PLAYER_WIN:
        resultToString = RoadPaperAllBitMapCharacterList_Baccrart
            .mainRoadPlayerWin[curResult.pairIndex];
        break;
      case BaccaratResult.BANKER_SIX:
        resultToString = RoadPaperAllBitMapCharacterList_Baccrart
            .mainRoadBankerSix[curResult.pairIndex];
        break;
      case BaccaratResult.TIE:
        resultToString = RoadPaperAllBitMapCharacterList_Baccrart
            .mainRoadTie[curResult.pairIndex];
        break;
      case BaccaratResult.DRAGON_WIN:
        resultToString =
            RoadPaperAllBitMapCharacterList_Baccrart.mainRoadOtherList[2];
        break;
      case BaccaratResult.TIGER_WIN:
        resultToString =
            RoadPaperAllBitMapCharacterList_Baccrart.mainRoadOtherList[3];
        break;
      case BaccaratResult.PHENIX_WIN:
        resultToString =
            RoadPaperAllBitMapCharacterList_Baccrart.mainRoadOtherList[4];
        break;
      case BaccaratResult.EMPTY:
        break;
    }
    return resultToString;
  }

  /**
	* 大路
	*/
  static String getBigRoadResultToString(RoadPaperSingleResultData_Baccarat curResult) {
    List<List<String>>? characterList;
    switch (curResult.result) {
      case BaccaratResult.BANKER_SIX:
      case BaccaratResult.BANKER_WIN:
        characterList =
            RoadPaperAllBitMapCharacterList_Baccrart.bigRoadBankerWin;
        break;
      case BaccaratResult.PLAYER_WIN:
        characterList =
            RoadPaperAllBitMapCharacterList_Baccrart.bigRoadPlayerWin;
        break;
      case BaccaratResult.TIE:
        characterList = RoadPaperAllBitMapCharacterList_Baccrart.bigRoadTie;
        break;
      case BaccaratResult.EMPTY:
        return RoadPaperAllBitMapCharacterList_Baccrart.emptyChar;
      case BaccaratResult.DRAGON_WIN:
        // TODO: Handle this case.
      case BaccaratResult.TIGER_WIN:
        // TODO: Handle this case.
      case BaccaratResult.PHENIX_WIN:
        // TODO: Handle this case.
    }
    if (characterList != null) {
      var index = (curResult.tieNumber >= characterList.length)
          ? (characterList.length - 1)
          : curResult.tieNumber;
      if (characterList[index] != null) {
        return characterList[index][0];
      }
    }
    return '';
  }

	/**
	 * 大小珠盘路
	 */
  static String getBigSmallRoadResultToString(RoadPaperSingleResultData_Baccarat curResult) {
    if (curResult.isAskRoad) {
      return curResult.result == BaccaratResult.BANKER_WIN ? '庄' : '闲';
    }
    if (curResult.isBig) {
      return RoadPaperAllBitMapCharacterList_Baccrart
          .bigSmallRoadBigList[curResult.pairIndex];
    }
    return RoadPaperAllBitMapCharacterList_Baccrart
        .bigSmallRoadSmallList[curResult.pairIndex];
  }

  /**
	 * 龙宝珠盘路
	*/
  static String getDragonBounsRoadResultToString(RoadPaperSingleResultData_Baccarat curResult) {
    String resultToString = '';
    switch (curResult.result) {
      case BaccaratResult.BANKER_WIN:
        resultToString = curResult.isDragonBouns
            ? RoadPaperAllBitMapCharacterList_Baccrart
                .dragonRoadBankerWinList[curResult.pairIndex]
            : RoadPaperAllBitMapCharacterList_Baccrart
                .dragonRoadBankerWinList[curResult.pairIndex + 4];
        break;
      case BaccaratResult.BANKER_SIX:
        resultToString = curResult.isDragonBouns
            ? RoadPaperAllBitMapCharacterList_Baccrart
                .dragonRoadBankerWinList[curResult.pairIndex]
            : RoadPaperAllBitMapCharacterList_Baccrart
                .dragonRoadBankerSixList[curResult.pairIndex];
        break;
      case BaccaratResult.PLAYER_WIN:
        resultToString = curResult.isDragonBouns
            ? RoadPaperAllBitMapCharacterList_Baccrart
                .dragonRoadPlayerWinList[curResult.pairIndex]
            : RoadPaperAllBitMapCharacterList_Baccrart
                .dragonRoadPlayerWinList[curResult.pairIndex + 4];
        break;
      case BaccaratResult.TIE:
        resultToString = RoadPaperAllBitMapCharacterList_Baccrart
            .dragonRoadPlayerTieList[curResult.pairIndex];
        break;
      case BaccaratResult.EMPTY:
        break;
      case BaccaratResult.DRAGON_WIN:
        // TODO: Handle this case.
      case BaccaratResult.TIGER_WIN:
        // TODO: Handle this case.
      case BaccaratResult.PHENIX_WIN:
        // TODO: Handle this case.
    }
    return resultToString;
  }

	/**
	 * 点数珠盘路
	 */
  static String getWinPointRoadResultToString(RoadPaperSingleResultData_Baccarat curResult) {
    String resultToString = '';
    switch (curResult.result) {
      case BaccaratResult.BANKER_WIN:
      case BaccaratResult.BANKER_SIX:
        resultToString = (curResult.pairIndex == 0 && curResult.isAskRoad)
            ? '庄'
            : RoadPaperAllBitMapCharacterList_Baccrart
                .winPointRoadBankerWinList[curResult.pairIndex];
        resultToString =
            resultToString.substring(curResult.point, curResult.point + 1);
        break;
      case BaccaratResult.PLAYER_WIN:
        resultToString = (curResult.pairIndex == 0 && curResult.isAskRoad)
            ? '闲'
            : RoadPaperAllBitMapCharacterList_Baccrart
                .winPointRoadPlayerWinList[curResult.pairIndex];
        resultToString =
            resultToString.substring(curResult.point, curResult.point + 1);
        break;
      case BaccaratResult.TIE:
        resultToString = RoadPaperAllBitMapCharacterList_Baccrart
            .winPointRoadTieList[curResult.pairIndex];
        resultToString =
            resultToString.substring(curResult.point, curResult.point + 1);
        break;
      case BaccaratResult.EMPTY:
        break;
      case BaccaratResult.DRAGON_WIN:
        // TODO: Handle this case.
      case BaccaratResult.TIGER_WIN:
        // TODO: Handle this case.
      case BaccaratResult.PHENIX_WIN:
        // TODO: Handle this case.
    }
    return resultToString;
  }

  /**
	 * 直杀
	*/
  static String getZhiShaRoadResultToString(RoadPaperSingleResultData_Baccarat curResult) {
    List<String> characterList =
        RoadPaperAllBitMapCharacterList_Baccrart.zhisha;
    if (curResult.zhiSha == 1) {
      return characterList[1];
    }
    return characterList[0];
  }

  /**
	 * 大眼路
	*/
  static String getBigEyeRoadResultToString(RoadPaperSingleResultData_Baccarat curResult) {
    String resultToString = '';
    switch (curResult.result) {
      case BaccaratResult.BANKER_WIN:
        return RoadPaperAllBitMapCharacterList_Baccrart.bigEyeRoadList[0];
      case BaccaratResult.PLAYER_WIN:
        return RoadPaperAllBitMapCharacterList_Baccrart.bigEyeRoadList[1];
      case BaccaratResult.EMPTY:
        return RoadPaperAllBitMapCharacterList_Baccrart.emptyChar;
      case BaccaratResult.TIE:
        // TODO: Handle this case.
      case BaccaratResult.BANKER_SIX:
        // TODO: Handle this case.
      case BaccaratResult.DRAGON_WIN:
        // TODO: Handle this case.
      case BaccaratResult.TIGER_WIN:
        // TODO: Handle this case.
      case BaccaratResult.PHENIX_WIN:
        // TODO: Handle this case.
    }
    return resultToString;
  }

	/**
	 * 小路
	 */
  static String getSmallRoadResultToString(RoadPaperSingleResultData_Baccarat curResult) {
    String resultToString = '';
    switch (curResult.result) {
      case BaccaratResult.BANKER_WIN:
        return RoadPaperAllBitMapCharacterList_Baccrart.smallRoadList[0];
      case BaccaratResult.PLAYER_WIN:
        return RoadPaperAllBitMapCharacterList_Baccrart.smallRoadList[1];
      case BaccaratResult.EMPTY:
        return RoadPaperAllBitMapCharacterList_Baccrart.emptyChar;
      case BaccaratResult.TIE:
        // TODO: Handle this case.
      case BaccaratResult.BANKER_SIX:
        // TODO: Handle this case.
      case BaccaratResult.DRAGON_WIN:
        // TODO: Handle this case.
      case BaccaratResult.TIGER_WIN:
        // TODO: Handle this case.
      case BaccaratResult.PHENIX_WIN:
        // TODO: Handle this case.
    }
    return resultToString;
  }

	/**
	 * 小强路
	 */
  static String getSmallQRoadResultToString(
      RoadPaperSingleResultData_Baccarat curResult) {
    String resultToString = '';
    switch (curResult.result) {
      case BaccaratResult.BANKER_WIN:
        return RoadPaperAllBitMapCharacterList_Baccrart.smallQRoadList[0];
      case BaccaratResult.PLAYER_WIN:
        return RoadPaperAllBitMapCharacterList_Baccrart.smallQRoadList[1];
      case BaccaratResult.EMPTY:
        return RoadPaperAllBitMapCharacterList_Baccrart.emptyChar;
      case BaccaratResult.TIE:
        // TODO: Handle this case.
      case BaccaratResult.BANKER_SIX:
        // TODO: Handle this case.
      case BaccaratResult.DRAGON_WIN:
        // TODO: Handle this case.
      case BaccaratResult.TIGER_WIN:
        // TODO: Handle this case.
      case BaccaratResult.PHENIX_WIN:
        // TODO: Handle this case.
    }
    return resultToString;
  }


    /**
     * 百家乐问路时，该路点显示的结果
     * @param curResult 当前问路的单个数据 
     * @param roadPaperType 路纸类型
     * @param flag 
     * @returns 
     */
  static String AskRoadPaperSingleResulToString(
      RoadPaperSingleResultData_Baccarat curResult,
      RoadPaperType_Baccarat roadPaperType) {
    if (roadPaperType == RoadPaperType_Baccarat.MAIN_ROAD ||
        roadPaperType == RoadPaperType_Baccarat.DRAG_BOUNS ||
        roadPaperType == RoadPaperType_Baccarat.WIN_POINT) {
      if (roadPaperType == RoadPaperType_Baccarat.MAIN_ROAD) {
        return RoadPaperAllBitMapCharacterList_Baccrart.baccaratAskRoad[
            curResult.result == BaccaratResult.BANKER_WIN ? 0 : 1];
      } else {
        return RoadPaperAllBitMapCharacterList_Baccrart.baccaratDWAskRoad[
            curResult.result == BaccaratResult.BANKER_WIN ? 0 : 1];
      }
    } else {
      return RoadPaperSingleResulToString(curResult, roadPaperType);
    }
  }


}
