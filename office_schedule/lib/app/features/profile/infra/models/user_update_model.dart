import 'package:json_annotation/json_annotation.dart';

import '../../../../domain/entities/entities.dart';

part 'user_update_model.g.dart';

@JsonSerializable()
class UserUpdateModel extends UserUpdateEntity {
  UserUpdateModel({
    super.fullName,
    super.phone,
    super.company,
    super.specialty,
  });

  factory UserUpdateModel.fromJson(Map<String, dynamic> json) =>
      _$UserUpdateModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserUpdateModelToJson(this);

  factory UserUpdateModel.fromEntity(UserUpdateEntity entity) =>
      UserUpdateModel(
          fullName: entity.fullName,
          phone: entity.phone,
          company: entity.company,
          specialty: entity.specialty);
}
