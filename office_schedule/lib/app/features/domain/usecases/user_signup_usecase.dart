import 'package:dartz/dartz.dart';

import '../entities/entities.dart';
import '../errors/errors.dart';
import '../repositories/respositories.dart';

abstract class UserSignUpUsecase {
  Future<Either<FailureError, UserSignUpEntity>> call(
      {required UserSignUpEntity params});
}

class UserSignUpUsecaseImpl implements UserSignUpUsecase {
  final UserSignUpRepository repository;

  UserSignUpUsecaseImpl(this.repository);
  @override
  Future<Either<FailureError, UserSignUpEntity>> call(
      {required UserSignUpEntity params}) async {
    return await repository.signUp(params);
  }
}
