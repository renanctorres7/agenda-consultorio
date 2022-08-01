import 'package:dartz/dartz.dart';

import 'package:office_schedule/app/core/errors/failure_error.dart';
import 'package:office_schedule/app/core/success/success.dart';
import 'package:office_schedule/app/features/auth/domain/entities/entities.dart';
import 'package:office_schedule/app/features/auth/domain/repository/change_password_repository.dart';
import 'package:office_schedule/app/features/auth/infra/datasources/change_password_datasource.dart';

class ChangePasswordRepositoryImpl implements ChangePasswordRepository {
  final ChangePasswordDatasource datasource;

  ChangePasswordRepositoryImpl(this.datasource);
  @override
  Future<Either<FailureError, Success>> changePasswordEmail(
      String token, NewPasswordEntity newPassword) async {
    try {
      final result = await datasource.changePasswordEmail(token, newPassword);
      return Right(result);
    } catch (e) {
      return Left(DataSourceError());
    }
  }
}
