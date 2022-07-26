import 'package:dartz/dartz.dart';

import '../../../../core/errors/errors.dart';
import '../../../../core/success/success.dart';

abstract class ReadStorageTokenRepository {
  Future<Either<FailureError, String>> readStorageToken({required String key});
}
