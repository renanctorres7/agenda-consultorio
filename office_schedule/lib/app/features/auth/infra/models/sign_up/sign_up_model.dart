import 'package:json_annotation/json_annotation.dart';

import '../../../../domain/entities/entities.dart';

part 'sign_up_model.g.dart';

@JsonSerializable()
class SignUpModel extends SignUpEntity {
  SignUpModel(
      {super.email,
      super.password,
      super.fullName,
      super.phone,
      super.company,
      super.specialty,
      super.objectId,
      super.token,
      this.profileImg});

  String? profileImg;

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
