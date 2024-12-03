import 'dart:convert';

/// id : 10000
/// status : 1
/// messageId : 1725950131634
/// data : {"playerId":1306315,"walletType":0,"loginName":"5qds9oy4jts008","nickName":"东海","headPic":null,"currency":"CNY","currencyDesc":"人民币","venueCurrency":"OBGC","venueCurrencyDesc":"游戏币","currencyFlag":1,"category":1,"betStatus":1,"language":1,"balance":5047.34,"biggestWinMoney":null,"totalTable":41,"goodRoadCount":5,"goodRoadTypeList":[1,2,3,4,5,6],"goodRoadGameList":[2001,2002,2003,2005],"onlineNumber":1121,"ticket":"b8d175757d2574cc01a953cfc2c01516ff4036e620689","labelId":27,"serverReConnect":null,"kvConfigList":[{"id":1,"k":"game.video.full-view","v":"5555","valueType":"string","module":"video_config","description":"全景视频线路号"},{"id":2,"k":"game.video.hall","v":"5555","valueType":"string","module":"video_config","description":"大厅"},{"id":3,"k":"game.video.shuffle-room","v":"5555","valueType":"string","module":"video_config","description":"洗牌房"},{"id":4,"k":"game.video.full-plan.flagship","v":"a001;a001h","valueType":"string","module":"video_config","description":"全景计划-旗舰厅ID"},{"id":5,"k":"game.video.full-plan.asia-pacific","v":"g001;g001h","valueType":"string","module":"video_config","description":"全景计划-亚太厅ID"},{"id":6,"k":"game.video.full-plan.internationality","v":"i001;i001h","valueType":"string","module":"video_config","description":"全景计划-国际厅ID"}],"agentBeautyLiveStatus":1,"agentMatchStatus":true,"playerAccountAndCurrencyResponse":{"playerId":1306315,"balance":5047.34,"currency":"OBGC","currencyDesc":"游戏币","currencyBalance":5047.34,"venueGameCurrencyBalance":5047.34,"agentCurrencyDesc":"人民币","agentCurrency":"CNY","currencyRate":1},"commissionStatus":0,"selectedChip":"1000","defaultChip":"10,20,50,100,200,1000,2000,10000","selfEditChips":null,"currencyMinChip":1,"videoSwitch":0,"defaultLabel":19,"quickBettingStatus":1,"defaultWaysToPlay":8,"reCancelTime":100,"reBetTime":5000,"reBetTimes":10,"nextBetTime":2000,"enterTime":1000,"isBeautyAnchor":false,"collation":2,"hallStatusList":{"1":1,"4":2,"5":2},"backUi":false,"quickBettingShow":1,"hideRoadRecommend":false,"hideRoadBet":false,"nickNameTips":0,"nickNameApproveResult":null,"nickNameAuditRemindRead":1,"nickNameApproveCode":null,"videoSelectLineSwitch":1,"modelStatus":4,"haoluBetStatus":1,"isQuickCutTable":0,"roadPaperColour":1}
/// serverLastVersion : 1
/// packageType : 1

ws10000ModelFromJson(String str) => Ws10000Model.fromJson(json.decode(str));
String ws10000ModelToJson(Ws10000Model data) => json.encode(data.toJson());
class Ws10000Model {
  Ws10000Model({
      this.id, 
      this.status, 
      this.messageId, 
      this.data, 
      this.serverLastVersion, 
      this.packageType,});

  Ws10000Model.fromJson(dynamic json) {
    id = json['id'];
    status = json['status'];
    messageId = json['messageId'];
    data = json['data'] != null ? dataFromJson(json['data']) : null;
    serverLastVersion = json['serverLastVersion'];
    packageType = json['packageType'];
  }
  int? id;
  int? status;
  int? messageId;
  Data? data;
  int? serverLastVersion;
  int? packageType;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['status'] = status;
    map['messageId'] = messageId;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    map['serverLastVersion'] = serverLastVersion;
    map['packageType'] = packageType;
    return map;
  }

}

/// playerId : 1306315
/// walletType : 0
/// loginName : "5qds9oy4jts008"
/// nickName : "东海"
/// headPic : null
/// currency : "CNY"
/// currencyDesc : "人民币"
/// venueCurrency : "OBGC"
/// venueCurrencyDesc : "游戏币"
/// currencyFlag : 1
/// category : 1
/// betStatus : 1
/// language : 1
/// balance : 5047.34
/// biggestWinMoney : null
/// totalTable : 41
/// goodRoadCount : 5
/// goodRoadTypeList : [1,2,3,4,5,6]
/// goodRoadGameList : [2001,2002,2003,2005]
/// onlineNumber : 1121
/// ticket : "b8d175757d2574cc01a953cfc2c01516ff4036e620689"
/// labelId : 27
/// serverReConnect : null
/// kvConfigList : [{"id":1,"k":"game.video.full-view","v":"5555","valueType":"string","module":"video_config","description":"全景视频线路号"},{"id":2,"k":"game.video.hall","v":"5555","valueType":"string","module":"video_config","description":"大厅"},{"id":3,"k":"game.video.shuffle-room","v":"5555","valueType":"string","module":"video_config","description":"洗牌房"},{"id":4,"k":"game.video.full-plan.flagship","v":"a001;a001h","valueType":"string","module":"video_config","description":"全景计划-旗舰厅ID"},{"id":5,"k":"game.video.full-plan.asia-pacific","v":"g001;g001h","valueType":"string","module":"video_config","description":"全景计划-亚太厅ID"},{"id":6,"k":"game.video.full-plan.internationality","v":"i001;i001h","valueType":"string","module":"video_config","description":"全景计划-国际厅ID"}]
/// agentBeautyLiveStatus : 1
/// agentMatchStatus : true
/// playerAccountAndCurrencyResponse : {"playerId":1306315,"balance":5047.34,"currency":"OBGC","currencyDesc":"游戏币","currencyBalance":5047.34,"venueGameCurrencyBalance":5047.34,"agentCurrencyDesc":"人民币","agentCurrency":"CNY","currencyRate":1}
/// commissionStatus : 0
/// selectedChip : "1000"
/// defaultChip : "10,20,50,100,200,1000,2000,10000"
/// selfEditChips : null
/// currencyMinChip : 1
/// videoSwitch : 0
/// defaultLabel : 19
/// quickBettingStatus : 1
/// defaultWaysToPlay : 8
/// reCancelTime : 100
/// reBetTime : 5000
/// reBetTimes : 10
/// nextBetTime : 2000
/// enterTime : 1000
/// isBeautyAnchor : false
/// collation : 2
/// hallStatusList : {"1":1,"4":2,"5":2}
/// backUi : false
/// quickBettingShow : 1
/// hideRoadRecommend : false
/// hideRoadBet : false
/// nickNameTips : 0
/// nickNameApproveResult : null
/// nickNameAuditRemindRead : 1
/// nickNameApproveCode : null
/// videoSelectLineSwitch : 1
/// modelStatus : 4
/// haoluBetStatus : 1
/// isQuickCutTable : 0
/// roadPaperColour : 1

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      this.playerId, 
      this.walletType, 
      this.loginName, 
      this.nickName, 
      this.headPic, 
      this.currency, 
      this.currencyDesc, 
      this.venueCurrency, 
      this.venueCurrencyDesc, 
      this.currencyFlag, 
      this.category, 
      this.betStatus, 
      this.language, 
      this.balance, 
      this.biggestWinMoney, 
      this.totalTable, 
      this.goodRoadCount, 
      this.goodRoadTypeList, 
      this.goodRoadGameList, 
      this.onlineNumber, 
      this.ticket, 
      this.labelId, 
      this.serverReConnect, 
      this.kvConfigList, 
      this.agentBeautyLiveStatus, 
      this.agentMatchStatus, 
      this.playerAccountAndCurrencyResponse, 
      this.commissionStatus, 
      this.selectedChip, 
      this.defaultChip, 
      this.selfEditChips,
      this.currencyMinChip, 
      this.videoSwitch, 
      this.defaultLabel, 
      this.quickBettingStatus, 
      this.defaultWaysToPlay, 
      this.reCancelTime, 
      this.reBetTime, 
      this.reBetTimes, 
      this.nextBetTime, 
      this.enterTime, 
      this.isBeautyAnchor, 
      this.collation, 
      // this.hallStatusList,
      this.backUi, 
      this.quickBettingShow, 
      this.hideRoadRecommend, 
      this.hideRoadBet, 
      this.nickNameTips, 
      this.nickNameApproveResult, 
      this.nickNameAuditRemindRead, 
      this.nickNameApproveCode, 
      this.videoSelectLineSwitch, 
      this.modelStatus, 
      this.haoluBetStatus, 
      this.isQuickCutTable, 
      this.roadPaperColour,});

  Data.fromJson(dynamic json) {
    playerId = json['playerId'];
    walletType = json['walletType'];
    loginName = json['loginName'];
    nickName = json['nickName'];
    headPic = json['headPic'];
    currency = json['currency'];
    currencyDesc = json['currencyDesc'];
    venueCurrency = json['venueCurrency'];
    venueCurrencyDesc = json['venueCurrencyDesc'];
    currencyFlag = json['currencyFlag'];
    category = json['category'];
    betStatus = json['betStatus'];
    language = json['language'];
    balance = json['balance'];
    biggestWinMoney = json['biggestWinMoney'];
    totalTable = json['totalTable'];
    goodRoadCount = json['goodRoadCount'];
    goodRoadTypeList = json['goodRoadTypeList'] != null ? json['goodRoadTypeList'].cast<int>() : [];
    goodRoadGameList = json['goodRoadGameList'] != null ? json['goodRoadGameList'].cast<int>() : [];
    onlineNumber = json['onlineNumber'];
    ticket = json['ticket'];
    labelId = json['labelId'];
    serverReConnect = json['serverReConnect'];
    if (json['kvConfigList'] != null) {
      kvConfigList = [];
      json['kvConfigList'].forEach((v) {
        kvConfigList?.add(KvConfigList.fromJson(v));
      });
    }
    agentBeautyLiveStatus = json['agentBeautyLiveStatus'];
    agentMatchStatus = json['agentMatchStatus'];
    playerAccountAndCurrencyResponse = json['playerAccountAndCurrencyResponse'] != null ? PlayerAccountAndCurrencyResponse.fromJson(json['playerAccountAndCurrencyResponse']) : null;
    commissionStatus = json['commissionStatus'];
    selectedChip = json['selectedChip'];
    defaultChip = json['defaultChip'];
    selfEditChips = json['selfEditChips'];
    currencyMinChip = json['currencyMinChip'];
    videoSwitch = json['videoSwitch'];
    defaultLabel = json['defaultLabel'];
    quickBettingStatus = json['quickBettingStatus'];
    defaultWaysToPlay = json['defaultWaysToPlay'];
    reCancelTime = json['reCancelTime'];
    reBetTime = json['reBetTime'];
    reBetTimes = json['reBetTimes'];
    nextBetTime = json['nextBetTime'];
    enterTime = json['enterTime'];
    isBeautyAnchor = json['isBeautyAnchor'];
    collation = json['collation'];
    // hallStatusList = json['hallStatusList'];
    backUi = json['backUi'];
    quickBettingShow = json['quickBettingShow'];
    hideRoadRecommend = json['hideRoadRecommend'];
    hideRoadBet = json['hideRoadBet'];
    nickNameTips = json['nickNameTips'];
    nickNameApproveResult = json['nickNameApproveResult'];
    nickNameAuditRemindRead = json['nickNameAuditRemindRead'];
    nickNameApproveCode = json['nickNameApproveCode'];
    videoSelectLineSwitch = json['videoSelectLineSwitch'];
    modelStatus = json['modelStatus'];
    haoluBetStatus = json['haoluBetStatus'];
    isQuickCutTable = json['isQuickCutTable'];
    roadPaperColour = json['roadPaperColour'];
  }
  int? playerId;
  int? walletType;
  String? loginName;
  String? nickName;
  String? headPic;
  String? currency;
  String? currencyDesc;
  String? venueCurrency;
  String? venueCurrencyDesc;
  int? currencyFlag;
  int? category;
  int? betStatus;
  int? language;
  double? balance;
  dynamic biggestWinMoney;
  int? totalTable;
  int? goodRoadCount;
  List<int>? goodRoadTypeList;
  List<int>? goodRoadGameList;
  int? onlineNumber;
  String? ticket;
  int? labelId;
  dynamic serverReConnect;
  List<KvConfigList>? kvConfigList;
  int? agentBeautyLiveStatus;
  bool? agentMatchStatus;
  PlayerAccountAndCurrencyResponse? playerAccountAndCurrencyResponse;
  int? commissionStatus;
  String? selectedChip;
  String? defaultChip;
  String? selfEditChips;
  int? currencyMinChip;
  int? videoSwitch;
  int? defaultLabel;
  int? quickBettingStatus;
  int? defaultWaysToPlay;
  int? reCancelTime;
  int? reBetTime;
  int? reBetTimes;
  int? nextBetTime;
  int? enterTime;
  bool? isBeautyAnchor;
  int? collation;
  // HallStatusList? hallStatusList;
  bool? backUi;
  int? quickBettingShow;
  bool? hideRoadRecommend;
  bool? hideRoadBet;
  int? nickNameTips;
  dynamic nickNameApproveResult;
  int? nickNameAuditRemindRead;
  dynamic nickNameApproveCode;
  int? videoSelectLineSwitch;
  int? modelStatus;
  int? haoluBetStatus;
  int? isQuickCutTable;
  int? roadPaperColour;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['playerId'] = playerId;
    map['walletType'] = walletType;
    map['loginName'] = loginName;
    map['nickName'] = nickName;
    map['headPic'] = headPic;
    map['currency'] = currency;
    map['currencyDesc'] = currencyDesc;
    map['venueCurrency'] = venueCurrency;
    map['venueCurrencyDesc'] = venueCurrencyDesc;
    map['currencyFlag'] = currencyFlag;
    map['category'] = category;
    map['betStatus'] = betStatus;
    map['language'] = language;
    map['balance'] = balance;
    map['biggestWinMoney'] = biggestWinMoney;
    map['totalTable'] = totalTable;
    map['goodRoadCount'] = goodRoadCount;
    map['goodRoadTypeList'] = goodRoadTypeList;
    map['goodRoadGameList'] = goodRoadGameList;
    map['onlineNumber'] = onlineNumber;
    map['ticket'] = ticket;
    map['labelId'] = labelId;
    map['serverReConnect'] = serverReConnect;
    if (kvConfigList != null) {
      map['kvConfigList'] = kvConfigList?.map((v) => v.toJson()).toList();
    }
    map['agentBeautyLiveStatus'] = agentBeautyLiveStatus;
    map['agentMatchStatus'] = agentMatchStatus;
    if (playerAccountAndCurrencyResponse != null) {
      map['playerAccountAndCurrencyResponse'] = playerAccountAndCurrencyResponse?.toJson();
    }
    map['commissionStatus'] = commissionStatus;
    map['selectedChip'] = selectedChip;
    map['defaultChip'] = defaultChip;
    map['selfEditChips'] = selfEditChips;
    map['currencyMinChip'] = currencyMinChip;
    map['videoSwitch'] = videoSwitch;
    map['defaultLabel'] = defaultLabel;
    map['quickBettingStatus'] = quickBettingStatus;
    map['defaultWaysToPlay'] = defaultWaysToPlay;
    map['reCancelTime'] = reCancelTime;
    map['reBetTime'] = reBetTime;
    map['reBetTimes'] = reBetTimes;
    map['nextBetTime'] = nextBetTime;
    map['enterTime'] = enterTime;
    map['isBeautyAnchor'] = isBeautyAnchor;
    map['collation'] = collation;
    // map['hallStatusList'] = hallStatusList;
    map['backUi'] = backUi;
    map['quickBettingShow'] = quickBettingShow;
    map['hideRoadRecommend'] = hideRoadRecommend;
    map['hideRoadBet'] = hideRoadBet;
    map['nickNameTips'] = nickNameTips;
    map['nickNameApproveResult'] = nickNameApproveResult;
    map['nickNameAuditRemindRead'] = nickNameAuditRemindRead;
    map['nickNameApproveCode'] = nickNameApproveCode;
    map['videoSelectLineSwitch'] = videoSelectLineSwitch;
    map['modelStatus'] = modelStatus;
    map['haoluBetStatus'] = haoluBetStatus;
    map['isQuickCutTable'] = isQuickCutTable;
    map['roadPaperColour'] = roadPaperColour;
    return map;
  }

}

/// 1 : 1
/// 4 : 2
/// 5 : 2

// HallStatusList hallStatusListFromJson(String str) => HallStatusList.fromJson(json.decode(str));
// String hallStatusListToJson(HallStatusList data) => json.encode(data.toJson());
// class HallStatusList {
//   HallStatusList({
//       this.,
//       this.,
//       this.,});
//
//   HallStatusList.fromJson(dynamic json) {
//      = json['1'];
//      = json['4'];
//      = json['5'];
//   }
//   int? ;
//   int? ;
//   int? ;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['1'] = ;
//     map['4'] = ;
//     map['5'] = ;
//     return map;
//   }
//
// }

/// playerId : 1306315
/// balance : 5047.34
/// currency : "OBGC"
/// currencyDesc : "游戏币"
/// currencyBalance : 5047.34
/// venueGameCurrencyBalance : 5047.34
/// agentCurrencyDesc : "人民币"
/// agentCurrency : "CNY"
/// currencyRate : 1

PlayerAccountAndCurrencyResponse playerAccountAndCurrencyResponseFromJson(String str) => PlayerAccountAndCurrencyResponse.fromJson(json.decode(str));
String playerAccountAndCurrencyResponseToJson(PlayerAccountAndCurrencyResponse data) => json.encode(data.toJson());
class PlayerAccountAndCurrencyResponse {
  PlayerAccountAndCurrencyResponse({
      this.playerId, 
      this.balance, 
      this.currency, 
      this.currencyDesc, 
      this.currencyBalance, 
      this.venueGameCurrencyBalance, 
      this.agentCurrencyDesc, 
      this.agentCurrency, 
      this.currencyRate,});

  PlayerAccountAndCurrencyResponse.fromJson(dynamic json) {
    playerId = json['playerId'];
    balance = json['balance'];
    currency = json['currency'];
    currencyDesc = json['currencyDesc'];
    currencyBalance = json['currencyBalance'];
    venueGameCurrencyBalance = json['venueGameCurrencyBalance'];
    agentCurrencyDesc = json['agentCurrencyDesc'];
    agentCurrency = json['agentCurrency'];
    currencyRate = json['currencyRate'];
  }
  int? playerId;
  double? balance;
  String? currency;
  String? currencyDesc;
  double? currencyBalance;
  double? venueGameCurrencyBalance;
  String? agentCurrencyDesc;
  String? agentCurrency;
  double? currencyRate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['playerId'] = playerId;
    map['balance'] = balance;
    map['currency'] = currency;
    map['currencyDesc'] = currencyDesc;
    map['currencyBalance'] = currencyBalance;
    map['venueGameCurrencyBalance'] = venueGameCurrencyBalance;
    map['agentCurrencyDesc'] = agentCurrencyDesc;
    map['agentCurrency'] = agentCurrency;
    map['currencyRate'] = currencyRate;
    return map;
  }

}

/// id : 1
/// k : "game.video.full-view"
/// v : "5555"
/// valueType : "string"
/// module : "video_config"
/// description : "全景视频线路号"

KvConfigList kvConfigListFromJson(String str) => KvConfigList.fromJson(json.decode(str));
String kvConfigListToJson(KvConfigList data) => json.encode(data.toJson());
class KvConfigList {
  KvConfigList({
      this.id, 
      this.k, 
      this.v, 
      this.valueType, 
      this.module, 
      this.description,});

  KvConfigList.fromJson(dynamic json) {
    id = json['id'];
    k = json['k'];
    v = json['v'];
    valueType = json['valueType'];
    module = json['module'];
    description = json['description'];
  }
  int? id;
  String? k;
  String? v;
  String? valueType;
  String? module;
  String? description;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['k'] = k;
    map['v'] = v;
    map['valueType'] = valueType;
    map['module'] = module;
    map['description'] = description;
    return map;
  }

}