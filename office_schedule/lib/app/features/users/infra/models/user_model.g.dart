// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      email: json['email'] as String?,
      password: json['password'] as String?,
      fullName: json['fullName'] as String?,
      phone: json['phone'] as String?,
      company: json['company'] as String?,
      specialty: json['specialty'] as String?,
      objectId: json['objectId'] as String?,
      token: json['token'] as String?,
      profileImg: json['profileImg'] as String?,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'fullName': instance.fullName,
      'phone': instance.phone,
      'company': instance.company,
      'specialty': instance.specialty,
      'objectId': instance.objectId,
      'token': instance.token,
      'profileImg': instance.profileImg,
    };
