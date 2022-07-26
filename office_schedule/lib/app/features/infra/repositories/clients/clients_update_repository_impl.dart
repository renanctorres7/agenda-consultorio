import 'package:office_schedule/app/features/domain/success/successful_response.dart';

import 'package:office_schedule/app/features/domain/errors/failure_error.dart';

import 'package:office_schedule/app/features/domain/entities/clients/clients_update_entity.dart';

import 'package:dartz/dartz.dart';
import 'package:office_schedule/app/features/infra/datasources/clients/clients_update_datasource.dart';

import '../../../domain/repositories/clients/clients.dart';

class ClientsUpdateRepositoryImpl implements ClientsUpdateRepository {
  final ClientsUpdateDatasource datasource;

  ClientsUpdateRepositoryImpl(this.datasource);
  @override
  Future<Either<FailureError, Success>> updateClient(
      {required String token,
      required ClientsUpdateEntity clientsUpdateEntity}) async {
    try {
      final result = await datasource.updateClient(
          token: token, clientsUpdateEntity: clientsUpdateEntity);
      return Right(result);
    } catch (e) {
      return Left(DataSourceError());
    }
  }
}
