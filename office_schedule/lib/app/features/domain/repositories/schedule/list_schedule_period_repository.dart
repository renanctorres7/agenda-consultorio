import 'package:dartz/dartz.dart';

import '../../entities/entities.dart';
import '../../errors/errors.dart';

abstract class ListSchedulePeriodRepository {
  Future<Either<FailureError, List<ScheduleEntity>>> getScheduleListByPeriod(
      SchedulePeriodEntity schedulePeriodEntity);
}
