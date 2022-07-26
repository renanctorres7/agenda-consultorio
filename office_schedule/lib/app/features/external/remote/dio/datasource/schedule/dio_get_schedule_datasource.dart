import 'package:dio/dio.dart';
import 'package:office_schedule/app/features/external/external.dart';
import 'package:office_schedule/app/features/infra/models/schedules/model/schedule_model.dart';

import '../../../../../infra/datasources/datasources.dart';

class DioGetScheduleDatasource implements GetScheduleDatasource {
  final GetScheduleService getScheduleService;

  DioGetScheduleDatasource({required this.getScheduleService});
  @override
  Future<ScheduleModel?> getSchedule(
      {required String token, required String objectId}) async {
    Map<String, String> mapObjectId = {'objectId': objectId};
    try {
      final result = await getScheduleService.getSchedule(token, mapObjectId);
      return result;
    } on DioError catch (e) {
      throw DioError(requestOptions: e.requestOptions, response: e.response);
    }
  }
}
