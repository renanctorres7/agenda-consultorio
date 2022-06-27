import 'package:dartz/dartz.dart';

import '../entities/entities.dart';
import '../errors/errors.dart';
import '../repositories/respositories.dart';

abstract class SignUpUsecase {
  Future<Either<FailureError, SignUpEntity>> call(
      {required SignUpEntity params});
}

class UserSignUpUsecaseImpl implements SignUpUsecase {
  final SignUpRepository repository;

  UserSignUpUsecaseImpl(this.repository);
  @override
  Future<Either<FailureError, SignUpEntity>> call(
      {required SignUpEntity params}) async {
    return await repository.signUp(params);
  }
}
