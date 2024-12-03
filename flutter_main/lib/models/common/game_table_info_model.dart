import 'dart:convert';

import 'package:flutter_main/models/common/bet_point_limit.dart';
import 'package:flutter_main/models/common/bet_point_limit_info_model.dart';


GameTableInfoModel gameTableInfoModelFromJson(String str) => GameTableInfoModel.fromJson(json.decode(str));

String gameTableInfoModelToJson(GameTableInfoModel data) => json.encode(data.toJson());

/// 每个桌子的内容 用这个解析
class GameTableInfoModel {
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

  ///新增服务字段-字段前加 my 标识
  ///
  // 缓存全局的 投注点限红及牌靴限制数据
  // map类型
  // key为投注点，betPointID
  // value为betPointLimitInfo类型数
  Map<String, BetPointLimitInfoModel>? myBetPointLimitInfoMap;

  GameTableInfoModel({
    this.tableId,
    this.gameCasinoId,
    this.gameCasinoName,
    this.tableName,
    this.tableNameLanguageMap,
    this.physicsTableNo,
    this.gameStatus,
    this.tableOpen,
    this.gameTypeId,
    this.gameTypeName,
    this.dealerId,
    this.dealerName,
    this.dealerPic,
    this.dealerEntertainPic,
    this.dealerCountry,
    this.roundId,
    this.countdownEndTime,
    this.totalBetCountDown,
    this.serverTime,
    this.bootNo,
    this.tableOnline,
    this.goodRoads,
    this.roadPaper,
    this.bootReport,
    this.gameFlag,
    this.playerTableBetLimit,
    this.videoUrl,
    this.lastUpdateTableCacheTime,
    this.goodRoadPoints,
    this.dealerLoginOut,
    this.dealerPicInstant,
    this.dealerPicTable,
    this.tableColour,
    this.tableInfoVersion,
    this.roadPaperVersion,
    this.bootReportVersion,
    this.betPointLimitVersion,
    this.bootNumberLimitListVersion,
    this.openStatus,
    this.roadPaperFlag,
    this.betPointLimit,
    this.stage2BettingFlag,
    this.dealCardMode,
    this.dealerNameLanguageMap,
    this.noticeWord,
    this.clientTime,
    this.roadInfo,
    this.bootNumberLimitList,
    this.betPointLimitMap,
    this.maxGoodRoad,
    this.timestamp,
    this.isSwitchGameList,
    this.isGood,
    /// 新增服务字段
    this.myBetPointLimitInfoMap,
  });

  factory GameTableInfoModel.fromJson(Map<String, dynamic> json) => GameTableInfoModel(
    tableId: json["tableId"],
    gameCasinoId: json["gameCasinoId"],
    gameCasinoName: json["gameCasinoName"],
    tableName: json["tableName"],
    tableNameLanguageMap: json["tableNameLanguageMap"] == null ? null : TableNameLanguageMap.fromJson(json["tableNameLanguageMap"]),
    physicsTableNo: json["physicsTableNo"],
    gameStatus: json["gameStatus"],
    tableOpen: json["tableOpen"],
    gameTypeId: json["gameTypeId"],
    gameTypeName: json["gameTypeName"],
    dealerId: json["dealerId"],
    dealerName: json["dealerName"],
    dealerPic: json["dealerPic"],
    dealerEntertainPic: json["dealerEntertainPic"],
    dealerCountry: json["dealerCountry"],
    roundId: json["roundId"],
    countdownEndTime: json["countdownEndTime"],
    totalBetCountDown: json["totalBetCountDown"],
    serverTime: json["serverTime"],
    bootNo: json["bootNo"],
    tableOnline: json["tableOnline"] == null ? null : TableOnline.fromJson(json["tableOnline"]),
    goodRoads: json["goodRoads"],
    roadPaper: json["roadPaper"] == null ? null : RoadPaper.fromJson(json["roadPaper"]),
    bootReport: json["bootReport"] == null ? null : BootReport.fromJson(json["bootReport"]),
    gameFlag: json["gameFlag"],
    playerTableBetLimit: json["playerTableBetLimit"] == null ? null : PlayerTableBetLimit.fromJson(json["playerTableBetLimit"]),
    videoUrl: json["videoUrl"],
    lastUpdateTableCacheTime: json["lastUpdateTableCacheTime"],
    goodRoadPoints: json["goodRoadPoints"] == null ? [] : List<MaxGoodRoad>.from(json["goodRoadPoints"]!.map((x) => MaxGoodRoad.fromJson(x))),
    dealerLoginOut: json["dealerLoginOut"],
    dealerPicInstant: json["dealerPicInstant"],
    dealerPicTable: json["dealerPicTable"],
    tableColour: json["tableColour"],
    tableInfoVersion: json["tableInfoVersion"],
    roadPaperVersion: json["roadPaperVersion"],
    bootReportVersion: json["bootReportVersion"],
    betPointLimitVersion: json["betPointLimitVersion"],
    bootNumberLimitListVersion: json["bootNumberLimitListVersion"],
    openStatus: json["openStatus"],
    roadPaperFlag: json["roadPaperFlag"],
    betPointLimit: json["betPointLimit"] == null ? [] : List<BetPointLimit>.from(json["betPointLimit"]!.map((x) => BetPointLimit.fromJson(x))),
    stage2BettingFlag: json["stage2BettingFlag"],
    dealCardMode: json["dealCardMode"],
    dealerNameLanguageMap: json["dealerNameLanguageMap"] == null ? null : DealerNameLanguageMap.fromJson(json["dealerNameLanguageMap"]),
    noticeWord: json["noticeWord"],
    clientTime: json["clientTime"],
    roadInfo: json["roadInfo"] == null ? null : RoadInfo.fromJson(json["roadInfo"]),
    bootNumberLimitList: json["bootNumberLimitList"] == null ? [] : List<BootNumberLimitList>.from(json["bootNumberLimitList"]!.map((x) => BootNumberLimitList.fromJson(x))),
    betPointLimitMap: json["betPointLimitMap"] == null ? null : BetPointLimitMap.fromJson(json["betPointLimitMap"]),
    maxGoodRoad: json["maxGoodRoad"] == null ? null : MaxGoodRoad.fromJson(json["maxGoodRoad"]),
    timestamp: json["timestamp"],
    isSwitchGameList: json["isSwitchGameList"],
    isGood: json["isGood"],
  );

  Map<String, dynamic> toJson() => {
    "tableId": tableId,
    "gameCasinoId": gameCasinoId,
    "gameCasinoName": gameCasinoName,
    "tableName": tableName,
    "tableNameLanguageMap": tableNameLanguageMap?.toJson(),
    "physicsTableNo": physicsTableNo,
    "gameStatus": gameStatus,
    "tableOpen": tableOpen,
    "gameTypeId": gameTypeId,
    "gameTypeName": gameTypeName,
    "dealerId": dealerId,
    "dealerName": dealerName,
    "dealerPic": dealerPic,
    "dealerEntertainPic": dealerEntertainPic,
    "dealerCountry": dealerCountry,
    "roundId": roundId,
    "countdownEndTime": countdownEndTime,
    "totalBetCountDown": totalBetCountDown,
    "serverTime": serverTime,
    "bootNo": bootNo,
    "tableOnline": tableOnline?.toJson(),
    "goodRoads": goodRoads,
    "roadPaper": roadPaper?.toJson(),
    "bootReport": bootReport?.toJson(),
    "gameFlag": gameFlag,
    "playerTableBetLimit": playerTableBetLimit?.toJson(),
    "videoUrl": videoUrl,
    "lastUpdateTableCacheTime": lastUpdateTableCacheTime,
    "goodRoadPoints": goodRoadPoints == null ? [] : List<dynamic>.from(goodRoadPoints!.map((x) => x.toJson())),
    "dealerLoginOut": dealerLoginOut,
    "dealerPicInstant": dealerPicInstant,
    "dealerPicTable": dealerPicTable,
    "tableColour": tableColour,
    "tableInfoVersion": tableInfoVersion,
    "roadPaperVersion": roadPaperVersion,
    "bootReportVersion": bootReportVersion,
    "betPointLimitVersion": betPointLimitVersion,
    "bootNumberLimitListVersion": bootNumberLimitListVersion,
    "openStatus": openStatus,
    "roadPaperFlag": roadPaperFlag,
    "betPointLimit": betPointLimit == null ? [] : List<dynamic>.from(betPointLimit!.map((x) => x.toJson())),
    "stage2BettingFlag": stage2BettingFlag,
    "dealCardMode": dealCardMode,
    "dealerNameLanguageMap": dealerNameLanguageMap?.toJson(),
    "noticeWord": noticeWord,
    "clientTime": clientTime,
    "roadInfo": roadInfo?.toJson(),
    "bootNumberLimitList": bootNumberLimitList == null ? [] : List<dynamic>.from(bootNumberLimitList!.map((x) => x.toJson())),
    "betPointLimitMap": betPointLimitMap?.toJson(),
    "maxGoodRoad": maxGoodRoad?.toJson(),
    "timestamp": timestamp,
    "isSwitchGameList": isSwitchGameList,
    "isGood": isGood,
  };
}

class BetPointMap {
  int? status;

  BetPointMap({
    this.status,
  });

  factory BetPointMap.fromJson(Map<String, dynamic> json) => BetPointMap(
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
  };
}

class BetPointLimitMap {
  List<Empty>? fluffy;
  List<BetPointLimit>? sticky;
  List<Empty>? purple;
  List<BetPointLimit>? the7;
  List<BetPointLimit>? tentacled;
  List<Empty>? betPointLimitMap;
  List<Empty>? indigo;
  List<Empty>? empty;

  BetPointLimitMap({
    this.fluffy,
    this.sticky,
    this.purple,
    this.the7,
    this.tentacled,
    this.betPointLimitMap,
    this.indigo,
    this.empty,
  });

  factory BetPointLimitMap.fromJson(Map<String, dynamic> json) => BetPointLimitMap(
    fluffy: json["经典"] == null ? [] : List<Empty>.from(json["经典"]!.map((x) => Empty.fromJson(x))),
    sticky: json["龙宝"] == null ? [] : List<BetPointLimit>.from(json["龙宝"]!.map((x) => BetPointLimit.fromJson(x))),
    purple: json["对子"] == null ? [] : List<Empty>.from(json["对子"]!.map((x) => Empty.fromJson(x))),
    the7: json["超和&龙7"] == null ? [] : List<BetPointLimit>.from(json["超和&龙7"]!.map((x) => BetPointLimit.fromJson(x))),
    tentacled: json["老虎"] == null ? [] : List<BetPointLimit>.from(json["老虎"]!.map((x) => BetPointLimit.fromJson(x))),
    betPointLimitMap: json["天牌"] == null ? [] : List<Empty>.from(json["天牌"]!.map((x) => Empty.fromJson(x))),
    indigo: json["龙虎"] == null ? [] : List<Empty>.from(json["龙虎"]!.map((x) => Empty.fromJson(x))),
    empty: json["大小"] == null ? [] : List<Empty>.from(json["大小"]!.map((x) => Empty.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "经典": fluffy == null ? [] : List<dynamic>.from(fluffy!.map((x) => x.toJson())),
    "龙宝": sticky == null ? [] : List<dynamic>.from(sticky!.map((x) => x.toJson())),
    "对子": purple == null ? [] : List<dynamic>.from(purple!.map((x) => x.toJson())),
    "超和&龙7": the7 == null ? [] : List<dynamic>.from(the7!.map((x) => x.toJson())),
    "老虎": tentacled == null ? [] : List<dynamic>.from(tentacled!.map((x) => x.toJson())),
    "天牌": betPointLimitMap == null ? [] : List<dynamic>.from(betPointLimitMap!.map((x) => x.toJson())),
    "龙虎": indigo == null ? [] : List<dynamic>.from(indigo!.map((x) => x.toJson())),
    "大小": empty == null ? [] : List<dynamic>.from(empty!.map((x) => x.toJson())),
  };
}

class RoadPaper {
  String? bigRoad;
  String? winPointPlateRoad;
  String? bigPairRoad;
  String? dragonBonusPlateRoad;
  String? beatPlateRoad;
  String? winLoseRoad;
  String? cockroachPig;
  String? smallRoad;
  String? bigEyeBoy;
  String? bigSmallPlateRoad;
  String? newBigPairRoad;

  RoadPaper({
    this.bigRoad,
    this.winPointPlateRoad,
    this.bigPairRoad,
    this.dragonBonusPlateRoad,
    this.beatPlateRoad,
    this.winLoseRoad,
    this.cockroachPig,
    this.smallRoad,
    this.bigEyeBoy,
    this.bigSmallPlateRoad,
    this.newBigPairRoad,
  });

  factory RoadPaper.fromJson(Map<String, dynamic> json) => RoadPaper(
    bigRoad: json["bigRoad"],
    winPointPlateRoad: json["winPointPlateRoad"],
    bigPairRoad: json["bigPairRoad"],
    dragonBonusPlateRoad: json["dragonBonusPlateRoad"],
    beatPlateRoad: json["beatPlateRoad"],
    winLoseRoad: json["winLoseRoad"],
    cockroachPig: json["cockroachPig"],
    smallRoad: json["smallRoad"],
    bigEyeBoy: json["bigEyeBoy"],
    bigSmallPlateRoad: json["bigSmallPlateRoad"],
    newBigPairRoad: json["newBigPairRoad"],
  );

  Map<String, dynamic> toJson() => {
    "bigRoad": bigRoad,
    "winPointPlateRoad": winPointPlateRoad,
    "bigPairRoad": bigPairRoad,
    "dragonBonusPlateRoad": dragonBonusPlateRoad,
    "beatPlateRoad": beatPlateRoad,
    "winLoseRoad": winLoseRoad,
    "cockroachPig": cockroachPig,
    "smallRoad": smallRoad,
    "bigEyeBoy": bigEyeBoy,
    "bigSmallPlateRoad": bigSmallPlateRoad,
    "newBigPairRoad": newBigPairRoad,
  };
}

class Empty {
  String? betPointGroup;
  int? groupId;
  int? min;
  int? max;
  String? playRate;
  bool? dynamicFlag;
  Map<String, BetPointMap>? betPointMap;

  Empty({
    this.betPointGroup,
    this.groupId,
    this.min,
    this.max,
    this.playRate,
    this.dynamicFlag,
    this.betPointMap,
  });

  factory Empty.fromJson(Map<String, dynamic> json) => Empty(
    betPointGroup: json["betPointGroup"],
    groupId: json["groupId"],
    min: json["min"],
    max: json["max"],
    playRate: json["playRate"],
    dynamicFlag: json["dynamicFlag"],
    betPointMap: Map.from(json["betPointMap"]!).map((k, v) => MapEntry<String, BetPointMap>(k, BetPointMap.fromJson(v))),
  );

  Map<String, dynamic> toJson() => {
    "betPointGroup": betPointGroup,
    "groupId": groupId,
    "min": min,
    "max": max,
    "playRate": playRate,
    "dynamicFlag": dynamicFlag,
    "betPointMap": Map.from(betPointMap!).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
  };
}

class BootNumberLimitList {
  int? betPointId;
  int? groupId;
  String? playRate;
  int? bootLimitCount;
  int? status;

  BootNumberLimitList({
    this.betPointId,
    this.groupId,
    this.playRate,
    this.bootLimitCount,
    this.status,
  });

  factory BootNumberLimitList.fromJson(Map<String, dynamic> json) => BootNumberLimitList(
    betPointId: json["betPointId"],
    groupId: json["groupId"],
    playRate: json["playRate"],
    bootLimitCount: json["bootLimitCount"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "betPointId": betPointId,
    "groupId": groupId,
    "playRate": playRate,
    "bootLimitCount": bootLimitCount,
    "status": status,
  };
}

class BootReport {
  int? totalCount;
  List<Item>? items;

  BootReport({
    this.totalCount,
    this.items,
  });

  factory BootReport.fromJson(Map<String, dynamic> json) => BootReport(
    totalCount: json["totalCount"],
    items: json["items"] == null ? [] : List<Item>.from(json["items"]!.map((x) => Item.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "totalCount": totalCount,
    "items": items == null ? [] : List<dynamic>.from(items!.map((x) => x.toJson())),
  };
}

class Item {
  int? betPointId;
  String? betPointName;
  int? winCount;

  Item({
    this.betPointId,
    this.betPointName,
    this.winCount,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    betPointId: json["betPointId"],
    betPointName: json["betPointName"],
    winCount: json["winCount"],
  );

  Map<String, dynamic> toJson() => {
    "betPointId": betPointId,
    "betPointName": betPointName,
    "winCount": winCount,
  };
}

class DealerNameLanguageMap {
  Cn? cn;
  Cn? tc;

  DealerNameLanguageMap({
    this.cn,
    this.tc,
  });

  factory DealerNameLanguageMap.fromJson(Map<String, dynamic> json) => DealerNameLanguageMap(
    cn: json["cn"] == null ? null : Cn.fromJson(json["cn"]),
    tc: json["tc"] == null ? null : Cn.fromJson(json["tc"]),
  );

  Map<String, dynamic> toJson() => {
    "cn": cn?.toJson(),
    "tc": tc?.toJson(),
  };
}

class Cn {
  String? languageCode;
  String? content;

  Cn({
    this.languageCode,
    this.content,
  });

  factory Cn.fromJson(Map<String, dynamic> json) => Cn(
    languageCode: json["languageCode"],
    content: json["content"],
  );

  Map<String, dynamic> toJson() => {
    "languageCode": languageCode,
    "content": content,
  };
}

class MaxGoodRoad {
  int? goodRoadType;
  bool? goodRoadFlag;
  bool? betPoint;
  bool? putPoint;
  int? sort;
  int? num;

  MaxGoodRoad({
    this.goodRoadType,
    this.goodRoadFlag,
    this.betPoint,
    this.putPoint,
    this.sort,
    this.num,
  });

  factory MaxGoodRoad.fromJson(Map<String, dynamic> json) => MaxGoodRoad(
    goodRoadType: json["goodRoadType"],
    goodRoadFlag: json["goodRoadFlag"],
    betPoint: json["betPoint"],
    putPoint: json["putPoint"],
    sort: json["sort"],
    num: json["num"],
  );

  Map<String, dynamic> toJson() => {
    "goodRoadType": goodRoadType,
    "goodRoadFlag": goodRoadFlag,
    "betPoint": betPoint,
    "putPoint": putPoint,
    "sort": sort,
    "num": num,
  };
}

class PlayerTableBetLimit {
  int? min;
  int? max;

  PlayerTableBetLimit({
    this.min,
    this.max,
  });

  factory PlayerTableBetLimit.fromJson(Map<String, dynamic> json) => PlayerTableBetLimit(
    min: json["min"],
    max: json["max"],
  );

  Map<String, dynamic> toJson() => {
    "min": min,
    "max": max,
  };
}

class RoadInfo {
  String? mainRoadContent;
  Map<String, BigEyeRoadInfo>? roadPaperDataMap;
  int? mainRoadType;
  BigEyeRoadInfo? mainRoadInfo;
  BigEyeRoadInfo? bigSmallRoadInfo;
  BigEyeRoadInfo? dragonBounsRoadInfo;
  BigEyeRoadInfo? winPointRoadInfo;
  BigEyeRoadInfo? bigRoadInfo;
  BigEyeRoadInfo? bigPairRoadInfo;
  BigEyeRoadInfo? zhishaRoadInfo;
  BigEyeRoadInfo? bigPairAndSuperSixRoadInfo;
  BigEyeRoadInfo? bigEyeRoadInfo;
  BigEyeRoadInfo? smallRoadInfo;
  BigEyeRoadInfo? smallQRoadInfo;

  RoadInfo({
    this.mainRoadContent,
    this.roadPaperDataMap,
    this.mainRoadType,
    this.mainRoadInfo,
    this.bigSmallRoadInfo,
    this.dragonBounsRoadInfo,
    this.winPointRoadInfo,
    this.bigRoadInfo,
    this.bigPairRoadInfo,
    this.zhishaRoadInfo,
    this.bigPairAndSuperSixRoadInfo,
    this.bigEyeRoadInfo,
    this.smallRoadInfo,
    this.smallQRoadInfo,
  });

  factory RoadInfo.fromJson(Map<String, dynamic> json) => RoadInfo(
    mainRoadContent: json["_mainRoadContent"],
    roadPaperDataMap: Map.from(json["_roadPaperDataMap"]!).map((k, v) => MapEntry<String, BigEyeRoadInfo>(k, BigEyeRoadInfo.fromJson(v))),
    mainRoadType: json["_mainRoadType"],
    mainRoadInfo: json["_mainRoadInfo"] == null ? null : BigEyeRoadInfo.fromJson(json["_mainRoadInfo"]),
    bigSmallRoadInfo: json["_bigSmallRoadInfo"] == null ? null : BigEyeRoadInfo.fromJson(json["_bigSmallRoadInfo"]),
    dragonBounsRoadInfo: json["_dragonBounsRoadInfo"] == null ? null : BigEyeRoadInfo.fromJson(json["_dragonBounsRoadInfo"]),
    winPointRoadInfo: json["_winPointRoadInfo"] == null ? null : BigEyeRoadInfo.fromJson(json["_winPointRoadInfo"]),
    bigRoadInfo: json["_bigRoadInfo"] == null ? null : BigEyeRoadInfo.fromJson(json["_bigRoadInfo"]),
    bigPairRoadInfo: json["_bigPairRoadInfo"] == null ? null : BigEyeRoadInfo.fromJson(json["_bigPairRoadInfo"]),
    zhishaRoadInfo: json["_zhishaRoadInfo"] == null ? null : BigEyeRoadInfo.fromJson(json["_zhishaRoadInfo"]),
    bigPairAndSuperSixRoadInfo: json["_bigPairAndSuperSixRoadInfo"] == null ? null : BigEyeRoadInfo.fromJson(json["_bigPairAndSuperSixRoadInfo"]),
    bigEyeRoadInfo: json["_bigEyeRoadInfo"] == null ? null : BigEyeRoadInfo.fromJson(json["_bigEyeRoadInfo"]),
    smallRoadInfo: json["_smallRoadInfo"] == null ? null : BigEyeRoadInfo.fromJson(json["_smallRoadInfo"]),
    smallQRoadInfo: json["_smallQRoadInfo"] == null ? null : BigEyeRoadInfo.fromJson(json["_smallQRoadInfo"]),
  );

  Map<String, dynamic> toJson() => {
    "_mainRoadContent": mainRoadContent,
    "_roadPaperDataMap": Map.from(roadPaperDataMap!).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
    "_mainRoadType": mainRoadType,
    "_mainRoadInfo": mainRoadInfo?.toJson(),
    "_bigSmallRoadInfo": bigSmallRoadInfo?.toJson(),
    "_dragonBounsRoadInfo": dragonBounsRoadInfo?.toJson(),
    "_winPointRoadInfo": winPointRoadInfo?.toJson(),
    "_bigRoadInfo": bigRoadInfo?.toJson(),
    "_bigPairRoadInfo": bigPairRoadInfo?.toJson(),
    "_zhishaRoadInfo": zhishaRoadInfo?.toJson(),
    "_bigPairAndSuperSixRoadInfo": bigPairAndSuperSixRoadInfo?.toJson(),
    "_bigEyeRoadInfo": bigEyeRoadInfo?.toJson(),
    "_smallRoadInfo": smallRoadInfo?.toJson(),
    "_smallQRoadInfo": smallQRoadInfo?.toJson(),
  };
}

class BigEyeRoadInfo {
  String? content;
  int? gameType;
  int? roadPaperType;
  int? column;
  int? row;
  int? version;
  List<dynamic>? list;
  List<dynamic>? list3;
  int? bankerAskRoadColumn;
  int? bankerAskRoadRow;
  String? bankerAskRoadResult;
  bool? bankerAskRoadIsBankerWin;
  bool? bankerAskRoadIsPlayerWin;
  int? playerAskRoadColumn;
  int? playerAskRoadRow;
  String? playerAskRoadResult;
  bool? playerAskRoadIsBankerWin;
  bool? playerAskRoadIsPlayerWin;
  List<List<String>>? roadList;

  BigEyeRoadInfo({
    this.content,
    this.gameType,
    this.roadPaperType,
    this.column,
    this.row,
    this.version,
    this.list,
    this.list3,
    this.bankerAskRoadColumn,
    this.bankerAskRoadRow,
    this.bankerAskRoadResult,
    this.bankerAskRoadIsBankerWin,
    this.bankerAskRoadIsPlayerWin,
    this.playerAskRoadColumn,
    this.playerAskRoadRow,
    this.playerAskRoadResult,
    this.playerAskRoadIsBankerWin,
    this.playerAskRoadIsPlayerWin,
    this.roadList,
  });

  factory BigEyeRoadInfo.fromJson(Map<String, dynamic> json) => BigEyeRoadInfo(
    content: json["_content"],
    gameType: json["_gameType"],
    roadPaperType: json["_roadPaperType"],
    column: json["_column"],
    row: json["_row"],
    version: json["_version"],
    list: json["_list"] == null ? [] : List<dynamic>.from(json["_list"]!.map((x) => x)),
    list3: json["_list3"] == null ? [] : List<dynamic>.from(json["_list3"]!.map((x) => x)),
    bankerAskRoadColumn: json["_bankerAskRoadColumn"],
    bankerAskRoadRow: json["_bankerAskRoadRow"],
    bankerAskRoadResult: json["_bankerAskRoadResult"],
    bankerAskRoadIsBankerWin: json["_bankerAskRoadIsBankerWin"],
    bankerAskRoadIsPlayerWin: json["_bankerAskRoadIsPlayerWin"],
    playerAskRoadColumn: json["_playerAskRoadColumn"],
    playerAskRoadRow: json["_playerAskRoadRow"],
    playerAskRoadResult: json["_playerAskRoadResult"],
    playerAskRoadIsBankerWin: json["_playerAskRoadIsBankerWin"],
    playerAskRoadIsPlayerWin: json["_playerAskRoadIsPlayerWin"],
    roadList: json["_roadList"] == null ? [] : List<List<String>>.from(json["_roadList"]!.map((x) => List<String>.from(x.map((x) => x)))),
  );

  Map<String, dynamic> toJson() => {
    "_content": content,
    "_gameType": gameType,
    "_roadPaperType": roadPaperType,
    "_column": column,
    "_row": row,
    "_version": version,
    "_list": list == null ? [] : List<dynamic>.from(list!.map((x) => x)),
    "_list3": list3 == null ? [] : List<dynamic>.from(list3!.map((x) => x)),
    "_bankerAskRoadColumn": bankerAskRoadColumn,
    "_bankerAskRoadRow": bankerAskRoadRow,
    "_bankerAskRoadResult": bankerAskRoadResult,
    "_bankerAskRoadIsBankerWin": bankerAskRoadIsBankerWin,
    "_bankerAskRoadIsPlayerWin": bankerAskRoadIsPlayerWin,
    "_playerAskRoadColumn": playerAskRoadColumn,
    "_playerAskRoadRow": playerAskRoadRow,
    "_playerAskRoadResult": playerAskRoadResult,
    "_playerAskRoadIsBankerWin": playerAskRoadIsBankerWin,
    "_playerAskRoadIsPlayerWin": playerAskRoadIsPlayerWin,
    "_roadList": roadList == null ? [] : List<dynamic>.from(roadList!.map((x) => List<dynamic>.from(x.map((x) => x)))),
  };
}

class TableNameLanguageMap {
  Cn? vi;
  Cn? th;
  Cn? kr;
  Cn? en;
  Cn? cn;
  Cn? tc;

  TableNameLanguageMap({
    this.vi,
    this.th,
    this.kr,
    this.en,
    this.cn,
    this.tc,
  });

  factory TableNameLanguageMap.fromJson(Map<String, dynamic> json) => TableNameLanguageMap(
    vi: json["vi"] == null ? null : Cn.fromJson(json["vi"]),
    th: json["th"] == null ? null : Cn.fromJson(json["th"]),
    kr: json["kr"] == null ? null : Cn.fromJson(json["kr"]),
    en: json["en"] == null ? null : Cn.fromJson(json["en"]),
    cn: json["cn"] == null ? null : Cn.fromJson(json["cn"]),
    tc: json["tc"] == null ? null : Cn.fromJson(json["tc"]),
  );

  Map<String, dynamic> toJson() => {
    "vi": vi?.toJson(),
    "th": th?.toJson(),
    "kr": kr?.toJson(),
    "en": en?.toJson(),
    "cn": cn?.toJson(),
    "tc": tc?.toJson(),
  };
}

class TableOnline {
  /**在线人数 */
  int? onlineNumber;
  /**总金额*/
  int? totalAmount;

  TableOnline({
    this.onlineNumber,
    this.totalAmount,
  });

  factory TableOnline.fromJson(Map<String, dynamic> json) => TableOnline(
    onlineNumber: json["onlineNumber"],
    totalAmount: json["totalAmount"],
  );

  Map<String, dynamic> toJson() => {
    "onlineNumber": onlineNumber,
    "totalAmount": totalAmount,
  };
}