import 'package:dartz/dartz.dart';
import 'package:office_schedule/app/features/domain/success/successful_response.dart';

import '../errors/errors.dart';

abstract class ResetPasswordUsecase {
  Future<Either<FailureError, Success>> call(String email);
}

class ResetPasswordUsecaseImpl extends ResetPasswordUsecase {
  @override
  Future<Either<FailureError, Success>> call(String email) {
    // TODO: implement call
    throw UnimplementedError();
  }
}
