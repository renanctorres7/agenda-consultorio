import 'package:json_annotation/json_annotation.dart';
import 'package:office_schedule/app/features/domain/entities/entities.dart';

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
  Map<String, dynamic> toJson() => _$NewPasswordModelToJson(super);
}