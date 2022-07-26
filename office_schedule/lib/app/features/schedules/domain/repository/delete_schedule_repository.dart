import 'package:dartz/dartz.dart';

import '../../../../core/errors/errors.dart';
import '../../../../core/success/success.dart';
import '../entities/entities.dart';

abstract class DeleteScheduleRepository {
  Future<Either<FailureError, Success>> deleteSchedule(
      String token, String objectId);
}
