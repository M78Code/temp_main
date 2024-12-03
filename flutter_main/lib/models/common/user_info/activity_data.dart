import 'dart:convert';
import 'package:flutter_main/language/translations_service.dart';

ActivityData activityDataFromJson(String str) =>
    ActivityData.fromJson(json.decode(str));
String activityDataToJson(ActivityData data) => json.encode(data.toJson());

class ActivityData {
  int? pageIndex;
  int? pageSize;
  List<Activity>? record;
  dynamic summary;
  int? totalPage;
  int? totalRecord;

  ActivityData({
    this.pageIndex,
    this.pageSize,
    this.record,
    this.summary,
    this.totalPage,
    this.totalRecord,
  });

  factory ActivityData.fromJson(Map<String, dynamic> json) => ActivityData(
        pageIndex: json["pageIndex"],
        pageSize: json["pageSize"],
        record: json["record"] == null
            ? []
            : List<Activity>.from(
                json["record"]!.map((x) => Activity.fromJson(x))),
        summary: json["summary"],
        totalPage: json["totalPage"],
        totalRecord: json["totalRecord"],
      );

  Map<String, dynamic> toJson() => {
        "pageIndex": pageIndex,
        "pageSize": pageSize,
        "record": record == null
            ? []
            : List<dynamic>.from(record!.map((x) => x.toJson())),
        "summary": summary,
        "totalPage": totalPage,
        "totalRecord": totalRecord,
      };
}

class Activity {
  String? activityBannerUrl;
  Map? activityBannerUrlLanguageMap;
  int? activityEndTime;
  int? activityId;
  String? activityName;
  Map? activityNameLanguageMap;
  int? activityStartTime;
  int? activityTypeId;
  String? activityTypeName;
  String? activityTypeNoticeId;
  String? activityUrl;
  int? serverTime;
  int? showEndTime;
  int? showStartTime;
  Map? titleLanguageMap;

  Activity({
    this.activityBannerUrl,
    this.activityBannerUrlLanguageMap,
    this.activityEndTime,
    this.activityId,
    this.activityName,
    this.activityNameLanguageMap,
    this.activityStartTime,
    this.activityTypeId,
    this.activityTypeName,
    this.activityTypeNoticeId,
    this.activityUrl,
    this.serverTime,
    this.showEndTime,
    this.showStartTime,
    this.titleLanguageMap,
  });

  factory Activity.fromJson(Map<String, dynamic> json) => Activity(
        activityBannerUrl: json["activityBannerUrl"],
        activityBannerUrlLanguageMap: json["activityBannerUrlLanguageMap"],
        activityEndTime: json["activityEndTime"],
        activityId: json["activityId"],
        activityName: json["activityName"],
        activityNameLanguageMap: json["activityNameLanguageMap"],
        activityStartTime: json["activityStartTime"],
        activityTypeId: json["activityTypeId"],
        activityTypeName: json["activityTypeName"],
        activityTypeNoticeId: json["activityTypeNoticeId"],
        activityUrl: json["activityUrl"],
        serverTime: json["serverTime"],
        showEndTime: json["showEndTime"],
        showStartTime: json["showStartTime"],
        titleLanguageMap: json["titleLanguageMap"],
      );

  Map<String, dynamic> toJson() => {
        "activityBannerUrl": activityBannerUrl,
        "activityBannerUrlLanguageMap": activityBannerUrlLanguageMap,
        "activityEndTime": activityEndTime,
        "activityId": activityId,
        "activityName": activityName,
        "activityNameLanguageMap": activityNameLanguageMap,
        "activityStartTime": activityStartTime,
        "activityTypeId": activityTypeId,
        "activityTypeName": activityTypeName,
        "activityTypeNoticeId": activityTypeNoticeId,
        "activityUrl": activityUrl,
        "serverTime": serverTime,
        "showEndTime": showEndTime,
        "showStartTime": showStartTime,
        "titleLanguageMap": titleLanguageMap,
      };

  get getActivityBannerUrl {
    return activityBannerUrlLanguageMap == null
        ? ''
        : TranslationService.getText(activityBannerUrlLanguageMap!);
  }

  get getActivityName {
    return activityNameLanguageMap == null
        ? ''
        : TranslationService.getText(activityNameLanguageMap!);
  }

  get getTitle {
    return titleLanguageMap == null
        ? ''
        : TranslationService.getText(titleLanguageMap!);
  }
}
