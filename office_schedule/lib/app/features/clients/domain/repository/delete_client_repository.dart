import 'package:dartz/dartz.dart';

import '../../errors/errors.dart';
import '../../success/success.dart';

abstract class DeleteClientRepository {
  Future<Either<FailureError, Success>> deleteClient(
      {required String token, required String objectId});
}
