import 'package:office_schedule/app/features/domain/success/successful_response.dart';

import 'package:office_schedule/app/features/domain/errors/failure_error.dart';

import 'package:dartz/dartz.dart';
import 'package:office_schedule/app/features/infra/datasources/datasources.dart';

import '../../../domain/repositories/clients/clients.dart';

class DeleteClientRepositoryImpl implements DeleteClientRepository {
  final DeleteClientDatasource datasource;

  DeleteClientRepositoryImpl(this.datasource);
  @override
  Future<Either<FailureError, Success>> deleteClient(
      {required String token, required String objectId}) async {
    try {
      final result =
          await datasource.deleteClient(token: token, objectId: objectId);

      return Right(result);
    } catch (e) {
      return Left(DataSourceError());
    }
  }
}
