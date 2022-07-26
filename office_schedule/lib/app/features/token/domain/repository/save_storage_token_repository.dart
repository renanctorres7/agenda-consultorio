import 'package:dartz/dartz.dart';

import '../../../errors/errors.dart';
import '../../../success/success.dart';

abstract class SaveStorageTokenRepository {
  Future<Either<FailureError, Success>> saveStorageToken(
      {required String key, required String value});
}
