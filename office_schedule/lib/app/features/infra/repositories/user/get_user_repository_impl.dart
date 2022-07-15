import 'package:dartz/dartz.dart';

import '../../../domain/entities/entities.dart';
import '../../../domain/errors/errors.dart';
import '../../../domain/repositories/respositories.dart';
import '../../datasources/datasources.dart';

class GetUserRepositoryImpl implements GetUserRepository {
  final GetUserDatasource datasource;

  GetUserRepositoryImpl(this.datasource);
  @override
  Future<Either<FailureError, UserEntity>> getUserProfile(
      String token, String objectId) async {
    try {
      final result = await datasource.getUserProfile(token, objectId);
      return result != null ? Right(result) : Left(NullError());
    } catch (e) {
      return Left(DataSourceError());
    }
  }
}
