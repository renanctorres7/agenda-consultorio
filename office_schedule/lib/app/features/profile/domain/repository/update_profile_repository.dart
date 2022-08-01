import 'package:dartz/dartz.dart';

import '../../../../core/errors/errors.dart';
import '../../../users/domain/entities/user_entity.dart';
import '../entities/user_update_entity.dart';

abstract class UpdateProfileRepository {
  Future<Either<FailureError, UserEntity>> updateProfile(
      String token, UserUpdateEntity userUpdateEntity);
}
