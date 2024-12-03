// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stream_init_rep.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StreamInitRep _$StreamInitRepFromJson(Map<String, dynamic> json) =>
    StreamInitRep(
      returnData: json['return_data'] == null
          ? null
          : StreamInitReturnData.fromJson(
              json['return_data'] as Map<String, dynamic>),
      returnDesc: json['return_desc'] as String?,
      returnStamp: json['return_stamp'] as String?,
    );

Map<String, dynamic> _$StreamInitRepToJson(StreamInitRep instance) =>
    <String, dynamic>{
      'return_data': instance.returnData,
      'return_desc': instance.returnDesc,
      'return_stamp': instance.returnStamp,
    };

StreamInitReturnData _$StreamInitReturnDataFromJson(
        Map<String, dynamic> json) =>
    StreamInitReturnData(
      checkToken: (json['checkToken'] as num?)?.toInt(),
      domainList: json['domain_list'] as String?,
      lineStrategy: json['lineStrategy'] as String?,
      playTimeout: (json['play_timeout'] as num?)?.toInt(),
      requestHostTimeout: (json['request_host_timeout'] as num?)?.toInt(),
      sessionId: json['sessionId'] as String?,
      speedTest: json['speed_test'] == null
          ? null
          : SpeedTest.fromJson(json['speed_test'] as Map<String, dynamic>),
      updateStatus: (json['updateStatus'] as num?)?.toInt(),
      urlOption: (json['urlOption'] as num?)?.toInt(),
    );

Map<String, dynamic> _$StreamInitReturnDataToJson(
        StreamInitReturnData instance) =>
    <String, dynamic>{
      'checkToken': instance.checkToken,
      'domain_list': instance.domainList,
      'lineStrategy': instance.lineStrategy,
      'play_timeout': instance.playTimeout,
      'request_host_timeout': instance.requestHostTimeout,
      'sessionId': instance.sessionId,
      'speed_test': instance.speedTest,
      'updateStatus': instance.updateStatus,
      'urlOption': instance.urlOption,
    };

SpeedTest _$SpeedTestFromJson(Map<String, dynamic> json) => SpeedTest(
      pingNum: (json['ping_num'] as num?)?.toInt(),
      pingTimeout: (json['ping_timeout'] as num?)?.toInt(),
      speedFrequency: (json['speed_frequency'] as num?)?.toInt(),
      speedType: (json['speed_type'] as num?)?.toInt(),
    );

Map<String, dynamic> _$SpeedTestToJson(SpeedTest instance) => <String, dynamic>{
      'ping_num': instance.pingNum,
      'ping_timeout': instance.pingTimeout,
      'speed_frequency': instance.speedFrequency,
      'speed_type': instance.speedType,
    };
