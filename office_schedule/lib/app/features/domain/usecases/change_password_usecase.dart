import 'package:dartz/dartz.dart';
import 'package:office_schedule/app/features/domain/repositories/change_password_repository.dart';

import '../entities/entities.dart';
import '../errors/errors.dart';
import '../success/success.dart';

abstract class ChangePasswordUsecase {
  Future<Either<FailureError, Success>> call(NewPasswordEntity newPassword);
}

class ChangePasswordUsecaseImpl extends ChangePasswordUsecase {
  final ChangePasswordRepository repository;

  ChangePasswordUsecaseImpl(this.repository);
  @override
  Future<Either<FailureError, Success>> call(
      NewPasswordEntity newPassword) async {
    return repository.changePasswordEmail(newPassword);
  }
}
