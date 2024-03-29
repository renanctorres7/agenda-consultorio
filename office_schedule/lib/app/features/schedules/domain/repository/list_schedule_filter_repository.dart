import 'package:dartz/dartz.dart';

import '../../../../core/errors/errors.dart';
import '../entities/entities.dart';

abstract class ListScheduleFilterRepository {
  Future<Either<FailureError, List<ScheduleEntity>>> getListScheduleByFilter(
      String token, ScheduleFilterEntity scheduleFilterEntity);
}
