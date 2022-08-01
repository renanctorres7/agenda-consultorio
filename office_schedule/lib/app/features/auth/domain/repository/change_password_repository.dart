import 'package:dartz/dartz.dart';

import 'package:office_schedule/app/core/errors/failure_error.dart';
import 'package:office_schedule/app/core/success/successful_response.dart';

import 'package:office_schedule/app/features/auth/domain/entities/entities.dart';

abstract class ChangePasswordRepository {
  Future<Either<FailureError, Success>> changePasswordEmail(
      String token, NewPasswordEntity newPassword);
}
