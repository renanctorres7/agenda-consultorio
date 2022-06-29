import 'package:json_annotation/json_annotation.dart';
import 'package:office_schedule/app/features/domain/entities/entities.dart';

part 'users_model.g.dart';

@JsonSerializable()
class UsersModel extends UsersEntity {
  UsersModel(
      {super.email,
      super.password,
      super.fullName,
      super.phone,
      super.company,
      super.specialty,
      super.objectId,
      super.token});

  factory UsersModel.fromJson(Map<String, dynamic> json) =>
      _$UsersModelFromJson(json);
  Map<String, dynamic> toJson() => _$UsersModelToJson(this);
}
