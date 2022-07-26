import 'package:dartz/dartz.dart';

import '../../entities/entities.dart';
import '../../errors/errors.dart';

abstract class GetClientRepository {
  Future<Either<FailureError, ClientsEntity>> getClient(
      {required String token, required String objectId});
}
