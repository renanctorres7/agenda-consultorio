import 'package:dartz/dartz.dart';
import 'package:office_schedule/app/core/errors/failure_error.dart';
import 'package:office_schedule/app/core/success/successful_response.dart';

import 'package:office_schedule/app/features/auth/domain/entities/entities.dart';
import 'package:office_schedule/app/features/auth/domain/repository/change_password_repository.dart';

abstract class ChangePasswordUsecase {
  Future<Either<FailureError, Success>> call(
      String token, NewPasswordEntity newPassword);
}

class ChangePasswordUsecaseImpl implements ChangePasswordUsecase {
  final ChangePasswordRepository repository;

  ChangePasswordUsecaseImpl(this.repository);
  @override
  Future<Either<FailureError, Success>> call(
      String token, NewPasswordEntity newPassword) async {
    final result = await repository.changePasswordEmail(token, newPassword);
    return result;
  }
}
