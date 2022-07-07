import 'package:dartz/dartz.dart';

import '../../errors/errors.dart';
import '../../success/success.dart';

abstract class DeleteScheduleRepository {
  Future<Either<FailureError, Success>> deleteSchedule(String objectId);
}
