import 'package:dartz/dartz.dart';

import '../../errors/errors.dart';
import '../../success/success.dart';

abstract class ValidateTokenRepository {
  Future<Either<FailureError, Success>> validateToken(String token);
}
