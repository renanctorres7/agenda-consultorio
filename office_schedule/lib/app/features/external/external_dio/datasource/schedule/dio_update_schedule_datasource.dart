import 'package:dio/dio.dart';

import '../../../../domain/entities/entities.dart';
import '../../../../domain/success/success.dart';
import '../../../../infra/datasources/schedules/schedules.dart';
import '../../../../infra/models/models.dart';
import '../../external_dio.dart';

class DioUpdateScheduleDatasource implements UpdateScheduleDatasource {
  final UpdateScheduleService updateScheduleService;
  final String sessionToken;

  DioUpdateScheduleDatasource(
      {required this.updateScheduleService, required this.sessionToken});
  @override
  Future<Success> updateSchedule(
      ScheduleUpdateEntity scheduleUpdateEntity) async {
    try {
      final result = await updateScheduleService.updateSchedule(
          sessionToken, ScheduleUpdateModel.fromJson(json));
      return result;
    } on DioError catch (e) {
      throw DioError(requestOptions: e.requestOptions, response: e.response);
    }
  }
}
