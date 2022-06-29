import 'package:office_schedule/app/features/domain/errors/failure_error.dart';
import 'package:dartz/dartz.dart';
import 'package:office_schedule/app/features/domain/repositories/reset_password_repository.dart';
import 'package:office_schedule/app/features/domain/success/successful_response.dart';

class ResetPasswordRepositoryImpl extends ResetPasswordRepository {
  @override
  Future<Either<FailureError, Success>> resetPassword(String email) {
    // TODO: implement resetPassword
    throw UnimplementedError();
  }
}
