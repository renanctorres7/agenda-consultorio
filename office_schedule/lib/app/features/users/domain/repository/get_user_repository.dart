import 'package:dartz/dartz.dart';

import '../../../../core/errors/errors.dart';
import '../entities/user_entity.dart';

abstract class GetUserRepository {
  Future<Either<FailureError, UserEntity>> getUserProfile(
      String token, String objectId);
}
