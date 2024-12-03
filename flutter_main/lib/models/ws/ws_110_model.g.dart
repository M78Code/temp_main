// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ws_110_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Ws110Model _$Ws110ModelFromJson(Map<String, dynamic> json) => Ws110Model(
      superTiePlayerCount: (json['superTiePlayerCount'] as num?)?.toInt(),
      currentRoundPlayerCount:
          (json['currentRoundPlayerCount'] as num?)?.toInt(),
      currentRoundPlayerAmountCount:
          (json['currentRoundPlayerAmountCount'] as num?)?.toInt(),
      currency: json['currency'] as String?,
      jackpotPoolInfos: (json['jackpotPoolInfos'] as List<dynamic>?)
          ?.map((e) => JackpotPoolInfos.fromJson(e as Map<String, dynamic>))
          .toList(),
      virtualTableDetail: (json['virtualTableDetail'] as List<dynamic>?)
          ?.map((e) => VirtualTableDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$Ws110ModelToJson(Ws110Model instance) =>
    <String, dynamic>{
      'superTiePlayerCount': instance.superTiePlayerCount,
      'currentRoundPlayerCount': instance.currentRoundPlayerCount,
      'currentRoundPlayerAmountCount': instance.currentRoundPlayerAmountCount,
      'currency': instance.currency,
      'jackpotPoolInfos': instance.jackpotPoolInfos,
      'virtualTableDetail': instance.virtualTableDetail,
    };

JackpotPoolInfos _$JackpotPoolInfosFromJson(Map<String, dynamic> json) =>
    JackpotPoolInfos(
      betPointId: (json['betPointId'] as num?)?.toInt(),
      totalAmount: (json['totalAmount'] as num?)?.toInt(),
      totalPersonCount: (json['totalPersonCount'] as num?)?.toInt(),
    );

Map<String, dynamic> _$JackpotPoolInfosToJson(JackpotPoolInfos instance) =>
    <String, dynamic>{
      'betPointId': instance.betPointId,
      'totalAmount': instance.totalAmount,
      'totalPersonCount': instance.totalPersonCount,
    };

VirtualTableDetail _$VirtualTableDetailFromJson(Map<String, dynamic> json) =>
    VirtualTableDetail(
      playerId: (json['playerId'] as num?)?.toInt(),
      betPointId: (json['betPointId'] as num?)?.toInt(),
      amount: (json['amount'] as num?)?.toInt(),
    );

Map<String, dynamic> _$VirtualTableDetailToJson(VirtualTableDetail instance) =>
    <String, dynamic>{
      'playerId': instance.playerId,
      'betPointId': instance.betPointId,
      'amount': instance.amount,
    };
