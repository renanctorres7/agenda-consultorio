import 'package:json_annotation/json_annotation.dart';
import 'package:office_schedule/app/features/domain/entities/entities.dart';

part 'sign_up_model.g.dart';

@JsonSerializable()
class SignUpModel extends SignUpEntity {
  const SignUpModel(
      {required super.email,
      required super.password,
      required super.fullName,
      required super.phone,
      required super.company,
      required super.specialty,
      super.objectId,
      super.token});

  factory SignUpModel.fromJson(Map<String, dynamic> json) =>
      _$SignUpModelFromJson(json);
  Map<String, dynamic> toJson() => _$SignUpModelToJson(this);

  factory SignUpModel.fromEntity(SignUpEntity entity) {
    return SignUpModel(
        company: entity.company,
        email: entity.email,
        fullName: entity.fullName,
        password: entity.password,
        phone: entity.phone,
        specialty: entity.specialty,
        token: entity.token,
        objectId: entity.objectId);
  }
}