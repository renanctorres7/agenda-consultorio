import 'package:dartz/dartz.dart';

import '../../../../core/errors/errors.dart';
import '../../../../core/success/success.dart';
import '../../domain/repository/repository.dart';
import '../datasources/datasources.dart';

class DeleteStorageTokenRepositoryImpl implements DeleteStorageTokenRepository {
  final DeleteStorageTokenDatasource datasource;

  DeleteStorageTokenRepositoryImpl(this.datasource);

  @override
  Future<Either<FailureError, Success>> deleteStorageToken(
      {required String key}) async {
    try {
      await datasource.deleteStorageToken(key: key);
      return Right(SuccessfulResponse());
    } catch (e) {
      return Left(DataSourceError());
    }
  }
}
