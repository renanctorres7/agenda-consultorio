import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';

import '../../../../../../core/core.dart';
import '../../../../../../core/endpoints/parse_endpoints.dart';

part 'delete_client_service.g.dart';

@RestApi(baseUrl: Environments.baseUrl)
abstract class DeleteClientService {
  factory DeleteClientService(Dio dio) => _DeleteClientService(dio);

  @POST(ParseEndpoints.deleteClient)
  @Headers(ParseHeaders.header)
  Future<void> deleteClient(
      @Header(ParseHeaders.sessionTokenTitle) String token,
      @Body() Map<String, String> objectId);
}
