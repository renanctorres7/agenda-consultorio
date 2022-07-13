import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';

import '../../../../../../core/endpoints/parse_endpoints.dart';
import '../../../../../../core/environments/environments.dart';
import '../../../../../../core/keys/parse_server/parse_headers.dart';

part 'reset_password_service.g.dart';

@RestApi(baseUrl: Environments.baseUrl)
abstract class ResetPasswordService {
  factory ResetPasswordService(Dio dio) => _ResetPasswordService(dio);

  @POST(ParseEndpoints.resetPassword)
  @Headers(ParseHeaders.header)
  Future<void> resetPassword(@Body() Map<String, String> email);
}
