import 'package:dartz/dartz.dart';

import '../../entities/entities.dart';
import '../../errors/errors.dart';

abstract class GetUserRepository {
  Future<Either<FailureError, UserEntity>> getUserProfile(String objectId);
}
