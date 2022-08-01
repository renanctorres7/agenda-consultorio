import 'package:dartz/dartz.dart';

import 'package:office_schedule/app/core/errors/failure_error.dart';

import 'package:office_schedule/app/features/auth/domain/entities/entities.dart';
import 'package:office_schedule/app/features/auth/domain/repository/login_repository.dart';

abstract class LoginUsecase {
  Future<Either<FailureError, SignUpEntity>> call(LoginEntity entity);
}

class LoginUsecaseImpl implements LoginUsecase {
  final LoginRepository repository;

  LoginUsecaseImpl(this.repository);
  @override
  Future<Either<FailureError, SignUpEntity>> call(LoginEntity entity) async {
    final result = await repository.login(entity);
    return result;
  }
}
