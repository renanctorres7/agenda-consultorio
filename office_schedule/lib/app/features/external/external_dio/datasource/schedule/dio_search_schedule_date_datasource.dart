import 'package:dio/dio.dart';
import 'package:office_schedule/app/features/external/external_dio/service/schedule/schedule.dart';

import '../../../../domain/entities/entities.dart';
import '../../../../infra/datasources/schedules/schedules.dart';
import '../../../../infra/models/models.dart';

class DioSearchScheduleDateDatasource implements SearchScheduleDateDatasource {
  final SearchScheduleDateService searchScheduleDateService;
  final String sessionToken;

  DioSearchScheduleDateDatasource(
      {required this.searchScheduleDateService, required this.sessionToken});
  @override
  Future<List<ScheduleModel>?> searchScheduleFromDate(
      ScheduleDateEntity scheduleDateEntity) async {
    try {
      final result = await searchScheduleDateService.searchScheduleFromDate(
          sessionToken, ScheduleDateModel.fromJson(json));
      return result;
    } on DioError catch (e) {
      throw DioError(requestOptions: e.requestOptions, response: e.response);
    }
  }
}