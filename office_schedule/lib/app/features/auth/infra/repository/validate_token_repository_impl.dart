import 'package:dartz/dartz.dart';
import 'package:office_schedule/app/core/errors/failure_error.dart';
import 'package:office_schedule/app/core/success/success.dart';
import 'package:office_schedule/app/features/auth/domain/repository/validate_token_repository.dart';
import 'package:office_schedule/app/features/auth/infra/datasources/validate_token_datasource.dart';

class ValidateTokenRepositoryImpl implements ValidateTokenRepository {
  final ValidateTokenDatasource datasource;

  ValidateTokenRepositoryImpl(this.datasource);
  @override
  Future<Either<FailureError, Success>> validateToken(String token) async {
    try {
      final result = await datasource.validateToken(token);
      return Right(result);
    } catch (e) {
      return Left(DataSourceError());
    }
  }
}
