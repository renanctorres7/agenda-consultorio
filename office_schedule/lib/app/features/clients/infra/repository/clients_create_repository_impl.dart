import 'package:office_schedule/app/features/domain/success/successful_response.dart';

import 'package:office_schedule/app/features/domain/errors/failure_error.dart';

import 'package:office_schedule/app/features/domain/entities/clients/clients_create_entity.dart';

import 'package:dartz/dartz.dart';
import 'package:office_schedule/app/features/infra/datasources/clients/clients_create_datasource.dart';

import '../../../domain/repositories/clients/clients.dart';

class ClientsCreateRepositoryImpl implements ClientsCreateRepository {
  final ClientsCreateDatasource datasource;

  ClientsCreateRepositoryImpl(this.datasource);
  @override
  Future<Either<FailureError, Success>> createClient(
      {required String token,
      required ClientsCreateEntity clientsCreateEntity}) async {
    try {
      final result = await datasource.createClient(
          token: token, clientsCreateEntity: clientsCreateEntity);
      return Right(result);
    } catch (e) {
      return Left(DataSourceError());
    }
  }
}
