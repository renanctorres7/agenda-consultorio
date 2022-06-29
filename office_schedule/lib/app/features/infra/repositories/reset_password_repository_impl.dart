import 'package:office_schedule/app/features/domain/errors/failure_error.dart';
import 'package:dartz/dartz.dart';
import 'package:office_schedule/app/features/domain/repositories/reset_password_repository.dart';
import 'package:office_schedule/app/features/domain/success/successful_response.dart';

import '../datasources/datasources.dart';

class ResetPasswordRepositoryImpl extends ResetPasswordRepository {
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
