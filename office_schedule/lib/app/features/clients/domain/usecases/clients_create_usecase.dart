import 'package:dartz/dartz.dart';

import '../../../../core/errors/errors.dart';
import '../../../../core/success/success.dart';
import '../entities/entities.dart';
import '../repository/repository.dart';

abstract class ClientsCreateUsecase {
  Future<Either<FailureError, Success>> call(
      {required String token,
      required ClientsCreateEntity clientsCreateEntity});
}

class ClientsCreateUsecaseImpl implements ClientsCreateUsecase {
  final ClientsCreateRepository repository;

  ClientsCreateUsecaseImpl(this.repository);
  @override
  Future<Either<FailureError, Success>> call(
      {required String token,
      required ClientsCreateEntity clientsCreateEntity}) async {
    final result = await repository.createClient(
        token: token, clientsCreateEntity: clientsCreateEntity);
    return result;
  }
}
