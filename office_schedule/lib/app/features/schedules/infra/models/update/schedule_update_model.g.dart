// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_update_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ScheduleUpdateModel _$ScheduleUpdateModelFromJson(Map<String, dynamic> json) =>
    ScheduleUpdateModel(
      objectId: json['objectId'] as String,
      datetime: json['datetime'] as String?,
      client: json['client'] as String?,
      typePayment: json['typePayment'] as String?,
      paymentStatus: json['paymentStatus'] as String?,
      scheduleStatus: json['scheduleStatus'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$ScheduleUpdateModelToJson(
        ScheduleUpdateModel instance) =>
    <String, dynamic>{
      'objectId': instance.objectId,
      'datetime': instance.datetime,
      'client': instance.client,
      'typePayment': instance.typePayment,
      'paymentStatus': instance.paymentStatus,
      'scheduleStatus': instance.scheduleStatus,
      'description': instance.description,
    };
