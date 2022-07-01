import 'package:office_schedule/app/features/infra/models/models.dart';

import '../../../domain/entities/entities.dart';

abstract class ListSchedulePeriodDatasource {
  Future<List<ScheduleModel>?> getScheduleListByPeriod(
      SchedulePeriodEntity schedulePeriodEntity);
}
