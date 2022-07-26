import 'package:dartz/dartz.dart';

import 'package:office_schedule/app/core/errors/failure_error.dart';
import 'package:office_schedule/app/features/auth/domain/entities/entities.dart';
import 'package:office_schedule/app/features/auth/domain/repository/sign_up_repository.dart';

abstract class SignUpUsecase {
  Future<Either<FailureError, SignUpEntity>> call(SignUpEntity params);
}

class UserSignUpUsecaseImpl implements SignUpUsecase {
  final SignUpRepository repository;

  UserSignUpUsecaseImpl(this.repository);
  @override
  Future<Either<FailureError, SignUpEntity>> call(SignUpEntity params) async {
    final result = await repository.signUp(params);
    return result;
  }
}
