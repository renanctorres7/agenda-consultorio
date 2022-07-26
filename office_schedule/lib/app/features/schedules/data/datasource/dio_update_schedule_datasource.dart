import 'package:dio/dio.dart';

import '../../../../../infra/datasources/datasources.dart';
import '../../../../../domain/entities/entities.dart';
import '../../../../../domain/success/success.dart';

import '../../../../../infra/models/models.dart';
import '../../service/service.dart';

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
    } on DioError catch (e) {
      throw DioError(requestOptions: e.requestOptions, response: e.response);
    }
  }
}
