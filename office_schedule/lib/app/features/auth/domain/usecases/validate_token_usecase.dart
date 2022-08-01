import 'package:dartz/dartz.dart';

import 'package:office_schedule/app/core/errors/failure_error.dart';
import 'package:office_schedule/app/core/success/success.dart';
import 'package:office_schedule/app/features/auth/domain/repository/validate_token_repository.dart';

abstract class ValidateTokenUsecase {
  Future<Either<FailureError, Success>> call(String token);
}

class ValidateTokenUsecaseImpl implements ValidateTokenUsecase {
  final ValidateTokenRepository repository;

  ValidateTokenUsecaseImpl(this.repository);
  @override
  Future<Either<FailureError, Success>> call(String token) async {
    final result = await repository.validateToken(token);
    return result;
  }
}
