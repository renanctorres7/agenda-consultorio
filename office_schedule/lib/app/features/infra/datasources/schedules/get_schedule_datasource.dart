import 'package:office_schedule/app/features/infra/models/models.dart';

abstract class GetScheduleDatasource {
  Future<ScheduleModel?> getSchedule(
      {required String token, required String objectId});
}
