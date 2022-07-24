import 'package:dartz/dartz.dart';
import 'package:office_schedule/app/features/domain/entities/entities.dart';
import 'package:office_schedule/app/features/domain/repositories/clients/clients.dart';

import '../../errors/errors.dart';
import '../../success/success.dart';

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