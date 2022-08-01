import 'package:dartz/dartz.dart';

import '../../../../core/errors/errors.dart';
import '../../../../core/success/success.dart';

abstract class DeleteClientRepository {
  Future<Either<FailureError, Success>> deleteClient(
      {required String token, required String objectId});
}
