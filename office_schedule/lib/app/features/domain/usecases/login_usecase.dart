import 'package:dartz/dartz.dart';
import 'package:office_schedule/app/features/domain/repositories/respositories.dart';

import '../entities/entities.dart';
import '../errors/errors.dart';

abstract class LoginUsecase {
  Future<Either<FailureError, SignUpEntity>> call(LoginEntity entity);
}

class LoginUsecaseImpl extends LoginUsecase {
  final LoginRepository repository;

  LoginUsecaseImpl(this.repository);
  @override
  Future<Either<FailureError, SignUpEntity>> call(LoginEntity entity) async {
    final result = await repository.login(entity);
    return result;
  }
}
