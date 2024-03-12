import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:office_schedule/app/features/auth/infra/models/models.dart';

import '../../../../users/domain/entities/user_entity.dart';

part 'hive_user_profile_model.g.dart';

@JsonSerializable()
@HiveType(typeId: 0)
class HiveUserProfileModel extends HiveObject {
  @HiveField(0)
  final String email;

  @HiveField(1)
  final String fullName;

  @HiveField(2)
  final String phone;

  @HiveField(3)
  final String company;

  @HiveField(4)
  final String specialty;

  @HiveField(5)
  final String objectId;

  HiveUserProfileModel(
      {required this.fullName,
      required this.phone,
      required this.company,
      required this.specialty,
      required this.objectId,
      required this.email});

  factory HiveUserProfileModel.fromJson(Map<String, dynamic> json) =>
      _$HiveUserProfileModelFromJson(json);
  Map<String, dynamic> toJson() => _$HiveUserProfileModelToJson(this);

  factory HiveUserProfileModel.fromModel(UserEntity model) =>
      HiveUserProfileModel(
          email: model.email ?? "",
          fullName: model.fullName ?? "",
          phone: model.phone ?? "",
          company: model.company ?? "",
          specialty: model.specialty ?? "",
          objectId: model.objectId ?? "");

  factory HiveUserProfileModel.fromSignUpModel(SignUpModel model) =>
      HiveUserProfileModel(
          email: model.email ?? "",
          fullName: model.fullName ?? "",
          phone: model.phone ?? "",
          company: model.company ?? "",
          specialty: model.specialty ?? "",
          objectId: model.objectId ?? "");
}
