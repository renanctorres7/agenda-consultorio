

import 'package:dartz/dartz.dart';


import '../../../../core/errors/errors.dart';
import '../../domain/entities/entities.dart';
import '../../domain/repository/repository.dart';
import '../datasources/datasource.dart';

class GetClientsListRepositoryImpl implements GetClientsListRepository {
  final GetClientsListDatasource datasource;

  GetClientsListRepositoryImpl(this.datasource);
  @override
  Future<Either<FailureError, List<ClientsListEntity>>> getClientsList(
      {required String token}) async {
    try {
      final result = await datasource.getClientsList(token: token);
      return result != null ? Right(result) : Left(NullError());
    } catch (e) {
      return Left(DataSourceError());
    }
  }
}
