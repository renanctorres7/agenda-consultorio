import 'package:dartz/dartz.dart';

import '../../../../core/errors/errors.dart';
import '../../../../core/success/success.dart';
import '../../domain/repository/repository.dart';
import '../datasources/datasources.dart';

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
