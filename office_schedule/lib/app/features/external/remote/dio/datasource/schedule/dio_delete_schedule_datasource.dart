import 'package:dio/dio.dart';

import '../../../../../infra/datasources/datasources.dart';
import '../../../../../domain/success/success.dart';

import '../../service/service.dart';

class DioDeleteScheduleDatasource implements DeleteScheduleDatasource {
  final DeleteScheduleService deleteScheduleService;

  DioDeleteScheduleDatasource({required this.deleteScheduleService});
  @override
  Future<Success> deleteSchedule(String token, String objectId) async {
    Map<String, String> objectIdMap = {'objectId': objectId};
    try {
      await deleteScheduleService.deleteSchedule(token, objectIdMap);
      return SuccessfulResponse();
    } on DioError catch (e) {
      throw DioError(requestOptions: e.requestOptions, response: e.response);
    }
  }
}
