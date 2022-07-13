import 'package:dartz/dartz.dart';

import '../../entities/entities.dart';
import '../../errors/errors.dart';
import '../../success/success.dart';

abstract class UpdateScheduleRepository {
  Future<Either<FailureError, Success>> updateSchedule(
      String token, ScheduleUpdateEntity scheduleUpdateEntity);
}
