// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clients_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClientsModel _$ClientsModelFromJson(Map<String, dynamic> json) => ClientsModel(
      objectId: json['objectId'] as String,
      name: json['name'] as String,
      phone: json['phone'] as String,
      address: json['address'] as String?,
      notes: json['notes'] as String?,
      email: json['email'] as String?,
      createdByModel:
          UserModel.fromJson(json['createdBy'] as Map<String, dynamic>),
      modifiedByModel:
          UserModel.fromJson(json['modifiedBy'] as Map<String, dynamic>),
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
    );

Map<String, dynamic> _$ClientsModelToJson(ClientsModel instance) =>
    <String, dynamic>{
      'objectId': instance.objectId,
      'name': instance.name,
      'phone': instance.phone,
      'address': instance.address,
      'notes': instance.notes,
      'email': instance.email,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'createdBy': instance.createdByModel,
      'modifiedBy': instance.modifiedByModel,
    };
