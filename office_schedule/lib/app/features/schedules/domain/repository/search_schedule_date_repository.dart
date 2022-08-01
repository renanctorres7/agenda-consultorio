import 'package:dartz/dartz.dart';

import '../../../../core/errors/errors.dart';
import '../entities/entities.dart';

abstract class SearchScheduleDateRepository {
  Future<Either<FailureError, List<ScheduleEntity>>> searchScheduleFromDate(
      String token, ScheduleDateEntity scheduleDateEntity);
}
