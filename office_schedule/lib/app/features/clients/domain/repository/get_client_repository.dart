import 'package:dartz/dartz.dart';

import '../../../../core/errors/errors.dart';

import '../entities/entities.dart';

abstract class GetClientRepository {
  Future<Either<FailureError, ClientsEntity>> getClient(
      {required String token, required String objectId});
}
