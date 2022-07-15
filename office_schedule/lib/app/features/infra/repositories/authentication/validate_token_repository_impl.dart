import 'package:office_schedule/app/features/domain/success/successful_response.dart';

import 'package:office_schedule/app/features/domain/errors/failure_error.dart';

import 'package:dartz/dartz.dart';
import 'package:office_schedule/app/features/infra/datasources/authentication/validate_token_datasource.dart';

import '../../../domain/repositories/respositories.dart';

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
