import 'package:dio/dio.dart';
import 'package:office_schedule/app/features/domain/success/successful_response.dart';
import 'package:office_schedule/app/features/domain/entities/clients/clients_create_entity.dart';
import 'package:office_schedule/app/features/external/external.dart';
import 'package:office_schedule/app/features/infra/datasources/datasources.dart';
import 'package:office_schedule/app/features/infra/models/models.dart';

class DioCreateClientDatasource implements ClientsCreateDatasource {
  final CreateClientService createClientService;

  DioCreateClientDatasource({required this.createClientService});
  @override
  Future<Success> createClient(
      {required String token,
      required ClientsCreateEntity clientsCreateEntity}) async {
    try {
      await createClientService.createClient(
          token, ClientsCreateModel.fromEntity(clientsCreateEntity));
      return SuccessfulResponse();
    } on DioError catch (e) {
      throw DioError(requestOptions: e.requestOptions, response: e.response);
    }
  }
}
