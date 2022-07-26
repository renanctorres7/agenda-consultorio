import 'package:dio/dio.dart';

import '../../../../core/success/success.dart';
import '../../domain/entities/entities.dart';
import '../../infra/datasources/datasource.dart';
import '../../infra/models/models.dart';
import '../service/service.dart';

class DioSearchScheduleDateDatasource implements SearchScheduleDateDatasource {
  final SearchScheduleDateService searchScheduleDateService;

  DioSearchScheduleDateDatasource({required this.searchScheduleDateService});
  @override
  Future<List<ScheduleModel>?> searchScheduleFromDate(
      String token, ScheduleDateEntity scheduleDateEntity) async {
    try {
      final result = await searchScheduleDateService.searchScheduleFromDate(
          token, ScheduleDateModel.fromEntity(scheduleDateEntity));
      return result ?? <ScheduleModel>[];
    } on DioError catch (e) {
      throw DioError(requestOptions: e.requestOptions, response: e.response);
    }
  }
}
