import 'package:dartz/dartz.dart';

import '../../../../core/errors/errors.dart';
import '../../domain/entities/entities.dart';
import '../../domain/repository/repository.dart';
import '../datasources/datasource.dart';

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
