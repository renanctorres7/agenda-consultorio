import 'package:dartz/dartz.dart';

import '../../entities/entities.dart';
import '../../errors/errors.dart';
import '../../repositories/respositories.dart';

abstract class UpdateProfileUsecase {
  Future<Either<FailureError, UserEntity>> call(
      UserUpdateEntity userUpdateEntity);
}

class UpdateProfileUsecaseImpl implements UpdateProfileUsecase {
  final UpdateProfileRepository repository;

  UpdateProfileUsecaseImpl(this.repository);
  @override
  Future<Either<FailureError, UserEntity>> call(
      UserUpdateEntity userUpdateEntity) async {
    final result = await repository.updateProfile(userUpdateEntity);
    return result;
  }
}
