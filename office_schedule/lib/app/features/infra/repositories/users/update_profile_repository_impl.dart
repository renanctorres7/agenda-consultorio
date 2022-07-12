import 'package:dartz/dartz.dart';
import 'package:office_schedule/app/features/infra/models/models.dart';

import '../../../domain/entities/entities.dart';
import '../../../domain/errors/errors.dart';
import '../../../domain/repositories/respositories.dart';
import '../../datasources/datasources.dart';

class UpdateProfileRepositoryImpl implements UpdateProfileRepository {
  final UpdateProfileDatasource datasource;

  UpdateProfileRepositoryImpl(this.datasource);
  @override
  Future<Either<FailureError, UsersEntity>> updateProfile(
      UserUpdateEntity userUpdateEntity) async {
    try {
      final result = await datasource
          .updateProfile(UserUpdateModel.fromEntity(userUpdateEntity));
      return result != null ? Right(result) : Left(NullError());
    } catch (e) {
      return Left(DataSourceError());
    }
  }
}
