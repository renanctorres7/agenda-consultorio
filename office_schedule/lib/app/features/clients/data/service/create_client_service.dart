import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';

import '../../../../../../core/core.dart';
import '../../../../../../core/endpoints/parse_endpoints.dart';
import '../../../../../infra/models/models.dart';

part 'create_client_service.g.dart';

@RestApi(baseUrl: Environments.baseUrl)
abstract class CreateClientService {
  factory CreateClientService(Dio dio) => _CreateClientService(dio);

  @POST(ParseEndpoints.createClient)
  @Headers(ParseHeaders.header)
  Future<void> createClient(
      @Header(ParseHeaders.sessionTokenTitle) String token,
      @Body() ClientsCreateModel clientsCreateModel);
}
