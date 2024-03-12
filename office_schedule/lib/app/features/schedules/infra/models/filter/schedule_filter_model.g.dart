// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_filter_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ScheduleFilterModel _$ScheduleFilterModelFromJson(Map<String, dynamic> json) =>
    ScheduleFilterModel(
      page: json['page'] as int,
      period: json['period'] as int,
      user: json['user'] as String?,
      modifiedBy: json['modifiedBy'] as String?,
      client: json['client'] as String?,
      scheduleStatus: json['scheduleStatus'] as String?,
      typePayment: json['typePayment'] as String?,
      paymentStatus: json['paymentStatus'] as String?,
      description: json['description'] as String?,
      registeredClient: json['registeredClient'] as String?,
    );

Map<String, dynamic> _$ScheduleFilterModelToJson(
        ScheduleFilterModel instance) =>
    <String, dynamic>{
      'page': instance.page,
      'period': instance.period,
      'user': instance.user,
      'modifiedBy': instance.modifiedBy,
      'client': instance.client,
      'scheduleStatus': instance.scheduleStatus,
      'typePayment': instance.typePayment,
      'paymentStatus': instance.paymentStatus,
      'description': instance.description,
      'registeredClient': instance.registeredClient,
    };
