import '../../../domain/entities/entities.dart';
import '../../../domain/success/success.dart';

abstract class CreateScheduleDatasource {
  Future<Success> createSchedule(ScheduleCreateEntity scheduleCreateEntity);
}
