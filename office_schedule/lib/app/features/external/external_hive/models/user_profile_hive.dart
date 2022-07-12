import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../domain/entities/entities.dart';

part 'user_profile_hive.g.dart';

@JsonSerializable()
@HiveType(typeId: 0)
class UserProfileHive extends HiveObject {
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

  UserProfileHive(
      {required this.fullName,
      required this.phone,
      required this.company,
      required this.specialty,
      required this.objectId,
      required this.email});

  factory UserProfileHive.fromJson(Map<String, dynamic> json) =>
      _$UserProfileHiveFromJson(json);
  Map<String, dynamic> toJson() => _$UserProfileHiveToJson(this);

  factory UserProfileHive.fromModel(UserEntity model) => UserProfileHive(
      email: model.email ?? "",
      fullName: model.fullName ?? "",
      phone: model.phone ?? "",
      company: model.company ?? "",
      specialty: model.specialty ?? "",
      objectId: model.objectId ?? "");
}
