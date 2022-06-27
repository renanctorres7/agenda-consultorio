import 'package:office_schedule/app/features/domain/errors/failure_error.dart';
import 'package:office_schedule/app/features/domain/entities/sign_up_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:office_schedule/app/features/domain/repositories/respositories.dart';

class SignUpRepositoryImpl implements SignUpRepository {
  @override
  Future<Either<FailureError, SignUpEntity>> signUp(SignUpEntity params) {
    throw UnimplementedError();
  }
}
