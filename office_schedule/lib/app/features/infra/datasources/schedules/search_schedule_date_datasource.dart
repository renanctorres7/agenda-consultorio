import '../../../domain/entities/entities.dart';
import '../../models/models.dart';

abstract class SearchScheduleDateDatasource {
  Future<List<ScheduleModel>?> searchScheduleFromDate(
      ScheduleDateEntity scheduleDateEntity);
}
