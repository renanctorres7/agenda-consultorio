// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_password_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewPasswordModel _$NewPasswordModelFromJson(Map<String, dynamic> json) =>
    NewPasswordModel(
      currentEmail: json['currentEmail'] as String,
      newEmail: json['newEmail'] as String,
      currentPassword: json['currentPassword'] as String,
      newPassword: json['newPassword'] as String,
    );

Map<String, dynamic> _$NewPasswordModelToJson(NewPasswordModel instance) =>
    <String, dynamic>{
      'currentEmail': instance.currentEmail,
      'newEmail': instance.newEmail,
      'currentPassword': instance.currentPassword,
      'newPassword': instance.newPassword,
    };
