import 'package:dartz/dartz.dart';

import '../../../../core/errors/errors.dart';
import '../../../../core/success/success.dart';
import '../entities/entities.dart';
import '../repository/repository.dart';

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
