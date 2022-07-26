import 'package:office_schedule/app/features/infra/models/models.dart';

import '../../../domain/entities/entities.dart';

abstract class ListScheduleFilterDatasource {
  Future<List<ScheduleModel>?> getListScheduleByFilter(
      String token, ScheduleFilterEntity scheduleFilterEntity);
}
