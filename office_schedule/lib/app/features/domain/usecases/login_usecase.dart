import 'package:dartz/dartz.dart';

import '../entities/entities.dart';
import '../errors/errors.dart';

abstract class LoginUsecase {
  Future<Either<FailureError, SignUpEntity>> call(
      {required LoginEntity entity});
}
