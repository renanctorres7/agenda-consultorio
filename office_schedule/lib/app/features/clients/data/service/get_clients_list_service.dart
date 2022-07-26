import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';

import '../../../../../../core/core.dart';
import '../../../../../../core/endpoints/parse_endpoints.dart';
import '../../../../../infra/models/models.dart';

part 'get_clients_list_service.g.dart';

@RestApi(baseUrl: Environments.baseUrl)
abstract class GetClientsListService {
  factory GetClientsListService(Dio dio) => _GetClientsListService(dio);

  @POST(ParseEndpoints.getClientsList)
  @Headers(ParseHeaders.header)
  Future<List<ClientsListModel>?> getClientsList(
    @Header(ParseHeaders.sessionTokenTitle) String token,
  );
}
