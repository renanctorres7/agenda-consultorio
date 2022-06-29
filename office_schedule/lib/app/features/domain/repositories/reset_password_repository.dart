import 'package:dartz/dartz.dart';

import '../errors/errors.dart';
import '../success/success.dart';

abstract class ResetPasswordRepository {
  Future<Either<FailureError, Success>> resetPassword(String email);
}
