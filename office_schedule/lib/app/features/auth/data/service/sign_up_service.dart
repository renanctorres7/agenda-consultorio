import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';

import '../../../../core/core.dart';
import '../../../../core/endpoints/parse_endpoints.dart';
import '../../infra/models/models.dart';

part 'sign_up_service.g.dart';

@RestApi(baseUrl: Environments.baseUrl)
abstract class SignUpService {
  factory SignUpService(Dio dio) => _SignUpService(dio);

  @POST(ParseEndpoints.signUp)
  @Headers(ParseHeaders.header)
  Future<SignUpModel?> signUp(@Body() SignUpModel signUpModel);
}
