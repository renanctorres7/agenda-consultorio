// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_create_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ScheduleCreateModel _$ScheduleCreateModelFromJson(Map<String, dynamic> json) =>
    ScheduleCreateModel(
      datetime: json['datetime'] as String,
      client: json['client'] as String,
      typePayment: json['typePayment'] as String,
      paymentStatus: json['paymentStatus'] as String,
      scheduleStatus: json['scheduleStatus'] as String,
      registeredClient: json['registeredClient'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$ScheduleCreateModelToJson(
        ScheduleCreateModel instance) =>
    <String, dynamic>{
      'datetime': instance.datetime,
      'client': instance.client,
      'registeredClient': instance.registeredClient,
      'typePayment': instance.typePayment,
      'paymentStatus': instance.paymentStatus,
      'scheduleStatus': instance.scheduleStatus,
      'description': instance.description,
    };
