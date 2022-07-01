import 'package:dartz/dartz.dart';

import '../../entities/entities.dart';
import '../../errors/errors.dart';
import '../../repositories/respositories.dart';

abstract class UsersListUsecase {
  Future<Either<FailureError, List<UsersEntity>>> call();
}

class UsersListUsecaseImpl implements UsersListUsecase {
  final UsersListRepository repository;

  UsersListUsecaseImpl(this.repository);
  @override
  Future<Either<FailureError, List<UsersEntity>>> call() async {
    final result = await repository.getUsersList();
    return result;
  }
}
