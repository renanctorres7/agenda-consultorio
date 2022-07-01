import '../../../domain/entities/entities.dart';

abstract class ListScheduleFilterDatasource {
  Future<List<ScheduleEntity>?> getListScheduleByFilter(
      ScheduleFilterEntity scheduleFilterEntity);
}
