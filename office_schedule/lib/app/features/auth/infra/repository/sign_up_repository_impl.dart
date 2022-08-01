import 'package:dartz/dartz.dart';

import 'package:office_schedule/app/core/errors/failure_error.dart';
import 'package:office_schedule/app/features/auth/domain/entities/entities.dart';
import 'package:office_schedule/app/features/auth/domain/repository/sign_up_repository.dart';
import 'package:office_schedule/app/features/auth/infra/datasources/sign_up_datasource.dart';

class SignUpRepositoryImpl implements SignUpRepository {
  final SignUpDatasource datasource;

  SignUpRepositoryImpl(this.datasource);
  @override
  Future<Either<FailureError, SignUpEntity>> signUp(SignUpEntity params) async {
    try {
      final result = await datasource.signUp(params);
      return result != null ? Right(result) : Left(NullError());
    } catch (e) {
      return Left(DataSourceError());
    }
  }
}
