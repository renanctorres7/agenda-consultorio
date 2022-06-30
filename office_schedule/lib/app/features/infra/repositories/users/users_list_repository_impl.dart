import 'package:dartz/dartz.dart';

import '../../../domain/entities/entities.dart';
import '../../../domain/errors/errors.dart';
import '../../../domain/repositories/respositories.dart';
import '../../datasources/datasources.dart';

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
