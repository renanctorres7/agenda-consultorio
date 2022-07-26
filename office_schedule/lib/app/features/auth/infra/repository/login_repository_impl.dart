import 'package:dartz/dartz.dart';

import 'package:office_schedule/app/core/errors/failure_error.dart';
import 'package:office_schedule/app/features/auth/domain/entities/entities.dart';
import 'package:office_schedule/app/features/auth/domain/repository/login_repository.dart';
import 'package:office_schedule/app/features/auth/infra/datasources/login_datasource.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginDatasource datasource;

  LoginRepositoryImpl(this.datasource);
  @override
  Future<Either<FailureError, SignUpEntity>> login(
      LoginEntity loginEntity) async {
    try {
      final result = await datasource.login(loginEntity);
      return result != null ? Right(result) : Left(NullError());
    } catch (e) {
      return Left(DataSourceError());
    }
  }
}
