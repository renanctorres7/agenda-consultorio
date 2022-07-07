import 'package:dio/dio.dart';

import '../../../../domain/entities/entities.dart';
import '../../../../infra/datasources/schedules/schedules.dart';
import '../../../../infra/models/models.dart';
import '../../external_dio.dart';

class DioScheduleFilterDatasource implements ListScheduleFilterDatasource {
  final ScheduleFilterService scheduleFilterService;
  final String sessionToken;

  DioScheduleFilterDatasource(this.scheduleFilterService, this.sessionToken);
  @override
  Future<List<ScheduleModel>?> getListScheduleByFilter(
      ScheduleFilterEntity scheduleFilterEntity) async {
    try {
      final result = await scheduleFilterService.getListScheduleByFilter(
          sessionToken, ScheduleFilterModel.fromEntity(scheduleFilterEntity));
      return result;
    } on DioError catch (e) {
      throw DioError(requestOptions: e.requestOptions, response: e.response);
    }
  }
}
