import 'package:dartz/dartz.dart';

import '../../../../core/errors/errors.dart';
import '../../../../core/success/success.dart';
import '../entities/entities.dart';

abstract class SearchScheduleDateRepository {
  Future<Either<FailureError, List<ScheduleEntity>>> searchScheduleFromDate(
      String token, ScheduleDateEntity scheduleDateEntity);
}
