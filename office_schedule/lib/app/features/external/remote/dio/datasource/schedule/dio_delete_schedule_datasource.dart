import 'package:dio/dio.dart';

import '../../../../../infra/datasources/datasources.dart';
import '../../../../../domain/success/success.dart';

import '../../service/service.dart';

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
