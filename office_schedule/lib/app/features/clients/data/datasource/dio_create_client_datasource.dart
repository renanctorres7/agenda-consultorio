import 'package:dio/dio.dart';

import '../../../../core/success/success.dart';
import '../../domain/entities/entities.dart';
import '../../infra/datasources/datasource.dart';
import '../../infra/models/models.dart';
import '../service/service.dart';

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
    } on DioException catch (e) {
      throw DioException(
          requestOptions: e.requestOptions, response: e.response);
    }
  }
}
