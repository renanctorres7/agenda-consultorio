import 'package:dartz/dartz.dart';

import '../../../../core/errors/errors.dart';
import '../../../../core/success/success.dart';
import '../entities/entities.dart';


abstract class CreateScheduleRepository {
  Future<Either<FailureError, Success>> createSchedule(
      String token, ScheduleCreateEntity scheduleCreateEntity);
}
