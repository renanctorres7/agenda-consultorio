import 'package:dartz/dartz.dart';

import '../../entities/entities.dart';
import '../../errors/errors.dart';

abstract class UpdateProfileRepository {
  Future<Either<FailureError, UserEntity>> updateProfile(
      UserUpdateEntity userUpdateEntity);
}
