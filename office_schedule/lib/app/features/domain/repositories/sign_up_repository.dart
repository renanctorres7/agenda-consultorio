import 'package:dartz/dartz.dart';

import '../entities/sign_up_entity.dart';
import '../errors/errors.dart';

abstract class SignUpRepository {
  Future<Either<FailureError, SignUpEntity>> signUp(SignUpEntity params);
}
