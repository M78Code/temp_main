/// tableId : 212519
/// roundId : 9065392
/// playerId : 1344982
/// seatId : 1
/// balance : 3170
/// betTwoStatusFlag : 0
/// betId : "1059150307060322752"
/// betInfos : [{"betPointId":3001,"betPointName":"ׯ","betAmount":150,"betResult":true}]
/// currency : "OBGC"

class TableBetInfoModel {
  TableBetInfoModel({
      this.tableId, 
      this.roundId, 
      this.playerId, 
      this.seatId, 
      this.balance, 
      this.betTwoStatusFlag, 
      this.betId, 
      this.betInfosMap,
      this.currency,});

  TableBetInfoModel.fromJson(dynamic json) {
    tableId = json['tableId'];
    roundId = json['roundId'];
    playerId = json['playerId'];
    seatId = json['seatId'];
    balance = json['balance'];
    betTwoStatusFlag = json['betTwoStatusFlag'];
    betId = json['betId'];
    // if (json['betInfos'] != null) {
    //   betInfos = [];
    //   json['betInfos'].forEach((v) {
    //     betInfos?.add(TableBetInfoModelBetInfos.fromJson(v));
    //   });
    // }
    currency = json['currency'];
  }
  int? tableId;
  int? roundId;
  int? playerId;
  int? seatId;
  int? balance;
  int? betTwoStatusFlag;
  String? betId;
  Map<int, TableBetInfoModelBetInfos>? betInfosMap;
  String? currency;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['tableId'] = tableId;
    map['roundId'] = roundId;
    map['playerId'] = playerId;
    map['seatId'] = seatId;
    map['balance'] = balance;
    map['betTwoStatusFlag'] = betTwoStatusFlag;
    map['betId'] = betId;
    // if (betInfos != null) {
    //   map['betInfos'] = betInfos?.map((v) => v.toJson()).toList();
    // }
    map['currency'] = currency;
    return map;
  }



}

/// betPointId : 3001
/// betPointName : "ׯ"
/// betAmount : 150
/// betResult : true

class TableBetInfoModelBetInfos {
  TableBetInfoModelBetInfos({
      this.betPointId,
      this.betPointName,
      this.betAmount,
      this.betResult,});

  TableBetInfoModelBetInfos.fromJson(dynamic json) {
    betPointId = json['betPointId'];
    betPointName = json['betPointName'];
    betAmount = json['betAmount'];
    betResult = json['betResult'];
  }
  int? betPointId;
  String? betPointName;
  int? betAmount;
  bool? betResult;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['betPointId'] = betPointId;
    map['betPointName'] = betPointName;
    map['betAmount'] = betAmount;
    map['betResult'] = betResult;
    return map;
  }

}