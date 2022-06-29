import 'package:dartz/dartz.dart';

import '../entities/entities.dart';
import '../errors/errors.dart';

abstract class UsersListUsecase {
  Future<Either<FailureError, List<UsersEntity>>> call();
}

class UsersListUsecaseImpl extends UsersListUsecase {
  @override
  Future<Either<FailureError, UsersEntity>> call() {
    return;
  }
}
