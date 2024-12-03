// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stream_strategy_rep.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StreamStrategyRep _$StreamStrategyRepFromJson(Map<String, dynamic> json) =>
    StreamStrategyRep(
      returnData: json['return_data'] == null
          ? null
          : StreamStrategyReturnData.fromJson(
              json['return_data'] as Map<String, dynamic>),
      returnDesc: json['return_desc'] as String?,
      returnStamp: json['return_stamp'] as String?,
    );

Map<String, dynamic> _$StreamStrategyRepToJson(StreamStrategyRep instance) =>
    <String, dynamic>{
      'return_data': instance.returnData,
      'return_desc': instance.returnDesc,
      'return_stamp': instance.returnStamp,
    };

StreamStrategyReturnData _$StreamStrategyReturnDataFromJson(
        Map<String, dynamic> json) =>
    StreamStrategyReturnData(
      extraStrategyDtos: json['extraStrategyDtos'] as List<dynamic>?,
      strategyDtos: (json['strategyDtos'] as List<dynamic>?)
          ?.map((e) => StrategyDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$StreamStrategyReturnDataToJson(
        StreamStrategyReturnData instance) =>
    <String, dynamic>{
      'extraStrategyDtos': instance.extraStrategyDtos,
      'strategyDtos': instance.strategyDtos,
    };

StrategyDto _$StrategyDtoFromJson(Map<String, dynamic> json) => StrategyDto(
      applicationCode: json['applicationCode'] as String?,
      level: (json['level'] as num?)?.toInt(),
      mark: json['mark'] as String?,
      strategyCode: json['strategyCode'] as String?,
      strategyLineDtos: (json['strategyLineDtos'] as List<dynamic>?)
          ?.map((e) => StrategyLineDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      strategyName: json['strategyName'] as String?,
      type: (json['type'] as num?)?.toInt(),
    );

Map<String, dynamic> _$StrategyDtoToJson(StrategyDto instance) =>
    <String, dynamic>{
      'applicationCode': instance.applicationCode,
      'level': instance.level,
      'mark': instance.mark,
      'strategyCode': instance.strategyCode,
      'strategyLineDtos': instance.strategyLineDtos,
      'strategyName': instance.strategyName,
      'type': instance.type,
    };

StrategyLineDto _$StrategyLineDtoFromJson(Map<String, dynamic> json) =>
    StrategyLineDto(
      appId: json['app_id'] as String?,
      applicationCode: json['applicationCode'] as String?,
      delay: (json['delay'] as num?)?.toInt(),
      domain: (json['domain'] as List<dynamic>?)
          ?.map((e) => Domain.fromJson(e as Map<String, dynamic>))
          .toList(),
      hrefType: json['hrefType'] as String?,
      mountPoint: json['mountPoint'] as String?,
      order: (json['order'] as num?)?.toInt(),
      protocol: json['protocol'] as String?,
      remark: json['remark'] as String?,
      sharpness: (json['sharpness'] as num?)?.toInt(),
      strategyCode: json['strategyCode'] as String?,
      thirdpartyCode: json['thirdpartyCode'] as String?,
    );

Map<String, dynamic> _$StrategyLineDtoToJson(StrategyLineDto instance) =>
    <String, dynamic>{
      'app_id': instance.appId,
      'applicationCode': instance.applicationCode,
      'delay': instance.delay,
      'domain': instance.domain,
      'hrefType': instance.hrefType,
      'mountPoint': instance.mountPoint,
      'order': instance.order,
      'protocol': instance.protocol,
      'remark': instance.remark,
      'sharpness': instance.sharpness,
      'strategyCode': instance.strategyCode,
      'thirdpartyCode': instance.thirdpartyCode,
    };

Domain _$DomainFromJson(Map<String, dynamic> json) => Domain(
      host: json['host'] as String?,
    );

Map<String, dynamic> _$DomainToJson(Domain instance) => <String, dynamic>{
      'host': instance.host,
    };
