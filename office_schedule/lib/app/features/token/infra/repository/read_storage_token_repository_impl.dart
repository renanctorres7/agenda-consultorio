import 'package:dartz/dartz.dart';

import '../../../../domain/errors/errors.dart';
import '../../../../domain/repositories/respositories.dart';
import '../../../datasources/storage/storage.dart';

class ReadStorageTokenRepositoryImpl implements ReadStorageTokenRepository {
  final ReadStorageTokenDatasource datasource;

  ReadStorageTokenRepositoryImpl(this.datasource);
  @override
  Future<Either<FailureError, String>> readStorageToken(
      {required String key}) async {
    try {
      final result = await datasource.readStorageToken(key: key);
      return Right(result ?? '');
    } catch (e) {
      return Left(DataSourceError());
    }
  }
}
