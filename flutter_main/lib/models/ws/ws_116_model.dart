// To parse this JSON data, do
//
//     final ws116RoadGameTableDetailModel = ws116RoadGameTableDetailModelFromJson(jsonString);

import 'dart:convert';

Ws116RoadGameTableDetailModel ws116RoadGameTableDetailModelFromJson(String str) => Ws116RoadGameTableDetailModel.fromJson(json.decode(str));

String ws116RoadGameTableDetailModelToJson(Ws116RoadGameTableDetailModel data) => json.encode(data.toJson());

class Ws116RoadGameTableDetailModelEvent {

  /// ⚠️注： 这里有多少个key 列表里有多少个桌子！！（itemCount）
  late Ws116RoadGameTableDetailModel mainModel;

  Ws116RoadGameTableDetailModelEvent(this.mainModel);

}


/// 游戏页内 下发的路子数据
class Ws116RoadGameTableDetailModel {
  int? tableId;
  RoadPaper? roadPaper;

  Ws116RoadGameTableDetailModel({
    this.tableId,
    this.roadPaper,
  });

  factory Ws116RoadGameTableDetailModel.fromJson(Map<String, dynamic> json) => Ws116RoadGameTableDetailModel(
    tableId: json["tableId"],
    roadPaper: json["roadPaper"] == null ? null : RoadPaper.fromJson(json["roadPaper"]),
  );

  Map<String, dynamic> toJson() => {
    "tableId": tableId,
    "roadPaper": roadPaper?.toJson(),
  };
}

class RoadPaper {
  String? bigRoad;
  String? winPointPlateRoad;
  String? dragonBonusPlateRoad;
  String? bigPairRoad;
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
    this.dragonBonusPlateRoad,
    this.bigPairRoad,
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
    dragonBonusPlateRoad: json["dragonBonusPlateRoad"],
    bigPairRoad: json["bigPairRoad"],
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
    "dragonBonusPlateRoad": dragonBonusPlateRoad,
    "bigPairRoad": bigPairRoad,
    "beatPlateRoad": beatPlateRoad,
    "winLoseRoad": winLoseRoad,
    "cockroachPig": cockroachPig,
    "smallRoad": smallRoad,
    "bigEyeBoy": bigEyeBoy,
    "bigSmallPlateRoad": bigSmallPlateRoad,
    "newBigPairRoad": newBigPairRoad,
  };
}