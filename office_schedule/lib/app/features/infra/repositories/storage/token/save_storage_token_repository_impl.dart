import 'package:dartz/dartz.dart';
import 'package:office_schedule/app/features/infra/datasources/storage/token/save_storage_token_datasource.dart';

import '../../../../domain/errors/errors.dart';
import '../../../../domain/repositories/respositories.dart';
import '../../../../domain/success/success.dart';

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
