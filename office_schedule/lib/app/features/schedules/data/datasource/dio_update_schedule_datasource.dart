import 'package:dio/dio.dart';

import '../../../../core/success/success.dart';
import '../../domain/entities/entities.dart';
import '../../infra/datasources/datasource.dart';
import '../../infra/models/models.dart';
import '../service/service.dart';

class DioUpdateScheduleDatasource implements UpdateScheduleDatasource {
  final UpdateScheduleService updateScheduleService;

  DioUpdateScheduleDatasource({required this.updateScheduleService});
  @override
  Future<Success> updateSchedule(
      String token, ScheduleUpdateEntity scheduleUpdateEntity) async {
    try {
      await updateScheduleService.updateSchedule(
          token, ScheduleUpdateModel.fromEntity(scheduleUpdateEntity));
      return SuccessfulResponse();
    } on DioException catch (e) {
      throw DioException(
          requestOptions: e.requestOptions, response: e.response);
    }
  }
}
