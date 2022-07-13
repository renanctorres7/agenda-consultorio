import 'package:dio/dio.dart';

import '../../../../../infra/datasources/datasources.dart';
import '../../../../../domain/entities/entities.dart';

import '../../../../../infra/models/models.dart';
import '../../service/service.dart';

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
