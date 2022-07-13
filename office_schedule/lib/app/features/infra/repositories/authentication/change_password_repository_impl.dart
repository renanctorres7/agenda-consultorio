import 'package:dartz/dartz.dart';

import '../../../domain/entities/entities.dart';
import '../../../domain/errors/errors.dart';
import '../../../domain/repositories/respositories.dart';
import '../../../domain/success/success.dart';
import '../../datasources/datasources.dart';

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
