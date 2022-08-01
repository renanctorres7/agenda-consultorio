import 'package:dartz/dartz.dart';

import '../../../../core/errors/errors.dart';
import '../../../../core/success/success.dart';

import '../entities/entities.dart';

abstract class ClientsUpdateRepository {
  Future<Either<FailureError, Success>> updateClient(
      {required String token,
      required ClientsUpdateEntity clientsUpdateEntity});
}
