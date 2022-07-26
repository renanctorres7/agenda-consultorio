import 'package:dartz/dartz.dart';
import 'package:office_schedule/app/features/domain/repositories/authentication/validate_token_repository.dart';

import '../../errors/errors.dart';
import '../../success/success.dart';

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
