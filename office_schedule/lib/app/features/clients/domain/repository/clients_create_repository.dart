import 'package:dartz/dartz.dart';

import '../../../../core/errors/errors.dart';
import '../../../../core/success/success.dart';

import '../entities/entities.dart';

abstract class ClientsCreateRepository {
  Future<Either<FailureError, Success>> createClient(
      {required String token,
      required ClientsCreateEntity clientsCreateEntity});
}
