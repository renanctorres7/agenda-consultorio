import 'package:dio/dio.dart';

import '../../infra/datasources/datasource.dart';
import '../../infra/models/models.dart';
import '../service/service.dart';

class DioGetClientsListDatasource implements GetClientsListDatasource {
  final GetClientsListService getClientsListService;

  DioGetClientsListDatasource({required this.getClientsListService});
  @override
  Future<List<ClientsListModel>?> getClientsList(
      {required String token}) async {
    try {
      final result = await getClientsListService.getClientsList(token);
      return result ?? <ClientsListModel>[];
    } on DioError catch (e) {
      throw DioError(requestOptions: e.requestOptions, response: e.response);
    }
  }
}
