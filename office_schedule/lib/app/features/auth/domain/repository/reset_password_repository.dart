import 'package:dartz/dartz.dart';

import 'package:office_schedule/app/core/errors/failure_error.dart';
import 'package:office_schedule/app/core/success/success.dart';

abstract class ResetPasswordRepository {
  Future<Either<FailureError, Success>> resetPassword(String email);
}
