import 'package:dartz/dartz.dart';

import '../../../../core/errors/errors.dart';
import '../../../../core/success/success.dart';
import '../../domain/repository/repository.dart';
import '../datasources/datasources.dart';

class SaveStorageTokenRepositoryImpl implements SaveStorageTokenRepository {
  final SaveStorageTokenDatasource datasource;

  SaveStorageTokenRepositoryImpl(this.datasource);
  @override
  Future<Either<FailureError, Success>> saveStorageToken(
      {required String key, required String value}) async {
    try {
      await datasource.saveStorageToken(key: key, value: value);
      return Right(SuccessfulResponse());
    } catch (e) {
      return Left(DataSourceError());
    }
  }
}
