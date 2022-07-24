import 'package:dartz/dartz.dart';

import '../../entities/entities.dart';
import '../../errors/errors.dart';

abstract class GetScheduleRepository {
  Future<Either<FailureError, ScheduleEntity>> getSchedule(
      {required String objectId});
}
