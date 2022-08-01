import 'package:dartz/dartz.dart';

import '../../../../core/errors/errors.dart';

import '../entities/user_entity.dart';
import '../repository/repository.dart';

abstract class UsersListUsecase {
  Future<Either<FailureError, List<UserEntity>>> call(String token);
}

class UsersListUsecaseImpl implements UsersListUsecase {
  final UsersListRepository repository;

  UsersListUsecaseImpl(this.repository);
  @override
  Future<Either<FailureError, List<UserEntity>>> call(String token) async {
    final result = await repository.getUsersList(token);
    return result;
  }
}
