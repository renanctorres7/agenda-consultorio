import 'package:dartz/dartz.dart';

import '../../entities/entities.dart';
import '../../errors/errors.dart';

abstract class SearchScheduleDateRepository {
  Future<Either<FailureError, List<ScheduleEntity>>> searchScheduleFromDate(
      ScheduleDateEntity scheduleDateEntity);
}
