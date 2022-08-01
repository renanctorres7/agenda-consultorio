import 'package:dartz/dartz.dart';

import '../../../../core/errors/errors.dart';

import '../entities/entities.dart';

abstract class GetClientsListRepository {
  Future<Either<FailureError, List<ClientsListEntity>>> getClientsList(
      {required String token});
}
