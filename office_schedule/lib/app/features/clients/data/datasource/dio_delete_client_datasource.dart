import 'package:dio/dio.dart';

import '../../../../core/success/success.dart';
import '../../infra/datasources/datasource.dart';
import '../service/service.dart';

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
    } on DioException catch (e) {
      throw DioException(
          requestOptions: e.requestOptions, response: e.response);
    }
  }
}
