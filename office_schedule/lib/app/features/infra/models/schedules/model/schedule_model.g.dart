// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ScheduleModel _$ScheduleModelFromJson(Map<String, dynamic> json) =>
    ScheduleModel(
      objectId: json['objectId'] as String,
      datetime: json['datetime'] as String,
      client: json['client'] as String,
      registeredClient: json['registeredClient'] as String?,
      description: json['description'] as String?,
      modifiedByModel:
          UserModel.fromJson(json['modifiedBy'] as Map<String, dynamic>),
      userModel: UserModel.fromJson(json['user'] as Map<String, dynamic>),
      typePayment: json['typePayment'] as String,
      paymentStatus: json['paymentStatus'] as String,
      scheduleStatus: json['scheduleStatus'] as String,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
    );

Map<String, dynamic> _$ScheduleModelToJson(ScheduleModel instance) =>
    <String, dynamic>{
      'objectId': instance.objectId,
      'datetime': instance.datetime,
      'client': instance.client,
      'registeredClient': instance.registeredClient,
      'description': instance.description,
      'typePayment': instance.typePayment,
      'paymentStatus': instance.paymentStatus,
      'scheduleStatus': instance.scheduleStatus,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'user': instance.userModel,
      'modifiedBy': instance.modifiedByModel,
    };
