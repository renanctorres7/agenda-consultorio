import 'package:dartz/dartz.dart';

import '../../../domain/entities/entities.dart';
import '../../../domain/errors/errors.dart';
import '../../../domain/repositories/respositories.dart';
import '../../datasources/datasources.dart';

class UpdateProfileRepositoryImpl implements UpdateProfileRepository {
  final UpdateProfileDatasource datasource;

  UpdateProfileRepositoryImpl(this.datasource);
  @override
  Future<Either<FailureError, UserEntity>> updateProfile(
      String token, UserUpdateEntity userUpdateEntity) async {
    try {
      final result = await datasource.updateProfile(token, userUpdateEntity);
      return result != null ? Right(result) : Left(NullError());
    } catch (e) {
      return Left(DataSourceError());
    }
  }
}
