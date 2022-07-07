import 'package:dio/dio.dart';
import 'package:office_schedule/app/features/domain/success/successful_response.dart';

import '../../../../infra/datasources/schedules/schedules.dart';
import '../../service/schedule/schedule.dart';

class DioDeleteScheduleDatasource implements DeleteScheduleDatasource {
  final DeleteScheduleService deleteScheduleService;
  final String sessionToken;

  DioDeleteScheduleDatasource(
      {required this.deleteScheduleService, required this.sessionToken});
  @override
  Future<Success> deleteSchedule(String objectId) async {
    Map<String, String> objectIdMap = {'objectId': objectId};
    try {
      await deleteScheduleService.deleteSchedule(sessionToken, objectIdMap);
      return SuccessfulResponse();
    } on DioError catch (e) {
      throw DioError(requestOptions: e.requestOptions, response: e.response);
    }
  }
}
