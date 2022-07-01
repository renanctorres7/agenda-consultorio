import '../../../domain/entities/entities.dart';
import '../../models/models.dart';

abstract class ListSchedulePeriodDatasource {
  Future<List<ScheduleModel>?> getScheduleListByPeriod(
      SchedulePeriodEntity schedulePeriodEntity);
}
