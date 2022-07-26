import 'package:dartz/dartz.dart';

import '../../entities/entities.dart';
import '../../errors/errors.dart';
import '../../repositories/clients/clients.dart';
import '../../success/success.dart';

abstract class ClientsUpdateUsecase {
  Future<Either<FailureError, Success>> call(
      {required String token,
      required ClientsUpdateEntity clientsUpdateEntity});
}

class ClientsUpdateUsecaseImpl implements ClientsUpdateUsecase {
  final ClientsUpdateRepository repository;

  ClientsUpdateUsecaseImpl(this.repository);
  @override
  Future<Either<FailureError, Success>> call(
      {required String token,
      required ClientsUpdateEntity clientsUpdateEntity}) async {
    final result = await repository.updateClient(
        token: token, clientsUpdateEntity: clientsUpdateEntity);
    return result;
  }
}
