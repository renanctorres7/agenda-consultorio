import 'package:dio/dio.dart';
import 'package:office_schedule/app/features/external/external.dart';
import 'package:office_schedule/app/features/infra/models/clients/clients_model.dart';

import '../../../../../infra/datasources/datasources.dart';

class DioGetClientDatasource implements GetClientDatasource {
  final GetClientService getClientService;

  DioGetClientDatasource({required this.getClientService});
  @override
  Future<ClientsModel?> getClient(
      {required String token, required String objectId}) async {
    Map<String, String> mapObjectId = {'objectId': objectId};
    try {
      final result = await getClientService.getClient(token, mapObjectId);
      return result;
    } on DioError catch (e) {
      throw DioError(requestOptions: e.requestOptions, response: e.response);
    }
  }
}
