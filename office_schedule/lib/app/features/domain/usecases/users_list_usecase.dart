import 'package:dartz/dartz.dart';
import 'package:office_schedule/app/features/domain/repositories/respositories.dart';

import '../entities/entities.dart';
import '../errors/errors.dart';

abstract class UsersListUsecase {
  Future<Either<FailureError, List<UsersEntity>>> call();
}

class UsersListUsecaseImpl extends UsersListUsecase {
  final UsersListRepository repository;

  UsersListUsecaseImpl(this.repository);
  @override
  Future<Either<FailureError, List<UsersEntity>>> call() async {
    final result = await repository.getUsersList();
    return result;
  }
}
