import 'package:dartz/dartz.dart';
import 'package:office_schedule/app/features/domain/entities/clients/clients.dart';
import 'package:office_schedule/app/features/domain/repositories/clients/get_clients_list_repository.dart';

import '../../errors/errors.dart';

abstract class GetClientsListUsecase {
  Future<Either<FailureError, List<ClientsListEntity>>> call(
      {required String token});
}

class GetClientsListUsecaseImpl implements GetClientsListUsecase {
  final GetClientsListRepository repository;

  GetClientsListUsecaseImpl(this.repository);
  @override
  Future<Either<FailureError, List<ClientsListEntity>>> call(
      {required String token}) async {
    final result = await repository.getClientsList(token: token);
    return result;
  }
}
