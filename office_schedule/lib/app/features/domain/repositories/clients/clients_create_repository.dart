import 'package:dartz/dartz.dart';

import '../../entities/entities.dart';
import '../../errors/errors.dart';
import '../../success/success.dart';

abstract class ClientsCreateRepository {
  Future<Either<FailureError, Success>> createClient(
      String token, ClientsCreateEntity clientsCreateEntity);
}
