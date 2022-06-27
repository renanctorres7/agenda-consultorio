import 'package:json_annotation/json_annotation.dart';
import 'package:office_schedule/app/features/domain/entities/entities.dart';

part 'user_signup_model.g.dart';

@JsonSerializable()
class UserSignUpModel extends UserSignUpEntity {
  const UserSignUpModel(
      {required super.email,
      required super.password,
      required super.fullName,
      required super.phone,
      required super.company,
      required super.specialty,
      super.objectId,
      super.token});

  factory UserSignUpModel.fromJson(Map<String, dynamic> json) =>
      _$UserSignUpModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserSignUpModelToJson(this);
}
