import 'package:dartz/dartz.dart';

import '../entities/entities.dart';
import '../errors/errors.dart';

abstract class UserSignUpUsecase {
  Future<Either<FailureError, UserSignUpEntity>> call(UserSignUpEntity params);
}

class UserSignUpUsecaseImpl implements UserSignUpUsecase {
  @override
  Future<Either<FailureError, UserSignUpEntity>> call(UserSignUpEntity params) {
    throw UnimplementedError();
  }
}
