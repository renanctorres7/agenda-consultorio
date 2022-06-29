import 'package:office_schedule/app/features/domain/errors/failure_error.dart';

import 'package:office_schedule/app/features/domain/entities/users_entity.dart';

import 'package:dartz/dartz.dart';
import 'package:office_schedule/app/features/infra/datasources/datasources.dart';

import '../../domain/repositories/respositories.dart';

class UsersListRepositoryImpl extends UsersListRepository {
  final UsersListDatasource datasource;

  UsersListRepositoryImpl(this.datasource);
  @override
  Future<Either<FailureError, List<UsersEntity>>> getUsersList() async {
    try {
      final result = await datasource.getUsersList();
      return result != null ? Right(result) : Left(NullError());
    } catch (e) {
      return Left(DataSourceError());
    }
  }
}
