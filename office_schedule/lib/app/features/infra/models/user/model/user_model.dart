import 'package:json_annotation/json_annotation.dart';

import '../../../../domain/entities/entities.dart';

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
}
