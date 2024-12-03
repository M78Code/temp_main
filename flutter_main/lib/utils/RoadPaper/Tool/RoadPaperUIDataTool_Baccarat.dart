import '../Data/RoadPaperDataBase.dart';
import '../Data/RoadPaperEnum.dart';
import '../Data/RoadPaperData_Baccarat.dart';
import 'RoadPaperParseBytesTool.dart';
import 'RoadPaperSingleResultToStringTool_Baccarat.dart';

/**
 * 服务器下发的路子base64数据转换为UI数据的工具
 */
class RoadPaperUIDataTool_Baccarat {

  /**
  * 路纸最大行数，所有都是统一的，人为规定死的
  */
  static int RoadPaperMaxRowCount = 6;


  /**
   * 获得百家乐型游戏的UI显示所需路子数据
   * @param ServiceContent 服务器下发的roadinfo里面各个路子数据中的content Base64加密数据
   */
  /*
  static RoadPaperData_Baccarat? GetRoadPaperUIData(String serviceContent, RoadPaperType_Baccarat roadPaperType) {
    //需要返回的百家乐路子数据
    RoadPaperData_Baccarat  baccaratBigPairRoadData = RoadPaperData_Baccarat(
      baseUIData: RoadPaperDataBase(content: '',version: 0,allRoadPaperTextList: [[]]),
      bankerAskInfo: RoadPaperBaccaratAskRoadData(
        baccaratAskRoadColumn: 0,
        baccaratAskRoadRow: 0,
        baccaratAskRoadResult: '',
        baccaratAskRoadState: RoadPaperBaccaratAskRoadWinState.BANKER_WIN,  // 示例默认状态
      ),
      playerAskInfo: RoadPaperBaccaratAskRoadData(
        baccaratAskRoadColumn: 0,
        baccaratAskRoadRow: 0,
        baccaratAskRoadResult: '',
        baccaratAskRoadState: RoadPaperBaccaratAskRoadWinState.PLAYER_WIN,  // 示例默认状态
      ),
    );

    if (serviceContent.isEmpty) {
      return  baccaratBigPairRoadData;
    }

    //将服务器的contentBaset64解密为二进制文件
    RoadPaperParseBytesTool roadUtils = RoadPaperParseBytesTool(serviceContent);
    //路子版本号 暂时用不上后续补充，但是此步必须做不可跳过
    baccaratBigPairRoadData.baseUIData?.version = roadUtils.getNextInteger(8);
    // baccaratBigPairRoadData?.baseUIData?.version = roadUtils.getNextInteger(8);
    //行数
    int row = roadUtils.getNextInteger(8);
    //列数
    int col = roadUtils.getNextInteger(8);
    //路子里面的路点总共个数，总局数
    int totalRound = row * col;
    //是否该点为空
    int isEmpty = 0;
    //路子的各个点完整字符数据
    List<List<String>> paperUIShowData = [];
    //路子每一列的数据
    List<String> list = [];
    while (totalRound > 0) {
      RoadPaperSingleResultData_Baccarat BaccaratSingleResult =
      getNewRoadPaperSingleResultData();
      isEmpty = roadUtils.getNextInteger(1);
      if (list.length >= RoadPaperMaxRowCount) {
        list = [];
        paperUIShowData.add(list);
      }
      //#region  不同类型的路子单点结果二进制解析不同
      switch (roadPaperType) {
        case RoadPaperType_Baccarat.MAIN_ROAD:
          if (isEmpty == 1) {
            BaccaratSingleResult.result = BaccaratResult.values[roadUtils.getNextInteger(2)];
            BaccaratSingleResult.pair = roadUtils.getNextInteger(2);
          } else {
            roadUtils.getNextInteger(4);
          }
          break;
        case RoadPaperType_Baccarat.BIG_SMALL:
          if (isEmpty == 1) {
            BaccaratSingleResult.isBig = roadUtils.getNextInteger(2) == 1;
            BaccaratSingleResult.result = BaccaratResult.values[roadUtils.getNextInteger(2)];
            BaccaratSingleResult.pair = roadUtils.getNextInteger(2);
          } else {
            roadUtils.getNextInteger(6);
          }
          break;
        case RoadPaperType_Baccarat.DRAG_BOUNS:
          if (isEmpty == 1) {
            BaccaratSingleResult.isDragonBouns =
                roadUtils.getNextInteger(1) == 1;
            BaccaratSingleResult.result = BaccaratResult.values[roadUtils.getNextInteger(2)];
            BaccaratSingleResult.pair = roadUtils.getNextInteger(2);
          } else {
            roadUtils.getNextInteger(5);
          }
          break;
        case RoadPaperType_Baccarat.WIN_POINT:
          if (isEmpty == 1) {
            BaccaratSingleResult.point = roadUtils.getNextInteger(4);
            BaccaratSingleResult.result = BaccaratResult.values[roadUtils.getNextInteger(2)];
            BaccaratSingleResult.pair = roadUtils.getNextInteger(2);
          } else {
            roadUtils.getNextInteger(8);
          }
          break;
        case RoadPaperType_Baccarat.BIG_ROAD:
          if (isEmpty == 1) {
            BaccaratSingleResult.result = BaccaratResult.values[roadUtils.getNextInteger(2)];
            BaccaratSingleResult.tieNumber = roadUtils.getNextInteger(4);
          } else {
            roadUtils.getNextInteger(6);
          }
          break;
        case RoadPaperType_Baccarat.BIG_PAIR_AND_SUPER_SIX_ROAD:


        case RoadPaperType_Baccarat.BIG_PAIR_ROAD:
          if (isEmpty == 1) {
            var value = roadUtils.getNextInteger(2);
            BaccaratSingleResult.result =  BaccaratResult.fromValue(value);
            BaccaratSingleResult.tieNumber = roadUtils.getNextInteger(4);
            BaccaratSingleResult.pairIndex = roadUtils.getNextInteger(2);
          } else {
            // print("这里的index取的是8❤️");
            roadUtils.getNextInteger(8);
          }
          break;
        case RoadPaperType_Baccarat.ZHI_SHA:
          if (isEmpty == 1) {
            var value = roadUtils.getNextInteger(2);
            BaccaratSingleResult.result = BaccaratResult.fromValue(value);
            BaccaratSingleResult.tieNumber = roadUtils.getNextInteger(4);
            BaccaratSingleResult.pairIndex = roadUtils.getNextInteger(2);
            BaccaratSingleResult.zhiSha = roadUtils.getNextInteger(1);
          } else {
            roadUtils.getNextInteger(9);
          }
          break;
        case RoadPaperType_Baccarat.SMALL_ROAD:
        case RoadPaperType_Baccarat.BIG_EYE_ROAD:
        case RoadPaperType_Baccarat.SMALL_Q_ROAD:
          int resultValue = roadUtils.getNextInteger(1);
          BaccaratSingleResult.result =
          (isEmpty == 1) ? BaccaratResult.values[resultValue] : BaccaratSingleResult.result ;
          break;
        case RoadPaperType_Baccarat.NONE:
        // TODO: Handle this case.
      }
      //#endregion
      //讲单点结果存入list，list为路纸中的一列
      if (BaccaratSingleResult.result == BaccaratResult.EMPTY) {
        list.add("");
        // print("当前转出的列表是❤️❤️");

      } else {
        var a = RoadPaperSingleResultToStringTool_Baccarat
            .RoadPaperSingleResulToString(BaccaratSingleResult, roadPaperType);
        //需要把当前路子的结果转换为需要路子上显示的
        list.add(RoadPaperSingleResultToStringTool_Baccarat
            .RoadPaperSingleResulToString(BaccaratSingleResult, roadPaperType));
        // print("当前转出的列表是❤️${a.toString()}");
      }
      totalRound--;
    }
    baccaratBigPairRoadData.baseUIData?.allRoadPaperTextList = paperUIShowData;
    addAskRoadData(baccaratBigPairRoadData, roadPaperType, roadUtils);
    return baccaratBigPairRoadData;
  } */

  static RoadPaperData_Baccarat? GetRoadPaperUIData(String serviceContent, RoadPaperType_Baccarat roadPaperType) {
    //需要返回的百家乐路子数据
    RoadPaperData_Baccarat  baccaratBigPairRoadData = RoadPaperData_Baccarat(
      baseUIData: RoadPaperDataBase(content: '',version: 0,allRoadPaperTextList: [[]]),
      bankerAskInfo: RoadPaperBaccaratAskRoadData(
        baccaratAskRoadColumn: 0,
        baccaratAskRoadRow: 0,
        baccaratAskRoadResult: '',
        baccaratAskRoadState: RoadPaperBaccaratAskRoadWinState.BANKER_WIN,  // 示例默认状态
      ),
      playerAskInfo: RoadPaperBaccaratAskRoadData(
        baccaratAskRoadColumn: 0,
        baccaratAskRoadRow: 0,
        baccaratAskRoadResult: '',
        baccaratAskRoadState: RoadPaperBaccaratAskRoadWinState.PLAYER_WIN,  // 示例默认状态
      ),
    );

    if (serviceContent.isEmpty) {
      return  baccaratBigPairRoadData;
    }

    //将服务器的contentBaset64解密为二进制文件
    RoadPaperParseBytesTool roadUtils = RoadPaperParseBytesTool(serviceContent);
    //路子版本号 暂时用不上后续补充，但是此步必须做不可跳过
    baccaratBigPairRoadData.baseUIData?.version = roadUtils.getNextInteger(8);
    // baccaratBigPairRoadData?.baseUIData?.version = roadUtils.getNextInteger(8);
    //行数
    int row = roadUtils.getNextInteger(8);
    //列数
    int col = roadUtils.getNextInteger(8);
    //路子里面的路点总共个数，总局数
    int totalRound = row * col;
    //是否该点为空
    int isEmpty = 0;
    //路子的各个点完整字符数据
    List<List<String>> paperUIShowData = [];
    //路子每一列的数据
    List<String> list = [];
    while (totalRound > 0) {
      RoadPaperSingleResultData_Baccarat BaccaratSingleResult =
      getNewRoadPaperSingleResultData();
      isEmpty = roadUtils.getNextInteger(1);
      if (list.length >= RoadPaperMaxRowCount) {
        list = [];
        paperUIShowData.add(list);
      }
      //#region  不同类型的路子单点结果二进制解析不同
      switch (roadPaperType) {
        case RoadPaperType_Baccarat.MAIN_ROAD:
          if (isEmpty == 1) {
            var resultValue = roadUtils.getNextInteger(2);
            BaccaratSingleResult.result = BaccaratResult.fromValue(resultValue);
            BaccaratSingleResult.pair = roadUtils.getNextInteger(2);
          } else {
            roadUtils.getNextInteger(4);
          }
          break;
        case RoadPaperType_Baccarat.BIG_SMALL:
          if (isEmpty == 1) {
            var resultValue = roadUtils.getNextInteger(2);
            BaccaratSingleResult.isBig = roadUtils.getNextInteger(2) == 1;
            BaccaratSingleResult.result = BaccaratResult.fromValue(resultValue);
            BaccaratSingleResult.pair = roadUtils.getNextInteger(2);
          } else {
            roadUtils.getNextInteger(6);
          }
          break;
        case RoadPaperType_Baccarat.DRAG_BOUNS:
          if (isEmpty == 1) {
            var resultValue = roadUtils.getNextInteger(2);
            BaccaratSingleResult.isDragonBouns =
                roadUtils.getNextInteger(1) == 1;
            BaccaratSingleResult.result = BaccaratResult.fromValue(resultValue);
            BaccaratSingleResult.pair = roadUtils.getNextInteger(2);
          } else {
            roadUtils.getNextInteger(5);
          }
          break;
        case RoadPaperType_Baccarat.WIN_POINT:
          if (isEmpty == 1) {
            var resultValue = roadUtils.getNextInteger(2);
            BaccaratSingleResult.point = roadUtils.getNextInteger(4);
            BaccaratSingleResult.result = BaccaratResult.fromValue(resultValue);
            BaccaratSingleResult.pair = roadUtils.getNextInteger(2);
          } else {
            roadUtils.getNextInteger(8);
          }
          break;
        case RoadPaperType_Baccarat.BIG_ROAD:
          if (isEmpty == 1) {
            var resultValue = roadUtils.getNextInteger(2);
            BaccaratSingleResult.result = BaccaratResult.fromValue(resultValue);
            BaccaratSingleResult.tieNumber = roadUtils.getNextInteger(4);
          } else {
            roadUtils.getNextInteger(6);
          }
          break;
        case RoadPaperType_Baccarat.BIG_PAIR_AND_SUPER_SIX_ROAD:


        case RoadPaperType_Baccarat.BIG_PAIR_ROAD:
          if (isEmpty == 1) {
            var resultValue = roadUtils.getNextInteger(2);
            BaccaratSingleResult.result =  BaccaratResult.fromValue(resultValue);
            BaccaratSingleResult.tieNumber = roadUtils.getNextInteger(4);
            BaccaratSingleResult.pairIndex = roadUtils.getNextInteger(2);
          } else {
            // print("这里的index取的是8❤️");
            roadUtils.getNextInteger(8);
          }
          break;
        case RoadPaperType_Baccarat.ZHI_SHA:
          if (isEmpty == 1) {
            var resultValue = roadUtils.getNextInteger(2);
            BaccaratSingleResult.result = BaccaratResult.fromValue(resultValue);
            BaccaratSingleResult.tieNumber = roadUtils.getNextInteger(4);
            BaccaratSingleResult.pairIndex = roadUtils.getNextInteger(2);
            BaccaratSingleResult.zhiSha = roadUtils.getNextInteger(1);
          } else {
            roadUtils.getNextInteger(9);
          }
          break;
          /// 这三个是否一样 待与 亚新  确认
        case RoadPaperType_Baccarat.SMALL_ROAD:
          int resultValue = roadUtils.getNextInteger(1);
          BaccaratSingleResult.result =
          (isEmpty == 1) ? BaccaratResult.fromValue(resultValue) : BaccaratSingleResult.result ;
          break;
        case RoadPaperType_Baccarat.BIG_EYE_ROAD:
          int resultValue = roadUtils.getNextInteger(1);
          BaccaratSingleResult.result =
          (isEmpty == 1) ? BaccaratResult.fromValue(resultValue) : BaccaratSingleResult.result ;
          break;
        case RoadPaperType_Baccarat.SMALL_Q_ROAD:
          int resultValue = roadUtils.getNextInteger(1);
          BaccaratSingleResult.result =
          (isEmpty == 1) ? BaccaratResult.fromValue(resultValue) : BaccaratSingleResult.result ;
          break;
        case RoadPaperType_Baccarat.NONE:
        // TODO: Handle this case.
      }
      //#endregion
      //讲单点结果存入list，list为路纸中的一列
      if (BaccaratSingleResult.result == BaccaratResult.EMPTY) {
        list.add("");
        // print("当前转出的列表是❤️❤️");

      } else {
        var a = RoadPaperSingleResultToStringTool_Baccarat
            .RoadPaperSingleResulToString(BaccaratSingleResult, roadPaperType);
        //需要把当前路子的结果转换为需要路子上显示的
        list.add(RoadPaperSingleResultToStringTool_Baccarat
            .RoadPaperSingleResulToString(BaccaratSingleResult, roadPaperType));
        // print("当前转出的列表是❤️${a.toString()}");
      }
      totalRound--;
    }
    baccaratBigPairRoadData.baseUIData?.allRoadPaperTextList = paperUIShowData;
    addAskRoadData(baccaratBigPairRoadData, roadPaperType, roadUtils);
    return baccaratBigPairRoadData;
  }


	/**
	 * 增加问路数据
	 * @param baccaratRoadInfo  RoadPaperData_Baccarat
	 */
  static void addAskRoadData(RoadPaperData_Baccarat baccaratRoadInfo,RoadPaperType_Baccarat roadPaperType, RoadPaperParseBytesTool roadUtils) {
    RoadPaperBaccaratAskRoadData BankerAskRoadInfo =
        parseAskRoadInfo(roadPaperType, roadUtils);
    baccaratRoadInfo.bankerAskInfo = BankerAskRoadInfo;
    RoadPaperBaccaratAskRoadData PlayerAskRoadInfo =
        parseAskRoadInfo(roadPaperType, roadUtils);
    baccaratRoadInfo.playerAskInfo = PlayerAskRoadInfo;
  }




  /**
   * 获得每次问路的数据这里需要移动二进制
   * @param roadPaperType
   * @param roadUtils
   * @returns
   */
  static RoadPaperBaccaratAskRoadData parseAskRoadInfo(
      RoadPaperType_Baccarat roadPaperType, RoadPaperParseBytesTool roadUtils) {

    /*该路点在百家乐路子中是哪一列*/
    int baccaratAskRoadColumn;
    /*该路点在百家乐路子中是哪一行*/
    int baccaratAskRoadRow;
    /**百家乐当前问路的结果*/
    String baccaratAskRoadResult;
    /**百家乐开奖状态，庄赢、闲赢、和局*/
    RoadPaperBaccaratAskRoadWinState baccaratAskRoadState;
    // RoadPaperBaccaratAskRoadData
    RoadPaperBaccaratAskRoadData askRoadInfo = RoadPaperBaccaratAskRoadData
      (baccaratAskRoadColumn: 0,
      baccaratAskRoadRow: 0,
      baccaratAskRoadResult: "",
      baccaratAskRoadState: RoadPaperBaccaratAskRoadWinState.BANKER_WIN,
    );
    askRoadInfo.baccaratAskRoadRow = roadUtils.getNextInteger(8);
    askRoadInfo.baccaratAskRoadColumn = roadUtils.getNextInteger(8);
    int resultNumber = roadUtils.getNextInteger(1);
    RoadPaperSingleResultData_Baccarat BaccaratSingleResult =
    getNewRoadPaperSingleResultData();
    BaccaratResult ResultType = (resultNumber == 1)
        ? BaccaratResult.BANKER_WIN
        : BaccaratResult.PLAYER_WIN;
    BaccaratSingleResult.result = ResultType;
    askRoadInfo.baccaratAskRoadResult =
        RoadPaperSingleResultToStringTool_Baccarat
            .AskRoadPaperSingleResulToString(
            BaccaratSingleResult, roadPaperType);
    if (resultNumber == 1) {
      askRoadInfo.baccaratAskRoadState =
          RoadPaperBaccaratAskRoadWinState.BANKER_WIN;
    } else {
      askRoadInfo.baccaratAskRoadState =
          RoadPaperBaccaratAskRoadWinState.PLAYER_WIN;
    }
    return askRoadInfo;
  }


  /**
	 * 重置每一局百家乐的结果数据
	 * @param baccaratSingleResul 
	 */
  static RoadPaperSingleResultData_Baccarat getNewRoadPaperSingleResultData() {
    // RoadPaperSingleResultData_Baccarat
    RoadPaperSingleResultData_Baccarat baccaratSingleResult =
        RoadPaperSingleResultData_Baccarat(
            result: BaccaratResult.EMPTY,
            tieNumber: 0,
            pairIndex: 0,
            zhiSha: 0,
            pair: 0,
            isDragonBouns: false,
            point: 0,
            isAskRoad: false,
            isBig: false);
    return baccaratSingleResult;
  }
}
