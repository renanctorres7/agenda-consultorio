import 'package:dartz/dartz.dart';

import 'package:office_schedule/app/core/errors/failure_error.dart';
import 'package:office_schedule/app/features/auth/domain/entities/entities.dart';

abstract class SignUpRepository {
  Future<Either<FailureError, SignUpEntity>> signUp(SignUpEntity params);
}
