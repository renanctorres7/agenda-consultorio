import 'package:dartz/dartz.dart';

import '../../../../core/errors/errors.dart';
import '../../../../core/success/success.dart';

abstract class SaveStorageTokenRepository {
  Future<Either<FailureError, Success>> saveStorageToken(
      {required String key, required String value});
}
