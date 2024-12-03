// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ws_10040_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Ws10040Model _$Ws10040ModelFromJson(Map<String, dynamic> json) => Ws10040Model(
      activityList: (json['activityList'] as List<dynamic>?)
          ?.map((e) => ActivityList.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$Ws10040ModelToJson(Ws10040Model instance) =>
    <String, dynamic>{
      'activityList': instance.activityList,
    };

ActivityList _$ActivityListFromJson(Map<String, dynamic> json) => ActivityList(
      activityTypeId: (json['activityTypeId'] as num?)?.toInt(),
      activityTypeName: json['activityTypeName'] as String?,
      showStartTime: (json['showStartTime'] as num?)?.toInt(),
      showEndTime: (json['showEndTime'] as num?)?.toInt(),
      activityStartTime: (json['activityStartTime'] as num?)?.toInt(),
      activityEndTime: (json['activityEndTime'] as num?)?.toInt(),
      serverTime: (json['serverTime'] as num?)?.toInt(),
      returnProfitBetPointDTOS:
          (json['returnProfitBetPointDTOS'] as List<dynamic>?)
              ?.map((e) =>
                  ReturnProfitBetPointDTOS.fromJson(e as Map<String, dynamic>))
              .toList(),
      contextLanguageMap: json['contextLanguageMap'] == null
          ? null
          : ContextLanguageMap.fromJson(
              json['contextLanguageMap'] as Map<String, dynamic>),
      lotteryChangeCount: (json['lotteryChangeCount'] as num?)?.toInt(),
      redeemChangeCount: (json['redeemChangeCount'] as num?)?.toInt(),
      floatBuoyList: json['floatBuoyList'] as List<dynamic>?,
    );

Map<String, dynamic> _$ActivityListToJson(ActivityList instance) =>
    <String, dynamic>{
      'activityTypeId': instance.activityTypeId,
      'activityTypeName': instance.activityTypeName,
      'showStartTime': instance.showStartTime,
      'showEndTime': instance.showEndTime,
      'activityStartTime': instance.activityStartTime,
      'activityEndTime': instance.activityEndTime,
      'serverTime': instance.serverTime,
      'returnProfitBetPointDTOS': instance.returnProfitBetPointDTOS,
      'contextLanguageMap': instance.contextLanguageMap,
      'lotteryChangeCount': instance.lotteryChangeCount,
      'redeemChangeCount': instance.redeemChangeCount,
      'floatBuoyList': instance.floatBuoyList,
    };

ReturnProfitBetPointDTOS _$ReturnProfitBetPointDTOSFromJson(
        Map<String, dynamic> json) =>
    ReturnProfitBetPointDTOS(
      betPointId: (json['betPointId'] as num?)?.toInt(),
      betPointName: json['betPointName'] as String?,
      returnProfitRate: json['returnProfitRate'] as String?,
    );

Map<String, dynamic> _$ReturnProfitBetPointDTOSToJson(
        ReturnProfitBetPointDTOS instance) =>
    <String, dynamic>{
      'betPointId': instance.betPointId,
      'betPointName': instance.betPointName,
      'returnProfitRate': instance.returnProfitRate,
    };

ContextLanguageMap _$ContextLanguageMapFromJson(Map<String, dynamic> json) =>
    ContextLanguageMap(
      vi: json['vi'] == null
          ? null
          : Vi.fromJson(json['vi'] as Map<String, dynamic>),
      th: json['th'] == null
          ? null
          : Th.fromJson(json['th'] as Map<String, dynamic>),
      kr: json['kr'] == null
          ? null
          : Kr.fromJson(json['kr'] as Map<String, dynamic>),
      en: json['en'] == null
          ? null
          : En.fromJson(json['en'] as Map<String, dynamic>),
      cn: json['cn'] == null
          ? null
          : Cn.fromJson(json['cn'] as Map<String, dynamic>),
      tc: json['tc'] == null
          ? null
          : Tc.fromJson(json['tc'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ContextLanguageMapToJson(ContextLanguageMap instance) =>
    <String, dynamic>{
      'vi': instance.vi,
      'th': instance.th,
      'kr': instance.kr,
      'en': instance.en,
      'cn': instance.cn,
      'tc': instance.tc,
    };

Vi _$ViFromJson(Map<String, dynamic> json) => Vi(
      languageCode: json['languageCode'] as String?,
      content: json['content'] as String?,
    );

Map<String, dynamic> _$ViToJson(Vi instance) => <String, dynamic>{
      'languageCode': instance.languageCode,
      'content': instance.content,
    };

Th _$ThFromJson(Map<String, dynamic> json) => Th(
      languageCode: json['languageCode'] as String?,
      content: json['content'] as String?,
    );

Map<String, dynamic> _$ThToJson(Th instance) => <String, dynamic>{
      'languageCode': instance.languageCode,
      'content': instance.content,
    };

Kr _$KrFromJson(Map<String, dynamic> json) => Kr(
      languageCode: json['languageCode'] as String?,
      content: json['content'] as String?,
    );

Map<String, dynamic> _$KrToJson(Kr instance) => <String, dynamic>{
      'languageCode': instance.languageCode,
      'content': instance.content,
    };

En _$EnFromJson(Map<String, dynamic> json) => En(
      languageCode: json['languageCode'] as String?,
      content: json['content'] as String?,
    );

Map<String, dynamic> _$EnToJson(En instance) => <String, dynamic>{
      'languageCode': instance.languageCode,
      'content': instance.content,
    };

Cn _$CnFromJson(Map<String, dynamic> json) => Cn(
      languageCode: json['languageCode'] as String?,
      content: json['content'] as String?,
    );

Map<String, dynamic> _$CnToJson(Cn instance) => <String, dynamic>{
      'languageCode': instance.languageCode,
      'content': instance.content,
    };

Tc _$TcFromJson(Map<String, dynamic> json) => Tc(
      languageCode: json['languageCode'] as String?,
      content: json['content'] as String?,
    );

Map<String, dynamic> _$TcToJson(Tc instance) => <String, dynamic>{
      'languageCode': instance.languageCode,
      'content': instance.content,
    };
