import 'package:dartz/dartz.dart';

import '../../../../core/errors/errors.dart';
import '../entities/entities.dart';
import '../repository/repository.dart';

abstract class GetClientUsecase {
  Future<Either<FailureError, ClientsEntity>> call(
      {required String token, required String objectId});
}

class GetClientUsecaseImpl implements GetClientUsecase {
  final GetClientRepository repository;

  GetClientUsecaseImpl(this.repository);
  @override
  Future<Either<FailureError, ClientsEntity>> call(
      {required String token, required String objectId}) async {
    final result = await repository.getClient(token: token, objectId: objectId);
    return result;
  }
}
