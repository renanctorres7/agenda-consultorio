import 'package:dartz/dartz.dart';

import '../../errors/errors.dart';
import '../../repositories/respositories.dart';
import '../../success/success.dart';

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
