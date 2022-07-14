import 'package:dartz/dartz.dart';

import '../../../../domain/errors/errors.dart';
import '../../../../domain/repositories/respositories.dart';
import '../../../../domain/success/success.dart';
import '../../../datasources/storage/storage.dart';

class DeleteStorageTokenRepositoryImpl implements DeleteStorageTokenRepository {
  final DeleteStorageTokenDatasource datasource;

  DeleteStorageTokenRepositoryImpl(this.datasource);

  @override
  Future<Either<FailureError, Success>> deleteStorageToken(
      {required String key, required String value}) async {
    try {
      await datasource.deleteStorageToken(key: key, value: value);
      return Right(SuccessfulResponse());
    } catch (e) {
      return Left(DataSourceError());
    }
  }
}
