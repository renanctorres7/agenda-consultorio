import 'package:dartz/dartz.dart';
import 'package:office_schedule/app/features/domain/repositories/respositories.dart';

import '../../domain/entities/entities.dart';
import '../../domain/errors/errors.dart';
import '../datasources/datasources.dart';

class UpdateProfileRepositoryImpl implements UpdateProfileRepository {
  final UpdateProfileDatasource datasource;

  UpdateProfileRepositoryImpl(this.datasource);
  @override
  Future<Either<FailureError, SignUpEntity>> updateProfile(
      SignUpEntity params) async {
    try {
      final result = await datasource.updateProfile(params);
      return result != null ? Right(result) : Left(NullError());
    } catch (e) {
      return Left(DataSourceError());
    }
  }
}