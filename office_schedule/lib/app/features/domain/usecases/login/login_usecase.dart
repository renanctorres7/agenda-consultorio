import 'package:dartz/dartz.dart';

import '../../entities/entities.dart';
import '../../errors/errors.dart';
import '../../repositories/respositories.dart';

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
