import 'package:dio/dio.dart';
import 'package:office_schedule/app/features/domain/success/successful_response.dart';
import 'package:office_schedule/app/features/external/remote/dio/service/clients/delete_client_service.dart';

import '../../../../../infra/datasources/datasources.dart';

class DioDeleteClientDatasource implements DeleteClientDatasource {
  final DeleteClientService deleteClientService;

  DioDeleteClientDatasource({required this.deleteClientService});
  @override
  Future<Success> deleteClient(
      {required String token, required String objectId}) async {
    Map<String, String> mapObjectId = {'objectId': objectId};
    try {
      await deleteClientService.deleteClient(token, mapObjectId);
      return SuccessfulResponse();
    } on DioError catch (e) {
      throw DioError(requestOptions: e.requestOptions, response: e.response);
    }
  }
}
