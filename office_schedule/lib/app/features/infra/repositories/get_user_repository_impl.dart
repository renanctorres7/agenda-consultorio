import 'package:office_schedule/app/features/domain/errors/failure_error.dart';
import 'package:office_schedule/app/features/domain/entities/users_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:office_schedule/app/features/domain/repositories/respositories.dart';

class GetUserRepositoryImpl extends GetUserRepository {
  @override
  Future<Either<FailureError, UsersEntity>> getUserProfile(String objectId) {
    // TODO: implement getUserProfile
    throw UnimplementedError();
  }
}
