import 'package:dartz/dartz.dart';

import '../entities/user_signup_entity.dart';
import '../errors/errors.dart';

abstract class UserSignUpRepository {
  Future<Either<FailureError, UserSignUpEntity>> signUp(
      UserSignUpEntity params);
}
