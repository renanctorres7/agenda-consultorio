import 'package:dartz/dartz.dart';

import '../../../../core/errors/errors.dart';
import '../../../../core/success/success.dart';
import '../../domain/entities/entities.dart';
import '../../domain/repository/repository.dart';
import '../datasources/datasource.dart';

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
