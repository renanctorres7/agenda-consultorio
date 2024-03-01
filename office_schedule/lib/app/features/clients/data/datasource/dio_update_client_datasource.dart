import 'package:dio/dio.dart';

import '../../../../core/success/success.dart';
import '../../domain/entities/entities.dart';
import '../../infra/datasources/datasource.dart';
import '../../infra/models/models.dart';
import '../service/service.dart';

class DioUpdateClientDatasource implements ClientsUpdateDatasource {
  final UpdateClientService updateClientService;

  DioUpdateClientDatasource({required this.updateClientService});
  @override
  Future<Success> updateClient(
      {required String token,
      required ClientsUpdateEntity clientsUpdateEntity}) async {
    try {
      await updateClientService.updateClient(
          token, ClientsUpdateModel.fromEntity(clientsUpdateEntity));
      return SuccessfulResponse();
    } on DioException catch (e) {
      throw DioException(
          requestOptions: e.requestOptions, response: e.response);
    }
  }
}
