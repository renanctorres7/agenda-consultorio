import 'package:json_annotation/json_annotation.dart';

import 'package:office_schedule/app/features/auth/domain/entities/entities.dart';

part 'login_model.g.dart';

@JsonSerializable()
class LoginModel extends LoginEntity {
  LoginModel({required super.email, required super.password});

  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      _$LoginModelFromJson(json);
  Map<String, dynamic> toJson() => _$LoginModelToJson(this);

  factory LoginModel.fromEntity(LoginEntity entity) =>
      LoginModel(email: entity.email, password: entity.password);
}
