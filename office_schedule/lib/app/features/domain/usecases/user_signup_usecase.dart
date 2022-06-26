import 'package:dartz/dartz.dart';
import 'package:office_schedule/app/features/domain/entities/user_signup_entity.dart';

abstract class UserSignUpUsecase {
  Future<Either<FailureError, UserSignUpEntity>> call();
}
