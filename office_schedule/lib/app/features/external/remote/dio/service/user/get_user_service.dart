import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/http.dart';

import '../../../../../../core/endpoints/parse_endpoints.dart';
import '../../../../../../core/environments/environments.dart';
import '../../../../../../core/keys/parse_server/parse_headers.dart';
import '../../../../../infra/models/models.dart';

part 'get_user_service.g.dart';

@RestApi(baseUrl: Environments.baseUrl)
abstract class GetUserService {
  factory GetUserService(Dio dio) => _GetUserService(dio);

  @POST(ParseEndpoints.getUser)
  @Headers(ParseHeaders.header)
  Future<UserModel?> getUserProfile(
      @Header(ParseHeaders.sessionTokenTitle) String token,
      @Body() Map<String, String> objectId);
}
