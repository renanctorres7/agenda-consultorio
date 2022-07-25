import 'package:dartz/dartz.dart';

import '../../entities/entities.dart';
import '../../errors/errors.dart';

abstract class GetClientsListRepository {
  Future<Either<FailureError, ClientsListEntity>> getClientsList(
      {required String token});
}
