import 'package:dartz/dartz.dart';

import '../../../errors/errors.dart';

abstract class ReadStorageTokenRepository {
  Future<Either<FailureError, String>> readStorageToken({required String key});
}
