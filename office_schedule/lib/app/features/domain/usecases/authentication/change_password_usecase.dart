import 'package:dartz/dartz.dart';

import '../../entities/entities.dart';
import '../../errors/errors.dart';
import '../../repositories/respositories.dart';
import '../../success/success.dart';

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
