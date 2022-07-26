import 'package:dartz/dartz.dart';

import '../../../../core/errors/errors.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repository/repository.dart';
import '../datasources/datasources.dart';
import '../models/user_model.dart';

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
