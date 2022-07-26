import 'package:dartz/dartz.dart';

import '../../../domain/entities/entities.dart';
import '../../../domain/errors/errors.dart';
import '../../../domain/repositories/respositories.dart';

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
