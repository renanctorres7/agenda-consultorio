import '../../../../core/success/success.dart';
import '../../domain/entities/entities.dart';
import '../models/models.dart';

abstract class UpdateScheduleDatasource {
  Future<Success> updateSchedule(
      String token, ScheduleUpdateEntity scheduleUpdateEntity);
}
