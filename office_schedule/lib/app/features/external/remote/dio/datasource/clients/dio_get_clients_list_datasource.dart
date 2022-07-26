import 'package:dio/dio.dart';
import 'package:office_schedule/app/features/external/external.dart';
import 'package:office_schedule/app/features/infra/models/clients/clients_list_model.dart';

import '../../../../../infra/datasources/datasources.dart';

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
