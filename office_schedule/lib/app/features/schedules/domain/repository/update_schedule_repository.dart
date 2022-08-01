import 'package:dartz/dartz.dart';

import '../../../../core/errors/errors.dart';
import '../../../../core/success/success.dart';
import '../entities/entities.dart';

abstract class UpdateScheduleRepository {
  Future<Either<FailureError, Success>> updateSchedule(
      String token, ScheduleUpdateEntity scheduleUpdateEntity);
}
