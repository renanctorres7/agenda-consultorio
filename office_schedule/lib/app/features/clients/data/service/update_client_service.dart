import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';

import '../../../../core/core.dart';
import '../../../../core/endpoints/parse_endpoints.dart';
import '../../infra/models/models.dart';

part 'update_client_service.g.dart';

@RestApi(baseUrl: Environments.baseUrl)
abstract class UpdateClientService {
  factory UpdateClientService(Dio dio) => _UpdateClientService(dio);

  @POST(ParseEndpoints.updateClient)
  @Headers(ParseHeaders.header)
  Future<void> updateClient(
      @Header(ParseHeaders.sessionTokenTitle) String token,
      @Body() ClientsUpdateModel clientsUpdateModel);
}
