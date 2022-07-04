import 'package:json_annotation/json_annotation.dart';

import '../../../domain/entities/entities.dart';

part 'new_password_model.g.dart';

@JsonSerializable()
class NewPasswordModel extends NewPasswordEntity {
  NewPasswordModel(
      {required super.currentEmail,
      required super.newEmail,
      required super.currentPassword,
      required super.newPassword});

  factory NewPasswordModel.fromJson(Map<String, dynamic> json) =>
      _$NewPasswordModelFromJson(json);
  Map<String, dynamic> toJson() => _$NewPasswordModelToJson(this);

  factory NewPasswordModel.fromEntity(NewPasswordEntity entity) =>
      NewPasswordModel(
          currentEmail: entity.currentEmail,
          newEmail: entity.newEmail,
          currentPassword: entity.currentPassword,
          newPassword: entity.newPassword);
}
