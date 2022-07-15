import 'package:dartz/dartz.dart';

import '../../entities/entities.dart';
import '../../errors/errors.dart';
import '../../success/success.dart';

abstract class ChangePasswordRepository {
  Future<Either<FailureError, Success>> changePasswordEmail(
      String token, NewPasswordEntity newPassword);
}
