import 'package:dartz/dartz.dart';

import '../../../domain/entities/entities.dart';
import '../../../domain/errors/errors.dart';

abstract class UpdateProfileRepository {
  Future<Either<FailureError, UserEntity>> updateProfile(
      String token, UserUpdateEntity userUpdateEntity);
}
