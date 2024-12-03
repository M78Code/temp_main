// To parse this JSON data, do
//
//     final ws10053TableAllModel = ws10053TableAllModelFromJson(jsonString);

import 'dart:convert';

Ws10053TableAllModel ws10053TableAllModelFromJson(String str) => Ws10053TableAllModel.fromJson(json.decode(str));

String ws10053TableAllModelToJson(Ws10053TableAllModel data) => json.encode(data.toJson());

/// 此model 是 10053 返回的所有的model
class Ws10053TableAllModel {
  /**协议ID*/
  int? id;
  /**请求状态*/
  int? status;
  /**消息ID*/
  int? messageId;
  /**服务器链接类型 2：多台,长连接， 3：游戏服，4：聊天服，7大厅*/
  int? serviceTypeId;
  /**请求返回的数据*/
  Data? data;
  /**服务最新的版本号**/
  int? serverLastVersion;
  /**包的类型*/
  int? packageType;

  Ws10053TableAllModel({
    this.id,
    this.status,
    this.messageId,
    this.serviceTypeId,
    this.data,
    this.serverLastVersion,
    this.packageType,
  });

  factory Ws10053TableAllModel.fromJson(Map<String, dynamic> json) => Ws10053TableAllModel(
    id: json["id"],
    status: json["status"],
    messageId: json["messageId"],
    serviceTypeId: json["serviceTypeId"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
    serverLastVersion: json["serverLastVersion"],
    packageType: json["packageType"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "status": status,
    "messageId": messageId,
    "serviceTypeId": serviceTypeId,
    "data": data?.toJson(),
    "serverLastVersion": serverLastVersion,
    "packageType": packageType,
  };
}

/**10053具体的数据**/
class Data {
  /**牌桌数据列表，Map中的string为牌桌的ID,GameTable为该牌桌具体数据*/
  GameTableMap? gameTableMap;
  /**服务器时间*/
  int? serverTime;
  /**游戏列表所属游戏组（后续首页不同页签会用到）*/
  int? groupId;

  Data({
    this.gameTableMap,
    this.serverTime,
    this.groupId,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    gameTableMap: json["gameTableMap"] == null ? null : GameTableMap.fromJson(json["gameTableMap"]),
    serverTime: json["serverTime"],
    groupId: json["groupId"],
  );

  Map<String, dynamic> toJson() => {
    "gameTableMap": gameTableMap?.toJson(),
    "serverTime": serverTime,
    "groupId": groupId,
  };
}

class GameTableMap {
  Table1? table1;

  GameTableMap({
    this.table1,
  });

  factory GameTableMap.fromJson(Map<String, dynamic> json) => GameTableMap(
    table1: json["table_1"] == null ? null : Table1.fromJson(json["table_1"]),
  );

  Map<String, dynamic> toJson() => {
    "table_1": table1?.toJson(),
  };
}

class Table1 {
  int? tableId;
  int? gameCasinoId;
  String? gameCasinoName;
  String? tableName;
  NameLanguageMap? tableNameLanguageMap;
  String? physicsTableNo;
  int? gameStatus;
  bool? tableOpen;
  int? gameTypeId;
  String? gameTypeName;
  int? dealerId;
  String? dealerName;
  String? dealerPic;
  String? dealerEntertainPic;
  String? dealerCountry;
  int? roundId;
  int? countdownEndTime;
  int? totalBetCountDown;
  int? serverTime;
  String? bootNo;
  TableOnline? tableOnline;
  int? goodRoads;
  RoadPaper? roadPaper;
  BootReport? bootReport;
  int? gameFlag;
  PlayerTableBetLimit? playerTableBetLimit;
  String? videoUrl;
  int? lastUpdateTableCacheTime;
  int? isTopShow;
  List<GoodRoadPoint>? goodRoadPoints;
  int? dealerLoginOut;
  String? dealerPicInstant;
  String? dealerPicTable;
  int? tableColour;
  int? tableInfoVersion;
  int? roadPaperVersion;
  int? bootReportVersion;
  int? betPointLimitVersion;
  int? bootNumberLimitListVersion;
  int? openStatus;
  bool? roadPaperFlag;
  int? stage2BettingFlag;
  int? dealCardMode;
  NameLanguageMap? dealerNameLanguageMap;
  String? noticeWord;

  Table1({
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
    this.isTopShow,
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
    this.stage2BettingFlag,
    this.dealCardMode,
    this.dealerNameLanguageMap,
    this.noticeWord,
  });

  factory Table1.fromJson(Map<String, dynamic> json) => Table1(
    tableId: json["tableId"],
    gameCasinoId: json["gameCasinoId"],
    gameCasinoName: json["gameCasinoName"],
    tableName: json["tableName"],
    tableNameLanguageMap: json["tableNameLanguageMap"] == null ? null : NameLanguageMap.fromJson(json["tableNameLanguageMap"]),
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
    isTopShow: json["isTopShow"],
    goodRoadPoints: json["goodRoadPoints"] == null ? [] : List<GoodRoadPoint>.from(json["goodRoadPoints"]!.map((x) => GoodRoadPoint.fromJson(x))),
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
    stage2BettingFlag: json["stage2BettingFlag"],
    dealCardMode: json["dealCardMode"],
    dealerNameLanguageMap: json["dealerNameLanguageMap"] == null ? null : NameLanguageMap.fromJson(json["dealerNameLanguageMap"]),
    noticeWord: json["noticeWord"],
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
    "isTopShow": isTopShow,
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
    "stage2BettingFlag": stage2BettingFlag,
    "dealCardMode": dealCardMode,
    "dealerNameLanguageMap": dealerNameLanguageMap?.toJson(),
    "noticeWord": noticeWord,
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

class NameLanguageMap {
  Cn? en;
  Cn? cn;

  NameLanguageMap({
    this.en,
    this.cn,
  });

  factory NameLanguageMap.fromJson(Map<String, dynamic> json) => NameLanguageMap(
    en: json["en"] == null ? null : Cn.fromJson(json["en"]),
    cn: json["cn"] == null ? null : Cn.fromJson(json["cn"]),
  );

  Map<String, dynamic> toJson() => {
    "en": en?.toJson(),
    "cn": cn?.toJson(),
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

class GoodRoadPoint {
  int? goodRoadType;
  bool? goodRoadFlag;
  bool? betPoint;
  bool? putPoint;
  int? sort;
  int? number;

  GoodRoadPoint({
    this.goodRoadType,
    this.goodRoadFlag,
    this.betPoint,
    this.putPoint,
    this.sort,
    this.number,
  });

  factory GoodRoadPoint.fromJson(Map<String, dynamic> json) => GoodRoadPoint(
    goodRoadType: json["goodRoadType"],
    goodRoadFlag: json["goodRoadFlag"],
    betPoint: json["betPoint"],
    putPoint: json["putPoint"],
    sort: json["sort"],
    number: json["number"],
  );

  Map<String, dynamic> toJson() => {
    "goodRoadType": goodRoadType,
    "goodRoadFlag": goodRoadFlag,
    "betPoint": betPoint,
    "putPoint": putPoint,
    "sort": sort,
    "number": number,
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

class TableOnline {
  int? onlineNumber;
  double? totalAmount;

  TableOnline({
    this.onlineNumber,
    this.totalAmount,
  });

  factory TableOnline.fromJson(Map<String, dynamic> json) => TableOnline(
    onlineNumber: json["onlineNumber"],
    totalAmount: json["totalAmount"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "onlineNumber": onlineNumber,
    "totalAmount": totalAmount,
  };
}
