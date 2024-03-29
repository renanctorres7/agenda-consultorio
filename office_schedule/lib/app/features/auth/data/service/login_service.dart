import 'package:dio/dio.dart' hide Headers;
import 'package:office_schedule/app/core/endpoints/parse_endpoints.dart';

import 'package:retrofit/retrofit.dart';

import '../../../../core/core.dart';
import '../../infra/models/models.dart';

part 'login_service.g.dart';

@RestApi(baseUrl: Environments.baseUrl)
abstract class LoginService {
  factory LoginService(Dio dio) => _LoginService(dio);

  @POST(ParseEndpoints.login)
  @Headers(ParseHeaders.header)
  Future<SignUpModel> login(@Body() LoginModel loginModel);
}
