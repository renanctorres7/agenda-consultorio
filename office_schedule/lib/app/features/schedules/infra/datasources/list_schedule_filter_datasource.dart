import '../../../../core/success/success.dart';
import '../../domain/entities/entities.dart';
import '../models/models.dart';

abstract class ListScheduleFilterDatasource {
  Future<List<ScheduleModel>?> getListScheduleByFilter(
      String token, ScheduleFilterEntity scheduleFilterEntity);
}
