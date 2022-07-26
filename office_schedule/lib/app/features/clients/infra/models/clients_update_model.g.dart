// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clients_update_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClientsUpdateModel _$ClientsUpdateModelFromJson(Map<String, dynamic> json) =>
    ClientsUpdateModel(
      objectId: json['objectId'] as String,
      name: json['name'] as String,
      phone: json['phone'] as String,
      address: json['address'] as String?,
      notes: json['notes'] as String?,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$ClientsUpdateModelToJson(ClientsUpdateModel instance) =>
    <String, dynamic>{
      'objectId': instance.objectId,
      'name': instance.name,
      'phone': instance.phone,
      'address': instance.address,
      'notes': instance.notes,
      'email': instance.email,
    };
