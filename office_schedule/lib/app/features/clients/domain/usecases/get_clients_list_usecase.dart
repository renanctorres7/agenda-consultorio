import 'package:dartz/dartz.dart';

import '../../../../core/errors/errors.dart';
import '../entities/entities.dart';
import '../repository/repository.dart';

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
