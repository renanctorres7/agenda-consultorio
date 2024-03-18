import 'dart:math';

import 'package:office_schedule/app/features/auth/domain/entities/entities.dart';

class SignUpModel extends SignUpEntity {
  SignUpModel({
    this.sessionToken,
    this.profileImg,
    this.createdAt,
    this.updatedAt,
    this.username,
    super.email,
    super.password,
    super.fullName,
    super.phone,
    super.company,
    super.specialty,
    super.objectId,
  });

  final String? sessionToken;
  final String? profileImg;
  final String? createdAt;
  final String? updatedAt;
  final String? username;

  factory SignUpModel.fromJson(Map<String, dynamic> json) {
    return SignUpModel(
        company: json['company'],
        email: json['email'],
        username: json['username'],
        fullName: json['fullName'],
        password: json['password'],
        phone: json['phone'],
        specialty: json['specialty'],
        objectId: json['objectId'],
        sessionToken: json['sessionToken'],
        profileImg: json['profileImg'],
        createdAt: json['createdAt'],
        updatedAt: json['updatedAt']);
  }

  Map<String, dynamic> toJson() {
    return {
      'company': company,
      'email': email,
      'fullName': fullName,
      'password': password,
      'phone': phone,
      'specialty': specialty,
      'objectId': objectId,
      'sessionToken': sessionToken,
      'profileImg': profileImg,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'username': username
    };
  }

  factory SignUpModel.fromEntity(SignUpEntity entity) {
    return SignUpModel(
        company: entity.company,
        email: entity.email,
        fullName: entity.fullName,
        password: entity.password,
        phone: entity.phone,
        specialty: entity.specialty,
        sessionToken: entity.token,
        username: entity.email,
        objectId: entity.objectId);
  }
}
