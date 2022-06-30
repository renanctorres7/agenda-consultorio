import 'package:dartz/dartz.dart';
import 'package:office_schedule/app/features/domain/repositories/reset_password_repository.dart';
import 'package:office_schedule/app/features/domain/success/successful_response.dart';

import '../../errors/errors.dart';

abstract class ResetPasswordUsecase {
  Future<Either<FailureError, Success>> call(String email);
}

class ResetPasswordUsecaseImpl extends ResetPasswordUsecase {
  final ResetPasswordRepository repository;

  ResetPasswordUsecaseImpl(this.repository);
  @override
  Future<Either<FailureError, Success>> call(String email) async {
    final result = await repository.resetPassword(email);
    return result;
  }
}
