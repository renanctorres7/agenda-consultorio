import 'package:dartz/dartz.dart';

import '../../../../core/errors/errors.dart';
import '../../../../core/success/success.dart';
import '../entities/entities.dart';

abstract class ListSchedulePeriodRepository {
  Future<Either<FailureError, List<ScheduleEntity>>> getScheduleListByPeriod(
      String token, SchedulePeriodEntity schedulePeriodEntity);
}
