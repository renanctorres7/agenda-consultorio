import 'package:dartz/dartz.dart';

import '../../entities/entities.dart';
import '../../errors/errors.dart';
import '../../success/success.dart';

abstract class CreateScheduleRepository {
  Future<Either<FailureError, Success>> createSchedule(
      ScheduleCreateEntity scheduleCreateEntity);
}
