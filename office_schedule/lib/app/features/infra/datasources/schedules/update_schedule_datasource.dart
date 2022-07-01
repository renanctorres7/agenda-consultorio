import '../../../domain/entities/entities.dart';
import '../../../domain/success/success.dart';

abstract class UpdateScheduleDatasource {
  Future<Success> updateSchedule(ScheduleUpdateEntity scheduleUpdateEntity);
}
