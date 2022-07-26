import 'package:dartz/dartz.dart';
import 'package:office_schedule/app/features/domain/repositories/clients/delete_client_repository.dart';

import '../../errors/errors.dart';
import '../../success/success.dart';

abstract class DeleteClientUsecase {
  Future<Either<FailureError, Success>> call(
      {required String token, required String objectId});
}

class DeleteClientUsecaseImpl implements DeleteClientUsecase {
  final DeleteClientRepository repository;

  DeleteClientUsecaseImpl(this.repository);
  @override
  Future<Either<FailureError, Success>> call(
      {required String token, required String objectId}) async {
    final result =
        await repository.deleteClient(token: token, objectId: objectId);
    return result;
  }
}
