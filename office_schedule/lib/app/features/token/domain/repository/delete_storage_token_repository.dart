import 'package:dartz/dartz.dart';

import '../../../../core/errors/errors.dart';
import '../../../../core/success/success.dart';



abstract class DeleteStorageTokenRepository {
  Future<Either<FailureError, Success>> deleteStorageToken(
      {required String key});
}
