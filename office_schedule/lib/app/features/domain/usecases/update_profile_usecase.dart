import 'package:dartz/dartz.dart';

import '../entities/entities.dart';
import '../errors/errors.dart';
import '../repositories/respositories.dart';

abstract class UpdateProfileUsecase {
  Future<Either<FailureError, SignUpEntity>> call(SignUpEntity params);
}

class UpdateProfileUsecaseImpl implements UpdateProfileUsecase {
  final UpdateProfileRepository repository;

  UpdateProfileUsecaseImpl(this.repository);
  @override
  Future<Either<FailureError, SignUpEntity>> call(SignUpEntity params) async {
    final result = await repository.updateProfile(params);
    return result;
  }
}
