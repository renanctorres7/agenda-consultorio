import 'package:dio/dio.dart';

import '../../../../../infra/datasources/datasources.dart';
import '../../../../../domain/entities/entities.dart';

import '../../../../../infra/models/models.dart';
import '../../service/service.dart';

class DioScheduleFilterDatasource implements ListScheduleFilterDatasource {
  final ScheduleFilterService scheduleFilterService;
  final String sessionToken;

  DioScheduleFilterDatasource(
      {required this.scheduleFilterService, required this.sessionToken});
  @override
  Future<List<ScheduleModel>?> getListScheduleByFilter(
      ScheduleFilterEntity scheduleFilterEntity) async {
    try {
      final result = await scheduleFilterService.getListScheduleByFilter(
          sessionToken, ScheduleFilterModel.fromEntity(scheduleFilterEntity));
      return result ?? <ScheduleModel>[];
    } on DioError catch (e) {
      throw DioError(requestOptions: e.requestOptions, response: e.response);
    }
  }
}
