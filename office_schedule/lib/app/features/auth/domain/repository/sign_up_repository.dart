import 'package:dartz/dartz.dart';

import '../../entities/entities.dart';
import '../../errors/errors.dart';

abstract class SignUpRepository {
  Future<Either<FailureError, SignUpEntity>> signUp(SignUpEntity params);
}
