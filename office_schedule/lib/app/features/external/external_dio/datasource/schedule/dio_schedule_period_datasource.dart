import 'package:dio/dio.dart';

import '../../../../domain/entities/entities.dart';
import '../../../../infra/datasources/schedules/schedules.dart';
import '../../../../infra/models/models.dart';
import '../../external_dio.dart';

class DioSchedulePeriodDatasource implements ListSchedulePeriodDatasource {
  final SchedulePeriodService schedulePeriodService;
  final String sessionToken;

  DioSchedulePeriodDatasource(
      {required this.schedulePeriodService, required this.sessionToken});

  @override
  Future<List<ScheduleModel>?> getScheduleListByPeriod(
      SchedulePeriodEntity schedulePeriodEntity) async {
    try {
      final result = await schedulePeriodService.getScheduleListByPeriod(
          sessionToken, SchedulePeriodModel.fromEntity(schedulePeriodEntity));
      return result;
    } on DioError catch (e) {
      throw DioError(requestOptions: e.requestOptions, response: e.response);
    }
  }
}
