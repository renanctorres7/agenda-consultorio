import 'package:dartz/dartz.dart';

import 'package:office_schedule/app/core/errors/failure_error.dart';
import 'package:office_schedule/app/core/success/successful_response.dart';
import 'package:office_schedule/app/features/auth/domain/repository/reset_password_repository.dart';

abstract class ResetPasswordUsecase {
  Future<Either<FailureError, Success>> call(String email);
}

class ResetPasswordUsecaseImpl implements ResetPasswordUsecase {
  final ResetPasswordRepository repository;

  ResetPasswordUsecaseImpl(this.repository);
  @override
  Future<Either<FailureError, Success>> call(String email) async {
    final result = await repository.resetPassword(email);
    return result;
  }
}
