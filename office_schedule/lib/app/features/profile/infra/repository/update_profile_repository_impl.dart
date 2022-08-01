import 'package:dartz/dartz.dart';

import '../../../../core/errors/errors.dart';
import '../../../users/domain/entities/user_entity.dart';
import '../../domain/entities/user_update_entity.dart';
import '../../domain/repository/update_profile_repository.dart';
import '../datasources/update_profile_datasource.dart';

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
