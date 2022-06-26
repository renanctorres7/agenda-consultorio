import 'package:equatable/equatable.dart';

abstract class UserSignUpEntity extends Equatable {
  final String email;
  final String password;
  final String fullName;
  final String phone;
  final String company;
  final String specialty;
  final String? objectId;
  final String? token;

  const UserSignUpEntity(
      {required this.email,
      required this.password,
      required this.fullName,
      required this.phone,
      required this.company,
      required this.specialty,
      this.objectId,
      this.token});
}
