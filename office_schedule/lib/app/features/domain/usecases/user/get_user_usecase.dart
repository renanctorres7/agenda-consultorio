import 'package:dartz/dartz.dart';

import '../../entities/entities.dart';
import '../../errors/errors.dart';
import '../../repositories/respositories.dart';

abstract class GetUserUsecase {
  Future<Either<FailureError, UserEntity>> call(String objectId);
}

class GetUserUsecaseImpl implements GetUserUsecase {
  final GetUserRepository repository;

  GetUserUsecaseImpl(this.repository);
  @override
  Future<Either<FailureError, UserEntity>> call(String objectId) async {
    final result = await repository.getUserProfile(objectId);
    return result;
  }
}
