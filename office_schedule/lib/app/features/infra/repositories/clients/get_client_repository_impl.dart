import 'package:office_schedule/app/features/domain/errors/failure_error.dart';

import 'package:office_schedule/app/features/domain/entities/clients/clients_entity.dart';

import 'package:dartz/dartz.dart';
import 'package:office_schedule/app/features/infra/datasources/clients/get_clients_datasource.dart';

import '../../../domain/repositories/clients/clients.dart';

class GetClientRepositoryImp implements GetClientRepository {
  final GetClientDatasource datasource;

  GetClientRepositoryImp(this.datasource);
  @override
  Future<Either<FailureError, ClientsEntity>> getClient(
      {required String token, required String objectId}) async {
    try {
      final result =
          await datasource.getClient(token: token, objectId: objectId);
      return result != null ? Right(result) : Left(NullError());
    } catch (e) {
      return Left(DataSourceError());
    }
  }
}
