import 'package:dartz/dartz.dart';

import '../../../../core/errors/errors.dart';
import '../../../../core/success/success.dart';
import '../../domain/entities/entities.dart';
import '../../domain/repository/repository.dart';
import '../datasources/datasource.dart';

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
