import 'package:dartz/dartz.dart';

import '../../entities/entities.dart';
import '../../errors/errors.dart';

abstract class ListScheduleFilterRepository {
  Future<Either<FailureError, List<ScheduleEntity>>> getListScheduleByFilter(
      String token, ScheduleFilterEntity scheduleFilterEntity);
}
