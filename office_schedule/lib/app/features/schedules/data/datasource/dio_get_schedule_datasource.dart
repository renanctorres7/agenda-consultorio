import 'package:dio/dio.dart';

import '../../infra/datasources/datasource.dart';
import '../../infra/models/models.dart';
import '../service/service.dart';

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
    } on DioException catch (e) {
      throw DioException(
          requestOptions: e.requestOptions, response: e.response);
    }
  }
}
