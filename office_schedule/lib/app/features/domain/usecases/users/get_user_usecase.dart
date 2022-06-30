import 'package:dartz/dartz.dart';
import 'package:office_schedule/app/features/domain/entities/entities.dart';

import '../../errors/errors.dart';
import '../../repositories/respositories.dart';

abstract class GetUserUsecase {
  Future<Either<FailureError, UsersEntity>> call(String objectId);
}

class GetUserUsecaseImpl extends GetUserUsecase {
  final GetUserRepository repository;

  GetUserUsecaseImpl(this.repository);
  @override
  Future<Either<FailureError, UsersEntity>> call(String objectId) async {
    final result = await repository.getUserProfile(objectId);
    return result;
  }
}
