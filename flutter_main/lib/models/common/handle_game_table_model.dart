import 'package:flutter_main/models/common/bet_point_limit.dart';
import 'package:flutter_main/models/common/bet_point_limit_info_model.dart';
import 'package:flutter_main/models/common/game_table_info_model.dart';
import 'package:flutter_main/models/event_model/update_event.dart';
import 'package:flutter_main/models/ws/ws_10074_model.dart';
import 'package:flutter_main/utils/utils.dart';

///todo弃用类
class HandleGameTableModel {
  static final HandleGameTableModel _instance =
      HandleGameTableModel._internal();

  factory HandleGameTableModel() {
    return _instance;
  }

  HandleGameTableModel._internal();

  /// 当前打开的桌台 id
  int mCurrentTableId = 0;

  /// 项目缓存的最新桌台集合 map
  Map<String, GameTableInfoModel> mGameTableMap = {};

  /// 当前打开的桌台  信息实体
  GameTableInfoModel? mCurrentGameTableInfoModel;

  /// 缓存全局玩法限制数据 key为 gameTypeId 大玩法
  /// 玩法牌靴限制数据，用于下注，带玩法限制
  Map<String, Ws10074Model> mBootNumberLimitMap = {};

  /// 更新map列表 全局维护的 gameTableMap 替换更新
  void updateGameTableMap(Map<String, dynamic> gameTableMap,
      {bool isClear = true}) {
    if (isClear) {
      // mGameTableMap.clear();
    }

    var keysTableIdList = gameTableMap.keys.toList();

    // 遍历 拿到数据内容
    for (var tableId in keysTableIdList) {
      // 所有的数据内容组合
      Map<String, dynamic> dict = gameTableMap[tableId];
      var gameTableInfoModel = GameTableInfoModel.fromJson(dict);

      LogUtil.log("--gameTableMap--bootNumberLimitList=${gameTableInfoModel.bootNumberLimitList}");
      LogUtil.log("--gameTableMap--myBetPointLimitInfoMap=${gameTableInfoModel.myBetPointLimitInfoMap}");
      LogUtil.log("--gameTableMap--betPointLimit=${gameTableInfoModel.betPointLimit}");
      LogUtil.log("--gameTableMap--tableId=${gameTableInfoModel.tableId}");

      var myBetPointLimitInfoModel = updateMyBetPointLimitInfoModel(
          tableId, gameTableInfoModel.betPointLimit,
          isUpdateMap: false);
      if (myBetPointLimitInfoModel != null) {
        gameTableInfoModel.myBetPointLimitInfoMap = myBetPointLimitInfoModel;
      }

      if (isClear) {
        mGameTableMap[tableId] = gameTableInfoModel;
      } else {
        if (mGameTableMap.containsKey(tableId)) {
          updateGameTableInfoModel(gameTableInfoModel);
        } else {
          mGameTableMap[tableId] = gameTableInfoModel;
        }
      }
    }

    EventBusUtil.fire(UpdateEvent(UpdateEvent.TABLE_INFO_MAP_EVENT));
  }

  void updateGameTableInfoModel(GameTableInfoModel wsGameTableInfoModel) {
    var tableId = wsGameTableInfoModel.tableId ?? 0;
    var oldGameTableMap = mGameTableMap[tableId.toString()]!;

    if (wsGameTableInfoModel.gameCasinoId != null) {
      oldGameTableMap.gameCasinoId = wsGameTableInfoModel.gameCasinoId;
    }
    if (wsGameTableInfoModel.gameCasinoName != null) {
      oldGameTableMap.gameCasinoName = wsGameTableInfoModel.gameCasinoName;
    }
    if (wsGameTableInfoModel.tableNameLanguageMap != null) {
      oldGameTableMap.tableNameLanguageMap =
          wsGameTableInfoModel.tableNameLanguageMap;
    }
    if (wsGameTableInfoModel.physicsTableNo != null) {
      oldGameTableMap.physicsTableNo = wsGameTableInfoModel.physicsTableNo;
    }
    if (wsGameTableInfoModel.gameStatus != null) {
      oldGameTableMap.gameStatus = wsGameTableInfoModel.gameStatus;
    }
    if (wsGameTableInfoModel.tableOpen != null) {
      oldGameTableMap.tableOpen = wsGameTableInfoModel.tableOpen;
    }
    if (wsGameTableInfoModel.gameTypeId != null) {
      oldGameTableMap.gameTypeId = wsGameTableInfoModel.gameTypeId;
    }
    if (wsGameTableInfoModel.gameTypeName != null) {
      oldGameTableMap.gameTypeName = wsGameTableInfoModel.gameTypeName;
    }
    if (wsGameTableInfoModel.dealerId != null) {
      oldGameTableMap.dealerId = wsGameTableInfoModel.dealerId;
    }
    if (wsGameTableInfoModel.dealerName != null) {
      oldGameTableMap.dealerName = wsGameTableInfoModel.dealerName;
    }
    if (wsGameTableInfoModel.dealerPic != null) {
      oldGameTableMap.dealerPic = wsGameTableInfoModel.dealerPic;
    }
    if (wsGameTableInfoModel.dealerEntertainPic != null) {
      oldGameTableMap.dealerEntertainPic =
          wsGameTableInfoModel.dealerEntertainPic;
    }
    if (wsGameTableInfoModel.dealerCountry != null) {
      oldGameTableMap.dealerCountry = wsGameTableInfoModel.dealerCountry;
    }
    if (wsGameTableInfoModel.roundId != null) {
      oldGameTableMap.roundId = wsGameTableInfoModel.roundId;
    }
    if (wsGameTableInfoModel.countdownEndTime != null) {
      oldGameTableMap.countdownEndTime = wsGameTableInfoModel.countdownEndTime;
    }
    if (wsGameTableInfoModel.totalBetCountDown != null) {
      oldGameTableMap.totalBetCountDown =
          wsGameTableInfoModel.totalBetCountDown;
    }
    if (wsGameTableInfoModel.serverTime != null) {
      oldGameTableMap.serverTime = wsGameTableInfoModel.serverTime;
    }
    if (wsGameTableInfoModel.bootNo != null) {
      oldGameTableMap.bootNo = wsGameTableInfoModel.bootNo;
    }
    if (wsGameTableInfoModel.tableOnline != null) {
      oldGameTableMap.tableOnline = wsGameTableInfoModel.tableOnline;
    }
    if (wsGameTableInfoModel.goodRoads != null) {
      oldGameTableMap.goodRoads = wsGameTableInfoModel.goodRoads;
    }
    if (wsGameTableInfoModel.roadPaper != null) {
      oldGameTableMap.roadPaper = wsGameTableInfoModel.roadPaper;
    }
    if (wsGameTableInfoModel.bootReport != null) {
      oldGameTableMap.bootReport = wsGameTableInfoModel.bootReport;
    }
    if (wsGameTableInfoModel.gameFlag != null) {
      oldGameTableMap.gameFlag = wsGameTableInfoModel.gameFlag;
    }
    if (wsGameTableInfoModel.playerTableBetLimit != null) {
      oldGameTableMap.playerTableBetLimit =
          wsGameTableInfoModel.playerTableBetLimit;
    }
    if (wsGameTableInfoModel.videoUrl != null) {
      oldGameTableMap.videoUrl = wsGameTableInfoModel.videoUrl;
    }
    if (wsGameTableInfoModel.lastUpdateTableCacheTime != null) {
      oldGameTableMap.lastUpdateTableCacheTime =
          wsGameTableInfoModel.lastUpdateTableCacheTime;
    }
    if (wsGameTableInfoModel.goodRoadPoints != null) {
      oldGameTableMap.goodRoadPoints = wsGameTableInfoModel.goodRoadPoints;
    }
    if (wsGameTableInfoModel.dealerLoginOut != null) {
      oldGameTableMap.dealerLoginOut = wsGameTableInfoModel.dealerLoginOut;
    }
    if (wsGameTableInfoModel.dealerPicInstant != null) {
      oldGameTableMap.dealerPicInstant = wsGameTableInfoModel.dealerPicInstant;
    }
    if (wsGameTableInfoModel.dealerPicTable != null) {
      oldGameTableMap.dealerPicTable = wsGameTableInfoModel.dealerPicTable;
    }
    if (wsGameTableInfoModel.tableColour != null) {
      oldGameTableMap.tableColour = wsGameTableInfoModel.tableColour;
    }
    if (wsGameTableInfoModel.tableInfoVersion != null) {
      oldGameTableMap.tableInfoVersion = wsGameTableInfoModel.tableInfoVersion;
    }
    if (wsGameTableInfoModel.roadPaperVersion != null) {
      oldGameTableMap.roadPaperVersion = wsGameTableInfoModel.roadPaperVersion;
    }
    if (wsGameTableInfoModel.bootReportVersion != null) {
      oldGameTableMap.bootReportVersion =
          wsGameTableInfoModel.bootReportVersion;
    }
    if (wsGameTableInfoModel.betPointLimitVersion != null) {
      oldGameTableMap.betPointLimitVersion =
          wsGameTableInfoModel.betPointLimitVersion;
    }
    if (wsGameTableInfoModel.bootNumberLimitListVersion != null) {
      oldGameTableMap.bootNumberLimitListVersion =
          wsGameTableInfoModel.bootNumberLimitListVersion;
    }
    if (wsGameTableInfoModel.openStatus != null) {
      oldGameTableMap.openStatus = wsGameTableInfoModel.openStatus;
    }
    if (wsGameTableInfoModel.roadPaperFlag != null) {
      oldGameTableMap.roadPaperFlag = wsGameTableInfoModel.roadPaperFlag;
    }
    if (wsGameTableInfoModel.betPointLimit != null) {
      oldGameTableMap.betPointLimit = wsGameTableInfoModel.betPointLimit;
    }
    if (wsGameTableInfoModel.stage2BettingFlag != null) {
      oldGameTableMap.stage2BettingFlag =
          wsGameTableInfoModel.stage2BettingFlag;
    }
    if (wsGameTableInfoModel.dealCardMode != null) {
      oldGameTableMap.dealCardMode = wsGameTableInfoModel.dealCardMode;
    }
    if (wsGameTableInfoModel.dealerNameLanguageMap != null) {
      oldGameTableMap.dealerNameLanguageMap =
          wsGameTableInfoModel.dealerNameLanguageMap;
    }
    if (wsGameTableInfoModel.noticeWord != null) {
      oldGameTableMap.noticeWord = wsGameTableInfoModel.noticeWord;
    }
    if (wsGameTableInfoModel.clientTime != null) {
      oldGameTableMap.clientTime = wsGameTableInfoModel.clientTime;
    }
    if (wsGameTableInfoModel.roadInfo != null) {
      oldGameTableMap.roadInfo = wsGameTableInfoModel.roadInfo;
    }
    if (wsGameTableInfoModel.bootNumberLimitList != null) {
      oldGameTableMap.bootNumberLimitList =
          wsGameTableInfoModel.bootNumberLimitList;
    }
    if (wsGameTableInfoModel.betPointLimitMap != null) {
      oldGameTableMap.betPointLimitMap = wsGameTableInfoModel.betPointLimitMap;
    }
    if (wsGameTableInfoModel.maxGoodRoad != null) {
      oldGameTableMap.maxGoodRoad = wsGameTableInfoModel.maxGoodRoad;
    }
    if (wsGameTableInfoModel.timestamp != null) {
      oldGameTableMap.timestamp = wsGameTableInfoModel.timestamp;
    }
    if (wsGameTableInfoModel.isSwitchGameList != null) {
      oldGameTableMap.isSwitchGameList = wsGameTableInfoModel.isSwitchGameList;
    }
    if (wsGameTableInfoModel.isGood != null) {
      oldGameTableMap.isGood = wsGameTableInfoModel.isGood;
    }
    if (wsGameTableInfoModel.myBetPointLimitInfoMap != null) {
      oldGameTableMap.myBetPointLimitInfoMap =
          wsGameTableInfoModel.myBetPointLimitInfoMap;
    }
  }

  /// 更新map列表
  /// mBootNumberLimitMap
  updateBootNumberLimitMap(Map<String, dynamic> map, {bool isClear = true}) {
    if (isClear) {
      mBootNumberLimitMap.clear();
    }

    var keysGameTypeIdList = map.keys.toList();
    for (var gameTypeId in keysGameTypeIdList) {
      Map<String, dynamic> dict = map[gameTypeId];
      var bootLimitInfoModel = Ws10074Model.fromJson(dict);
      updateBootNumberLimitModel(bootLimitInfoModel);
    }
  }

  /// 更新map列表
  /// mBootNumberLimitMap
  updateBootNumberLimitModel(Ws10074Model bootLimitInfoModel) {
    var gameTypeId = bootLimitInfoModel.gameTypeId ?? 0;
    if (0 == gameTypeId) {
      return;
    }

    /// 判断全局玩法限制数据
    if (mBootNumberLimitMap.containsKey(gameTypeId.toString())) {
      var bootNumberLimitListVersion =
          mBootNumberLimitMap[gameTypeId.toString()]
                  ?.bootNumberLimitListVersion ??
              0;
      var bootNumberLimitListVersion2 =
          bootLimitInfoModel.bootNumberLimitListVersion ?? 0;
      if (bootNumberLimitListVersion2 > bootNumberLimitListVersion) {
        mBootNumberLimitMap[gameTypeId.toString()] = bootLimitInfoModel;
      }
    } else {
      mBootNumberLimitMap[gameTypeId.toString()] = bootLimitInfoModel;
    }
  }

  /// 通过 List<BetPointLimit> 比对 mBootNumberLimitMap 组装 table 下的 小玩法 限制数据体
  updateMyBetPointLimitInfoModel(
      String tableId, List<BetPointLimit>? betPointLimitList,
      {bool isUpdateMap = false}) {
    if (betPointLimitList == null || betPointLimitList.isEmpty) {
      return null;
    }

    // 不存在当前玩法 桌台 直接返回
    if (!mGameTableMap.containsKey(tableId)) {
      return null;
    }

    var gameTable = mGameTableMap[tableId];

    var gameTypeId = gameTable?.gameTypeId ?? 0;

    if (0 == gameTypeId) {
      return null;
    }

    // 通过大玩法 获取boot 限制数据
    if (!mBootNumberLimitMap.containsKey(gameTypeId.toString())) {
      return null;
    }

    var bootNumberLimitMap = mBootNumberLimitMap[gameTypeId.toString()];

    var bootNumberLimitList = bootNumberLimitMap?.list ?? [];

    if (bootNumberLimitList.isEmpty) {
      return null;
    }

    Map<String, BetPointLimitInfoModel> myBetPointLimitInfoMap = {};

    for (var bootLimitInfoModel in bootNumberLimitList) {
      for (var betPointLimit in betPointLimitList) {
        if (bootLimitInfoModel.groupId == betPointLimit.groupId) {
          var betPointLimitInfoModel = BetPointLimitInfoModel();
          betPointLimitInfoModel.betPointGroup =
              betPointLimit.betPointGroup ?? '';
          betPointLimitInfoModel.groupId = bootLimitInfoModel.groupId ?? 0;
          betPointLimitInfoModel.status = bootLimitInfoModel.status ?? 0;
          betPointLimitInfoModel.min = betPointLimit.min ?? 0;
          betPointLimitInfoModel.max = betPointLimit.max ?? 0;
          betPointLimitInfoModel.betLimitCount =
              bootLimitInfoModel.bootLimitCount ?? 0;
          betPointLimitInfoModel.playRate = bootLimitInfoModel.playRate ?? '';

          var betPointId = bootLimitInfoModel.betPointId ?? 0;
          if (0 != betPointId) {
            myBetPointLimitInfoMap[betPointId.toString()] =
                betPointLimitInfoModel;
          }
        }
      }
    }

    if (isUpdateMap) {
      gameTable?.myBetPointLimitInfoMap = myBetPointLimitInfoMap;
    }

    return myBetPointLimitInfoMap;
  }
}

class HandleGameTableInfoModel {
  int? tableId;
  int? gameCasinoId;
  String? gameCasinoName;
  String? tableName;
  TableNameLanguageMap? tableNameLanguageMap;
  String? physicsTableNo;
  int? gameStatus;
  bool? tableOpen;
  int? gameTypeId;
  String? gameTypeName;
  int? dealerId;
  String? dealerName;

  /// 荷官模式 的主播头像
  String? dealerPic;
  String? dealerEntertainPic;
  String? dealerCountry;
  int? roundId;
  int? countdownEndTime;
  int? totalBetCountDown;
  int? serverTime;
  String? bootNo;
  /**在线人数*/
  TableOnline? tableOnline;
  int? goodRoads;
  /**路纸的具体数据*/
  RoadPaper? roadPaper;
  BootReport? bootReport;
  int? gameFlag;
  PlayerTableBetLimit? playerTableBetLimit;
  String? videoUrl;
  int? lastUpdateTableCacheTime;
  List<MaxGoodRoad>? goodRoadPoints;
  int? dealerLoginOut;
  String? dealerPicInstant;

  /// 现场模式荷官头像
  String? dealerPicTable;
  int? tableColour;
  int? tableInfoVersion;
  int? roadPaperVersion;
  int? bootReportVersion;
  int? betPointLimitVersion;
  int? bootNumberLimitListVersion;
  int? openStatus;
  bool? roadPaperFlag;
  List<BetPointLimit>? betPointLimit;
  int? stage2BettingFlag;
  int? dealCardMode;
  DealerNameLanguageMap? dealerNameLanguageMap;
  String? noticeWord;
  int? clientTime;
  RoadInfo? roadInfo;
  List<BootNumberLimitList>? bootNumberLimitList;
  BetPointLimitMap? betPointLimitMap;
  MaxGoodRoad? maxGoodRoad;
  int? timestamp;
  bool? isSwitchGameList;
  bool? isGood;

  handleGameStatusModel(GameTableInfoModel wsGameTableInfoModel) {
    var handleGameTableInfoModel = HandleGameTableInfoModel();
    return handleGameTableInfoModel;
  }
}
