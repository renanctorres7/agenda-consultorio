import 'package:dio/dio.dart';

import '../../domain/entities/entities.dart';
import '../../infra/datasources/datasource.dart';
import '../../infra/models/models.dart';
import '../service/service.dart';

class DioScheduleFilterDatasource implements ListScheduleFilterDatasource {
  final ScheduleFilterService scheduleFilterService;

  DioScheduleFilterDatasource({required this.scheduleFilterService});
  @override
  Future<List<ScheduleModel>?> getListScheduleByFilter(
      String token, ScheduleFilterEntity scheduleFilterEntity) async {
    try {
      final result = await scheduleFilterService.getListScheduleByFilter(
          token, ScheduleFilterModel.fromEntity(scheduleFilterEntity));
      return result ?? <ScheduleModel>[];
    } on DioError catch (e) {
      throw DioError(requestOptions: e.requestOptions, response: e.response);
    }
  }
}
