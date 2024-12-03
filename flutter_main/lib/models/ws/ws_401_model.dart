// To parse this JSON data, do
//
//     final ws401GameTableDetailModel = ws401GameTableDetailModelFromJson(jsonString);

import 'dart:convert';
import 'dart:ffi';

Ws401GameTableDetailModel ws401GameTableDetailModelFromJson(String str) => Ws401GameTableDetailModel.fromJson(json.decode(str));

String ws401GameTableDetailModelToJson(Ws401GameTableDetailModel data) => json.encode(data.toJson());

class Ws401GameTableDetailModelEvent {

  ///401 model
  late Ws401GameTableDetailModel mainModel;

  Ws401GameTableDetailModelEvent(this.mainModel);

}

class Ws401GameTableDetailModel {
  int? tableId; // 桌ID
  String? tableName; // 桌名称
  TableNameLanguageMap? tableNameLanguageMap; // 牌桌名字的本地化名称
  int? currency; // 货币类型
  String? physicsTableNo; // 桌号
  int? roundId; // 局ID
  String? roundNo; // 局号
  String? bootNo; // 靴号
  String? dealerName; // 荷官名
  int? dealerId; // 荷官ID
  String? gameTypeName; // 游戏类型
  int? gameTypeId; // 游戏类型ID
  int? gameStatus; // 状态 0-准备中，1-洗牌中，2-下注中，3-开牌中，4-结算中，6-维护中
  int? roundStatus; // 局状态 1-洗牌中，2-下注中，3-开牌中，4-结算中，5-结算完成，6-跳局，7-取消局，8-重算局
  int? totalBetCountDown; // 总计下注倒计时
  int? serverTime; // 服务器时间
  int? countdownEndTime; // 下注结束时间
  int? tipsType; // 是否有长显内容 1有 0没有
  List<CardResult>? cardResult; // 开牌结果
  WinPoints? winPoints; // 投注区域输赢
  List<int>? playerBetPoints; // 投注点
  String? roundResult; // 局结果
  dynamic virtualTableId; // 虚拟桌ID（如果有）
  String? virtualTableNo; // 虚拟桌号（如果有）
  List<PlayerInfo>? playerInfos; // 统一的玩家信息
  int? totalBetAmount; // 本局我的下注总额
  List<TableBetInfoList>? tableBetInfoList; // 统一的下注信息
  String? videoUrl; // 视频频道号
  int? dealerLogin; // 荷官登录状态，1：已登录，0：未登录
  int? tableColour; // 桌布颜色，1：红色，2：绿色
  TableAnchorInfo? tableAnchorInfo; // 中文主播的基本信息
  BetPointNotAppears? betPointNotAppears; // 投注区域未出现统计
  int? gameCasinoId; // 游戏厅ID
  String? gameCasinoName; // 游戏厅名称

  Ws401GameTableDetailModel({
    this.tableId,
    this.tableName,
    this.tableNameLanguageMap,
    this.currency,
    this.physicsTableNo,
    this.roundId,
    this.roundNo,
    this.bootNo,
    this.dealerName,
    this.dealerId,
    this.gameTypeName,
    this.gameTypeId,
    this.gameStatus,
    this.roundStatus,
    this.totalBetCountDown,
    this.serverTime,
    this.countdownEndTime,
    this.tipsType,
    this.cardResult,
    this.winPoints,
    this.playerBetPoints,
    this.roundResult,
    this.virtualTableId,
    this.virtualTableNo,
    this.playerInfos,
    this.totalBetAmount,
    this.tableBetInfoList,
    this.videoUrl,
    this.dealerLogin,
    this.tableColour,
    this.tableAnchorInfo,
    this.betPointNotAppears,
    this.gameCasinoId,
    this.gameCasinoName,
  });

  factory Ws401GameTableDetailModel.fromJson(Map<String, dynamic> json) => Ws401GameTableDetailModel(
    tableId: json["tableId"],
    tableName: json["tableName"],
    tableNameLanguageMap: json["tableNameLanguageMap"] == null ? null : TableNameLanguageMap.fromJson(json["tableNameLanguageMap"]),
    currency: json["currency"],
    physicsTableNo: json["physicsTableNo"],
    roundId: json["roundId"],
    roundNo: json["roundNo"],
    bootNo: json["bootNo"],
    dealerName: json["dealerName"],
    dealerId: json["dealerId"],
    gameTypeName: json["gameTypeName"],
    gameTypeId: json["gameTypeId"],
    gameStatus: json["gameStatus"],
    roundStatus: json["roundStatus"],
    totalBetCountDown: json["totalBetCountDown"],
    serverTime: json["serverTime"],
    countdownEndTime: json["countdownEndTime"],
    tipsType: json["tipsType"],
    cardResult: json["cardResult"] == null ? [] : List<CardResult>.from(json["cardResult"]!.map((x) => CardResult.fromJson(x))),
    winPoints: json["winPoints"] == null ? null : WinPoints.fromJson(json["winPoints"]),
    playerBetPoints: json["playerBetPoints"] == null ? [] : List<int>.from(json["playerBetPoints"]!.map((x) => x)),
    roundResult: json["roundResult"],
    virtualTableId: json["virtualTableId"],
    virtualTableNo: json["virtualTableNo"],
    playerInfos: json["playerInfos"] == null ? [] : List<PlayerInfo>.from(json["playerInfos"]!.map((x) => PlayerInfo.fromJson(x))),
    totalBetAmount: json["totalBetAmount"],
    tableBetInfoList: json["tableBetInfoList"] == null ? [] : List<TableBetInfoList>.from(json["tableBetInfoList"]!.map((x) => TableBetInfoList.fromJson(x))),
    videoUrl: json["videoUrl"],
    dealerLogin: json["dealerLogin"],
    tableColour: json["tableColour"],
    tableAnchorInfo: json["tableAnchorInfo"] == null ? null : TableAnchorInfo.fromJson(json["tableAnchorInfo"]),
    betPointNotAppears: json["betPointNotAppears"] == null ? null : BetPointNotAppears.fromJson(json["betPointNotAppears"]),
    gameCasinoId: json["gameCasinoId"],
    gameCasinoName: json["gameCasinoName"],
  );

  Map<String, dynamic> toJson() => {
    "tableId": tableId,
    "tableName": tableName,
    "tableNameLanguageMap": tableNameLanguageMap?.toJson(),
    "currency": currency,
    "physicsTableNo": physicsTableNo,
    "roundId": roundId,
    "roundNo": roundNo,
    "bootNo": bootNo,
    "dealerName": dealerName,
    "dealerId": dealerId,
    "gameTypeName": gameTypeName,
    "gameTypeId": gameTypeId,
    "gameStatus": gameStatus,
    "roundStatus": roundStatus,
    "totalBetCountDown": totalBetCountDown,
    "serverTime": serverTime,
    "countdownEndTime": countdownEndTime,
    "tipsType": tipsType,
    "cardResult": cardResult == null ? [] : List<dynamic>.from(cardResult!.map((x) => x.toJson())),
    "winPoints": winPoints?.toJson(),
    "playerBetPoints": playerBetPoints == null ? [] : List<dynamic>.from(playerBetPoints!.map((x) => x)),
    "roundResult": roundResult,
    "virtualTableId": virtualTableId,
    "virtualTableNo": virtualTableNo,
    "playerInfos": playerInfos == null ? [] : List<dynamic>.from(playerInfos!.map((x) => x.toJson())),
    "totalBetAmount": totalBetAmount,
    "tableBetInfoList": tableBetInfoList == null ? [] : List<dynamic>.from(tableBetInfoList!.map((x) => x.toJson())),
    "videoUrl": videoUrl,
    "dealerLogin": dealerLogin,
    "tableColour": tableColour,
    "tableAnchorInfo": tableAnchorInfo?.toJson(),
    "betPointNotAppears": betPointNotAppears?.toJson(),
    "gameCasinoId": gameCasinoId,
    "gameCasinoName": gameCasinoName,
  };
}

//
class BetPointNotAppears {
  List<BetPoint1>? betPoint1; // 庄对、闲对出现的次数统计

  BetPointNotAppears({
    this.betPoint1,
  });

  factory BetPointNotAppears.fromJson(Map<String, dynamic> json) => BetPointNotAppears(
    betPoint1: json["betPoint1"] == null ? [] : List<BetPoint1>.from(json["betPoint1"]!.map((x) => BetPoint1.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "betPoint1": betPoint1 == null ? [] : List<dynamic>.from(betPoint1!.map((x) => x.toJson())),
  };
}

class BetPoint1 {
  int? betPointId; // 投注点ID
  int? count; // 出现次数

  BetPoint1({
    this.betPointId,
    this.count,
  });

  factory BetPoint1.fromJson(Map<String, dynamic> json) => BetPoint1(
    betPointId: json["betPointId"],
    count: json["count"],
  );

  Map<String, dynamic> toJson() => {
    "betPointId": betPointId,
    "count": count,
  };
}

class CardResult {
  int? owner; // 牌结果所有者
  String? result; // 牌结果

  CardResult({
    this.owner,
    this.result,
  });

  factory CardResult.fromJson(Map<String, dynamic> json) => CardResult(
    owner: json["owner"],
    result: json["result"],
  );

  Map<String, dynamic> toJson() => {
    "owner": owner,
    "result": result,
  };
}


class PlayerInfo {
  double? balance;
  String? currency;
  int? language;
  String? name;
  int? playerId;
  int? seatId;
  int? status;
  int? passFlag;
  int? hideBetFlag;
  int? leaveFlag;
  int? tableRank;
  int? matchRank;
  double? winRate;
  int? lastRingFlag;

  PlayerInfo({
    this.balance,
    this.currency,
    this.language,
    this.name,
    this.playerId,
    this.seatId,
    this.status,
    this.passFlag,
    this.hideBetFlag,
    this.leaveFlag,
    this.tableRank,
    this.matchRank,
    this.winRate,
    this.lastRingFlag,
  });

  factory PlayerInfo.fromJson(Map<String, dynamic> json) => PlayerInfo(
    balance: json["balance"],
    currency: json["currency"],
    language: json["language"],
    name: json["name"],
    playerId: json["playerId"],
    seatId: json["seatId"],
    status: json["status"],
    passFlag: json["passFlag"],
    hideBetFlag: json["hideBetFlag"],
    leaveFlag: json["leaveFlag"],
    tableRank: json["tableRank"],
    matchRank: json["matchRank"],
    winRate: json["winRate"]?.toDouble(),
    lastRingFlag: json["lastRingFlag"],
  );

  Map<String, dynamic> toJson() => {
    "balance": balance,
    "currency": currency,
    "language": language,
    "name": name,
    "playerId": playerId,
    "seatId": seatId,
    "status": status,
    "passFlag": passFlag,
    "hideBetFlag": hideBetFlag,
    "leaveFlag": leaveFlag,
    "tableRank": tableRank,
    "matchRank": matchRank,
    "winRate": winRate,
    "lastRingFlag": lastRingFlag,
  };
}

class TableAnchorInfo {
  int? tableId;
  int? anchorId;
  int? anchorLogin;
  String? nickName;
  String? country;
  String? countryDesc;
  AnchorDescToLanguageDtoMap? anchorCountryDescToLanguageDtoMap;
  AnchorDescToLanguageDtoMap? anchorHobbyDescToLanguageDtoMap;
  AnchorDescToLanguageDtoMap? anchorSignatureDescToLanguageDtoMap;
  int? age;
  int? height;
  String? weight;
  int? bustLine;
  int? waistLine;
  int? hipLine;
  String? hobby;

  TableAnchorInfo({
    this.tableId,
    this.anchorId,
    this.anchorLogin,
    this.nickName,
    this.country,
    this.countryDesc,
    this.anchorCountryDescToLanguageDtoMap,
    this.anchorHobbyDescToLanguageDtoMap,
    this.anchorSignatureDescToLanguageDtoMap,
    this.age,
    this.height,
    this.weight,
    this.bustLine,
    this.waistLine,
    this.hipLine,
    this.hobby,
  });

  factory TableAnchorInfo.fromJson(Map<String, dynamic> json) => TableAnchorInfo(
    tableId: json["tableId"],
    anchorId: json["anchorId"],
    anchorLogin: json["anchorLogin"],
    nickName: json["nickName"],
    country: json["country"],
    countryDesc: json["countryDesc"],
    anchorCountryDescToLanguageDtoMap: json["anchorCountryDescToLanguageDtoMap"] == null ? null : AnchorDescToLanguageDtoMap.fromJson(json["anchorCountryDescToLanguageDtoMap"]),
    anchorHobbyDescToLanguageDtoMap: json["anchorHobbyDescToLanguageDtoMap"] == null ? null : AnchorDescToLanguageDtoMap.fromJson(json["anchorHobbyDescToLanguageDtoMap"]),
    anchorSignatureDescToLanguageDtoMap: json["anchorSignatureDescToLanguageDtoMap"] == null ? null : AnchorDescToLanguageDtoMap.fromJson(json["anchorSignatureDescToLanguageDtoMap"]),
    age: json["age"],
    height: json["height"],
    weight: json["weight"],
    bustLine: json["bustLine"],
    waistLine: json["waistLine"],
    hipLine: json["hipLine"],
    hobby: json["hobby"],
  );

  Map<String, dynamic> toJson() => {
    "tableId": tableId,
    "anchorId": anchorId,
    "anchorLogin": anchorLogin,
    "nickName": nickName,
    "country": country,
    "countryDesc": countryDesc,
    "anchorCountryDescToLanguageDtoMap": anchorCountryDescToLanguageDtoMap?.toJson(),
    "anchorHobbyDescToLanguageDtoMap": anchorHobbyDescToLanguageDtoMap?.toJson(),
    "anchorSignatureDescToLanguageDtoMap": anchorSignatureDescToLanguageDtoMap?.toJson(),
    "age": age,
    "height": height,
    "weight": weight,
    "bustLine": bustLine,
    "waistLine": waistLine,
    "hipLine": hipLine,
    "hobby": hobby,
  };
}

class AnchorDescToLanguageDtoMap {
  Cn? en;

  AnchorDescToLanguageDtoMap({
    this.en,
  });

  factory AnchorDescToLanguageDtoMap.fromJson(Map<String, dynamic> json) => AnchorDescToLanguageDtoMap(
    en: json["en"] == null ? null : Cn.fromJson(json["en"]),
  );

  Map<String, dynamic> toJson() => {
    "en": en?.toJson(),
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

class TableBetInfoList {
  int? betAmount;
  int? betPointId;
  int? playerId;
  String? currency;
  String? betPointName;
  bool? betResult;
  int? showType;
  int? matchBetType;
  int? betTwoStatusFlag;
  int? rouletteFaGroupType;
  int? rouletteFaGroupBet;

  TableBetInfoList({
    this.betAmount,
    this.betPointId,
    this.playerId,
    this.currency,
    this.betPointName,
    this.betResult,
    this.showType,
    this.matchBetType,
    this.betTwoStatusFlag,
    this.rouletteFaGroupType,
    this.rouletteFaGroupBet,
  });

  factory TableBetInfoList.fromJson(Map<String, dynamic> json) => TableBetInfoList(
    betAmount: json["betAmount"],
    betPointId: json["betPointId"],
    playerId: json["playerId"],
    currency: json["currency"],
    betPointName: json["betPointName"],
    betResult: json["betResult"],
    showType: json["showType"],
    matchBetType: json["matchBetType"],
    betTwoStatusFlag: json["betTwoStatusFlag"],
    rouletteFaGroupType: json["rouletteFaGroupType"],
    rouletteFaGroupBet: json["rouletteFaGroupBet"],
  );

  Map<String, dynamic> toJson() => {
    "betAmount": betAmount,
    "betPointId": betPointId,
    "playerId": playerId,
    "currency": currency,
    "betPointName": betPointName,
    "betResult": betResult,
    "showType": showType,
    "matchBetType": matchBetType,
    "betTwoStatusFlag": betTwoStatusFlag,
    "rouletteFaGroupType": rouletteFaGroupType,
    "rouletteFaGroupBet": rouletteFaGroupBet,
  };
}

class TableNameLanguageMap {
  Cn? en;
  Cn? cn;

  TableNameLanguageMap({
    this.en,
    this.cn,
  });

  factory TableNameLanguageMap.fromJson(Map<String, dynamic> json) => TableNameLanguageMap(
    en: json["en"] == null ? null : Cn.fromJson(json["en"]),
    cn: json["cn"] == null ? null : Cn.fromJson(json["cn"]),
  );

  Map<String, dynamic> toJson() => {
    "en": en?.toJson(),
    "cn": cn?.toJson(),
  };
}

class WinPoints {
  double? winPoint1;
  double? winPoint2;

  WinPoints({
    this.winPoint1,
    this.winPoint2,
  });

  factory WinPoints.fromJson(Map<String, dynamic> json) => WinPoints(
    winPoint1: json["winPoint1"],
    winPoint2: json["winPoint2"],
  );

  Map<String, dynamic> toJson() => {
    "winPoint1": winPoint1,
    "winPoint2": winPoint2,
  };
}

