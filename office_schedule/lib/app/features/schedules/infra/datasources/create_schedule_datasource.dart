

import '../../../../core/success/success.dart';
import '../../domain/entities/entities.dart';

abstract class CreateScheduleDatasource {
  Future<Success> createSchedule(
      String token, ScheduleCreateEntity scheduleCreateEntity);
}
