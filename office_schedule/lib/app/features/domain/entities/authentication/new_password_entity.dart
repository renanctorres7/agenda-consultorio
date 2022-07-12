abstract class NewPasswordEntity {
  final String currentEmail;
  final String newEmail;
  final String currentPassword;
  final String newPassword;

  NewPasswordEntity(
      {required this.currentEmail,
      required this.newEmail,
      required this.currentPassword,
      required this.newPassword});
}
