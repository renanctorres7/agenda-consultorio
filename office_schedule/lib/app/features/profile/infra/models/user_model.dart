import 'package:office_schedule/app/features/users/domain/entities/user_entity.dart';

import '../../../auth/infra/models/models.dart';

class UserProfileModel extends UserEntity {
  UserProfileModel({
    required String fullName,
    required String phone,
    required String company,
    required String specialty,
    required String objectId,
    required String email,
  }) : super(
          fullName: fullName,
          phone: phone,
          company: company,
          specialty: specialty,
          objectId: objectId,
          email: email,
        );

  factory UserProfileModel.fromJson(Map<String, dynamic> json) {
    return UserProfileModel(
      fullName: json['fullName'],
      phone: json['phone'],
      company: json['company'],
      specialty: json['specialty'],
      objectId: json['objectId'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'fullName': fullName,
      'phone': phone,
      'company': company,
      'specialty': specialty,
      'objectId': objectId,
      'email': email,
    };
  }

  factory UserProfileModel.fromModel(UserEntity model) => UserProfileModel(
      email: model.email ?? "",
      fullName: model.fullName ?? "",
      phone: model.phone ?? "",
      company: model.company ?? "",
      specialty: model.specialty ?? "",
      objectId: model.objectId ?? "");

  factory UserProfileModel.fromSignUpModel(SignUpModel model) =>
      UserProfileModel(
          email: model.email ?? "",
          fullName: model.fullName ?? "",
          phone: model.phone ?? "",
          company: model.company ?? "",
          specialty: model.specialty ?? "",
          objectId: model.objectId ?? "");
}
