import 'package:dartz/dartz.dart';

import '../../../errors/errors.dart';
import '../../../success/success.dart';

abstract class DeleteStorageTokenRepository {
  Future<Either<FailureError, Success>> deleteStorageToken(
      {required String key, required String value});
}
