import 'package:dartz/dartz.dart';
import 'package:office_schedule/app/features/domain/repositories/clients/get_client_repository.dart';

import '../../entities/entities.dart';
import '../../errors/errors.dart';

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
