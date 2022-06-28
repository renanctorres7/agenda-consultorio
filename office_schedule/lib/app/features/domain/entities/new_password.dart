abstract class NewPassword {
  final String currentEmail;
  final String newEmail;
  final String currentPassword;
  final String newPassword;

  NewPassword(
      {required this.currentEmail,
      required this.newEmail,
      required this.currentPassword,
      required this.newPassword});
}
