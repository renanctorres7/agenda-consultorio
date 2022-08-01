import 'package:dartz/dartz.dart';

import '../../../../core/errors/errors.dart';
import '../../../../core/success/success.dart';
import '../repository/repository.dart';

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
