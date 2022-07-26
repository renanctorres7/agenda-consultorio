import 'package:dio/dio.dart';
import 'package:office_schedule/app/features/domain/success/successful_response.dart';

import 'package:office_schedule/app/features/domain/entities/clients/clients_update_entity.dart';
import 'package:office_schedule/app/features/external/remote/dio/service/clients/update_client_service.dart';
import 'package:office_schedule/app/features/infra/models/clients/clients_update_model.dart';

import '../../../../../infra/datasources/datasources.dart';

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
    } on DioError catch (e) {
      throw DioError(requestOptions: e.requestOptions, response: e.response);
    }
  }
}
