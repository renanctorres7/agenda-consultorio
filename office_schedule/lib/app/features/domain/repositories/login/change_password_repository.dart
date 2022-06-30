import 'package:dartz/dartz.dart';
import 'package:office_schedule/app/features/domain/success/successful_response.dart';

import '../../entities/entities.dart';
import '../../errors/errors.dart';

abstract class ChangePasswordRepository {
  Future<Either<FailureError, Success>> changePasswordEmail(
      NewPasswordEntity newPassword);
}
