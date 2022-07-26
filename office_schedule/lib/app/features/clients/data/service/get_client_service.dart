import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';

import '../../../../core/core.dart';
import '../../../../core/endpoints/parse_endpoints.dart';
import '../../infra/models/models.dart';

part 'get_client_service.g.dart';

@RestApi(baseUrl: Environments.baseUrl)
abstract class GetClientService {
  factory GetClientService(Dio dio) => _GetClientService(dio);

  @POST(ParseEndpoints.getClient)
  @Headers(ParseHeaders.header)
  Future<ClientsModel?> getClient(
      @Header(ParseHeaders.sessionTokenTitle) String token,
      @Body() Map<String, String> objectId);
}
