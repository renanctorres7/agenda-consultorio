import 'package:office_schedule/app/features/domain/errors/failure_error.dart';

import 'package:office_schedule/app/features/domain/entities/clients/clients_list_entity.dart';

import 'package:dartz/dartz.dart';
import 'package:office_schedule/app/features/infra/datasources/clients/clients.dart';

import '../../../domain/repositories/clients/clients.dart';

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
