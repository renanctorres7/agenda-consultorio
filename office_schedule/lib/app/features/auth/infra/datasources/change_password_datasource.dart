import 'package:office_schedule/app/core/success/success.dart';
import 'package:office_schedule/app/features/auth/domain/entities/entities.dart';

abstract class ChangePasswordDatasource {
  Future<Success> changePasswordEmail(
      String token, NewPasswordEntity newPassword);
}
