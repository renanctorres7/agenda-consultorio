import 'package:dio/dio.dart' hide Headers;
import 'package:office_schedule/app/core/environments/environments.dart';
import 'package:retrofit/http.dart';

import '../../../../../core/keys/parse_server/parse_headers.dart';
import '../../../../infra/models/models.dart';

part 'get_user_service.g.dart';

@RestApi(baseUrl: Environments.baseUrl)
abstract class GetUserService {
  factory GetUserService(Dio dio) => _GetUserService(dio);

  @POST('/get-user')
  @Headers(ParseHeaders.header)
  Future<UsersModel?> getUserProfile(@Body() Map<String, String> objectId);
}
