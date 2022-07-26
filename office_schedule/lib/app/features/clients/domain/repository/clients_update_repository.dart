import 'package:dartz/dartz.dart';

import '../../entities/entities.dart';
import '../../errors/errors.dart';
import '../../success/success.dart';

abstract class ClientsUpdateRepository {
  Future<Either<FailureError, Success>> updateClient(
      {required String token,
      required ClientsUpdateEntity clientsUpdateEntity});
}
