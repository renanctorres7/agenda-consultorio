abstract class SignUpEntity {
  final String? email;
  final String? password;
  final String? fullName;
  final String? phone;
  final String? company;
  final String? specialty;
  final String? objectId;
  final String? token;

  const SignUpEntity(
      {this.email,
      this.password,
      this.fullName,
      this.phone,
      this.company,
      this.specialty,
      this.objectId,
      this.token});
}
