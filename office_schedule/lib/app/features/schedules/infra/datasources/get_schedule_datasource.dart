
import '../models/models.dart';

abstract class GetScheduleDatasource {
  Future<ScheduleModel?> getSchedule(
      {required String token, required String objectId});
}
