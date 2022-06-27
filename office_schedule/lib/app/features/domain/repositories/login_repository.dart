import 'package:dartz/dartz.dart';

import '../entities/entities.dart';
import '../errors/errors.dart';

abstract class LoginRepository {
  Future<Either<FailureError, SignUpEntity>> login(LoginEntity entity);
}
