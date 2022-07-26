import 'package:dartz/dartz.dart';

import '../../../../core/errors/errors.dart';
import '../../../../core/success/success.dart';
import '../entities/entities.dart';

abstract class GetScheduleRepository {
  Future<Either<FailureError, ScheduleEntity>> getSchedule(
      {required String token, required String objectId});
}
