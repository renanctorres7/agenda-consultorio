// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clients_create_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClientsCreateModel _$ClientsCreateModelFromJson(Map<String, dynamic> json) =>
    ClientsCreateModel(
      name: json['name'] as String,
      phone: json['phone'] as String,
      address: json['address'] as String?,
      notes: json['notes'] as String?,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$ClientsCreateModelToJson(ClientsCreateModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'phone': instance.phone,
      'address': instance.address,
      'notes': instance.notes,
      'email': instance.email,
    };
