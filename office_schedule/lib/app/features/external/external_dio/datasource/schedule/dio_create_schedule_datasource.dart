import 'package:dio/dio.dart';
import 'package:office_schedule/app/features/domain/success/successful_response.dart';
import 'package:office_schedule/app/features/domain/entities/schedules/schedule_create_entity.dart';
import 'package:office_schedule/app/features/external/external_dio/service/schedule/create_schedule_service.dart';
import 'package:office_schedule/app/features/infra/datasources/schedules/create_schedule_datasource.dart';
import 'package:office_schedule/app/features/infra/models/models.dart';

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
