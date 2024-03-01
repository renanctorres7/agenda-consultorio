import 'package:dio/dio.dart';

import '../../domain/entities/entities.dart';
import '../../infra/datasources/datasource.dart';
import '../../infra/models/models.dart';
import '../service/service.dart';

class DioSchedulePeriodDatasource implements ListSchedulePeriodDatasource {
  final SchedulePeriodService schedulePeriodService;

  DioSchedulePeriodDatasource({required this.schedulePeriodService});

  @override
  Future<List<ScheduleModel>?> getScheduleListByPeriod(
      String token, SchedulePeriodEntity schedulePeriodEntity) async {
    try {
      final result = await schedulePeriodService.getScheduleListByPeriod(
          token, SchedulePeriodModel.fromEntity(schedulePeriodEntity));
      return result ?? <ScheduleModel>[];
    } on DioException catch (e) {
      throw DioException(
          requestOptions: e.requestOptions, response: e.response);
    }
  }
}
