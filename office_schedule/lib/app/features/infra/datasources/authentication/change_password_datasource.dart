import '../../../domain/entities/entities.dart';
import '../../../domain/success/success.dart';

abstract class ChangePasswordDatasource {
  Future<Success> changePasswordEmail(
      String token, NewPasswordEntity newPassword);
}
