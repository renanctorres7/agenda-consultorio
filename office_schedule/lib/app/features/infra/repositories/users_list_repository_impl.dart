import 'package:office_schedule/app/features/domain/errors/failure_error.dart';

import 'package:office_schedule/app/features/domain/entities/users_entity.dart';

import 'package:dartz/dartz.dart';

import '../../domain/repositories/respositories.dart';

class UsersListRepositoryImpl extends UsersListRepository {
  @override
  Future<Either<FailureError, List<UsersEntity>>> getUsersList() {
    // TODO: implement getUsersList
    throw UnimplementedError();
  }
}
