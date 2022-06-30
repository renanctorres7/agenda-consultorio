import '../../../domain/success/success.dart';
import '../../models/models.dart';

abstract class CreateScheduleDatasource {
  Future<Success> createSchedule(ScheduleCreateModel scheduleCreateModel);
}
