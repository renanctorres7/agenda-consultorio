import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/http.dart';

import '../../../../../../core/core.dart';
import '../../../../../../core/endpoints/parse_endpoints.dart';
import '../../../../../infra/models/models.dart';

part 'get_users_list_service.g.dart';

@RestApi(baseUrl: Environments.baseUrl)
abstract class GetUsersListService {
  factory GetUsersListService(Dio dio) => GetUsersListService(dio);

  @POST(ParseEndpoints.getUsersList)
  @Headers(ParseHeaders.header)
  Future<List<UserModel>?> getUsersList(
      @Header(ParseHeaders.sessionTokenTitle) String token);
}
