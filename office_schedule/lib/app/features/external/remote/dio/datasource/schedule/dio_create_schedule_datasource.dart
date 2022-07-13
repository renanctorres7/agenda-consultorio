import 'package:dio/dio.dart';

import '../../../../../infra/datasources/datasources.dart';
import '../../../../../domain/entities/entities.dart';
import '../../../../../domain/success/success.dart';

import '../../../../../infra/models/models.dart';
import '../../service/service.dart';

class DioCreateScheduleDatasource implements CreateScheduleDatasource {
  final CreateScheduleService createScheduleService;

  DioCreateScheduleDatasource({required this.createScheduleService});
  @override
  Future<Success> createSchedule(
      String token, ScheduleCreateEntity scheduleCreateEntity) async {
    try {
      await createScheduleService.createSchedule(
          token, ScheduleCreateModel.fromEntity(scheduleCreateEntity));
      return SuccessfulResponse();
    } on DioError catch (e) {
      throw DioError(requestOptions: e.requestOptions, response: e.response);
    }
  }
}
