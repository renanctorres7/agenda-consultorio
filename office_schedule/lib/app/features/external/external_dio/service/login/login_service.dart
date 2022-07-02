import 'package:dio/dio.dart';

import 'package:retrofit/retrofit.dart';

import '../../../../infra/models/models.dart';

part 'login_service.g.dart';

@RestApi(baseUrl: '')
abstract class LoginService {
  factory LoginService(Dio dio) => _LoginService(dio);

  @POST('')
  Future<SignUpModel?> login(@Body() LoginModel loginModel);
}
