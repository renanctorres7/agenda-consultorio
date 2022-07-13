import 'package:dio/dio.dart';

import '../../../../../infra/datasources/datasources.dart';
import '../../../../../domain/entities/entities.dart';

import '../../../../../infra/models/models.dart';
import '../../service/service.dart';

class DioSearchScheduleDateDatasource implements SearchScheduleDateDatasource {
  final SearchScheduleDateService searchScheduleDateService;
  final String sessionToken;

  DioSearchScheduleDateDatasource(
      {required this.searchScheduleDateService, required this.sessionToken});
  @override
  Future<List<ScheduleModel>?> searchScheduleFromDate(
      ScheduleDateEntity scheduleDateEntity) async {
    try {
      final result = await searchScheduleDateService.searchScheduleFromDate(
          sessionToken, ScheduleDateModel.fromEntity(scheduleDateEntity));
      return result;
    } on DioError catch (e) {
      throw DioError(requestOptions: e.requestOptions, response: e.response);
    }
  }
}
