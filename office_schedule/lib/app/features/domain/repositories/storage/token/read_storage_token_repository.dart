import 'package:dartz/dartz.dart';

import '../../../errors/errors.dart';
import '../../../success/success.dart';

abstract class ReadStorageTokenRepository {
  Future<Either<FailureError, Success>> readStorageToken({required String key});
}
