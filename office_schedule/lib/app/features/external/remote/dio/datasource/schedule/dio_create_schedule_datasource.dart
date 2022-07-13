import 'package:dio/dio.dart';

import '../../../../../infra/datasources/datasources.dart';
import '../../../../../domain/entities/entities.dart';
import '../../../../../domain/success/success.dart';

import '../../../../../infra/models/models.dart';
import '../../service/service.dart';

class DioCreateScheduleDatasource implements CreateScheduleDatasource {
  final CreateScheduleService createScheduleService;
  final String sessionToken;

  DioCreateScheduleDatasource(
      {required this.createScheduleService, required this.sessionToken});
  @override
  Future<Success> createSchedule(
      ScheduleCreateEntity scheduleCreateEntity) async {
    try {
      await createScheduleService.createSchedule(
          sessionToken, ScheduleCreateModel.fromEntity(scheduleCreateEntity));
      return SuccessfulResponse();
    } on DioError catch (e) {
      throw DioError(requestOptions: e.requestOptions, response: e.response);
    }
  }
}
