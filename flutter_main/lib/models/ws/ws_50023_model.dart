// To parse this JSON data, do
//
//     final giftModel = giftModelFromJson(jsonString);

import 'dart:convert';

Ws50023GiftModel giftModelFromJson(String str) =>
    Ws50023GiftModel.fromJson(json.decode(str));

String giftModelToJson(Ws50023GiftModel data) => json.encode(data.toJson());

class Ws50023GiftModel {
  int? id;
  String? presentName;
  double? presentPrice;
  int? sort;
  String? presentImgUrl;
  String? soundEffectFileUrl;
  String? animationEffectFileUrls;
  List<ContentLanguageList>? contentLanguageList;
  ContentLanguageMap? contentLanguageMap;
  double? propsCnyPrice;
  double? propsVndPrice;
  double? propsUsdtPrice;
  double? propsTwdPrice;
  double? propsBruneiPrice;
  double? propsThbPrice;
  double? propsMyrPrice;
  double? propsIdrPrice;
  double? propsKrwPrice;
  double? propsInrPrice;
  double? propsBrlPrice;
  double? propsGbpPrice;
  double? propsTsTwdPrice;

  Ws50023GiftModel({
    this.id,
    this.presentName,
    this.presentPrice,
    this.sort,
    this.presentImgUrl,
    this.soundEffectFileUrl,
    this.animationEffectFileUrls,
    this.contentLanguageList,
    this.contentLanguageMap,
    this.propsCnyPrice,
    this.propsVndPrice,
    this.propsUsdtPrice,
    this.propsTwdPrice,
    this.propsBruneiPrice,
    this.propsThbPrice,
    this.propsMyrPrice,
    this.propsIdrPrice,
    this.propsKrwPrice,
    this.propsInrPrice,
    this.propsBrlPrice,
    this.propsGbpPrice,
    this.propsTsTwdPrice,
  });

  factory Ws50023GiftModel.fromJson(Map<String, dynamic> json) =>
      Ws50023GiftModel(
        id: json["id"],
        presentName: json["presentName"],
        presentPrice: json["presentPrice"]?.toDouble(),
        sort: json["sort"],
        presentImgUrl: json["presentImgUrl"],
        soundEffectFileUrl: json["soundEffectFileUrl"],
        animationEffectFileUrls: json["animationEffectFileUrls"],
        contentLanguageList: json["contentLanguageList"] == null
            ? []
            : List<ContentLanguageList>.from(json["contentLanguageList"]!
                .map((x) => ContentLanguageList.fromJson(x))),
        contentLanguageMap: json["contentLanguageMap"] == null
            ? null
            : ContentLanguageMap.fromJson(json["contentLanguageMap"]),
        propsCnyPrice: json["propsCnyPrice"]?.toDouble(),
        propsVndPrice: json["propsVndPrice"],
        propsUsdtPrice: json["propsUsdtPrice"]?.toDouble(),
        propsTwdPrice: json["propsTwdPrice"]?.toDouble(),
        propsBruneiPrice: json["propsBruneiPrice"]?.toDouble(),
        propsThbPrice: json["propsThbPrice"],
        propsMyrPrice: json["propsMyrPrice"]?.toDouble(),
        propsIdrPrice: json["propsIdrPrice"],
        propsKrwPrice: json["propsKrwPrice"],
        propsInrPrice: json["propsInrPrice"],
        propsBrlPrice: json["propsBrlPrice"]?.toDouble(),
        propsGbpPrice: json["propsGbpPrice"]?.toDouble(),
        propsTsTwdPrice: json["propsTsTwdPrice"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "presentName": presentName,
        "presentPrice": presentPrice,
        "sort": sort,
        "presentImgUrl": presentImgUrl,
        "soundEffectFileUrl": soundEffectFileUrl,
        "animationEffectFileUrls": animationEffectFileUrls,
        "contentLanguageList": contentLanguageList == null
            ? []
            : List<dynamic>.from(contentLanguageList!.map((x) => x.toJson())),
        "contentLanguageMap": contentLanguageMap?.toJson(),
        "propsCnyPrice": propsCnyPrice,
        "propsVndPrice": propsVndPrice,
        "propsUsdtPrice": propsUsdtPrice,
        "propsTwdPrice": propsTwdPrice,
        "propsBruneiPrice": propsBruneiPrice,
        "propsThbPrice": propsThbPrice,
        "propsMyrPrice": propsMyrPrice,
        "propsIdrPrice": propsIdrPrice,
        "propsKrwPrice": propsKrwPrice,
        "propsInrPrice": propsInrPrice,
        "propsBrlPrice": propsBrlPrice,
        "propsGbpPrice": propsGbpPrice,
        "propsTsTwdPrice": propsTsTwdPrice,
      };
}

class ContentLanguageList {
  String? languageCode;
  String? content;

  ContentLanguageList({
    this.languageCode,
    this.content,
  });

  factory ContentLanguageList.fromJson(Map<String, dynamic> json) =>
      ContentLanguageList(
        languageCode: json["languageCode"],
        content: json["content"],
      );

  Map<String, dynamic> toJson() => {
        "languageCode": languageCode,
        "content": content,
      };
}

class ContentLanguageMap {
  ContentLanguageList? en;
  ContentLanguageList? zh;

  ContentLanguageMap({
    this.en,
    this.zh,
  });

  factory ContentLanguageMap.fromJson(Map<String, dynamic> json) =>
      ContentLanguageMap(
        en: json["en"] == null
            ? null
            : ContentLanguageList.fromJson(json["en"]),
        zh: json["zh"] == null
            ? null
            : ContentLanguageList.fromJson(json["zh"]),
      );

  Map<String, dynamic> toJson() => {
        "en": en?.toJson(),
        "zh": zh?.toJson(),
      };
}
