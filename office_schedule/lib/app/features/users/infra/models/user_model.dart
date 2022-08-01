import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/user_entity.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel extends UserEntity {
  UserModel(
      {super.email,
      super.password,
      super.fullName,
      super.phone,
      super.company,
      super.specialty,
      super.objectId,
      super.token,
      super.profileImg});

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  factory UserModel.fromEntity(UserEntity entity) => UserModel(
      email: entity.email,
      password: entity.password,
      fullName: entity.fullName,
      phone: entity.phone,
      company: entity.company,
      specialty: entity.specialty,
      objectId: entity.objectId,
      token: entity.token,
      profileImg: entity.profileImg);
}
