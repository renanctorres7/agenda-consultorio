import 'package:dartz/dartz.dart';

import '../../../../core/errors/errors.dart';
import '../../../../core/success/success.dart';
import '../../domain/repository/repository.dart';
import '../datasources/datasource.dart';

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
