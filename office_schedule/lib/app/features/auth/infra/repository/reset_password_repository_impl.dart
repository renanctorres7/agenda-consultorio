import 'package:dartz/dartz.dart';

import 'package:office_schedule/app/core/errors/failure_error.dart';
import 'package:office_schedule/app/features/auth/domain/repository/reset_password_repository.dart';
import 'package:office_schedule/app/features/auth/infra/datasources/reset_password_datasource.dart';
import 'package:office_schedule/app/core/success/successful_response.dart';



class ResetPasswordRepositoryImpl implements ResetPasswordRepository {
  final ResetPasswordDatasource datasource;

  ResetPasswordRepositoryImpl(this.datasource);
  @override
  Future<Either<FailureError, Success>> resetPassword(String email) async {
    try {
      final result = await datasource.resetPassword(email);
      return Right(result);
    } catch (e) {
      return Left(DataSourceError());
    }
  }
}
