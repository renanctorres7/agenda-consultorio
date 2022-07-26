import 'package:dartz/dartz.dart';

import '../../../../core/errors/errors.dart';
import '../../../users/domain/entities/user_entity.dart';
import '../entities/user_update_entity.dart';
import '../repository/update_profile_repository.dart';

abstract class UpdateProfileUsecase {
  Future<Either<FailureError, UserEntity>> call(
      String token, UserUpdateEntity userUpdateEntity);
}

class UpdateProfileUsecaseImpl implements UpdateProfileUsecase {
  final UpdateProfileRepository repository;

  UpdateProfileUsecaseImpl(this.repository);
  @override
  Future<Either<FailureError, UserEntity>> call(
      String token, UserUpdateEntity userUpdateEntity) async {
    final result = await repository.updateProfile(token, userUpdateEntity);
    return result;
  }
}
