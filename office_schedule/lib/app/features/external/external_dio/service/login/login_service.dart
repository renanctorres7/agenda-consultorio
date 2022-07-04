import 'package:dio/dio.dart' hide Headers;

import 'package:retrofit/retrofit.dart';

import '../../../../../core/environments/environments.dart';
import '../../../../../core/keys/parse_server/parse_headers.dart';
import '../../../../infra/models/models.dart';

part 'login_service.g.dart';

@RestApi(baseUrl: Environments.baseUrl)
abstract class LoginService {
  factory LoginService(Dio dio) => _LoginService(dio);

  @POST('/signup')
  @Headers(ParseHeaders.header)
  Future<SignUpModel> login(@Body() LoginModel loginModel);
}
