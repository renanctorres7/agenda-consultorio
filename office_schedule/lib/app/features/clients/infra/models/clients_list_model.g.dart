// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clients_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClientsListModel _$ClientsListModelFromJson(Map<String, dynamic> json) =>
    ClientsListModel(
      objectId: json['objectId'] as String,
      name: json['name'] as String,
      phone: json['phone'] as String,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$ClientsListModelToJson(ClientsListModel instance) =>
    <String, dynamic>{
      'objectId': instance.objectId,
      'name': instance.name,
      'phone': instance.phone,
      'email': instance.email,
    };
