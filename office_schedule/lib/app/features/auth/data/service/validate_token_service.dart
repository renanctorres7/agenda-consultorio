import 'package:dio/dio.dart' hide Headers;

import 'package:retrofit/retrofit.dart';

import '../../../../core/core.dart';
import '../../../../core/endpoints/parse_endpoints.dart';

part 'validate_token_service.g.dart';

@RestApi(baseUrl: Environments.baseUrl)
abstract class ValidateTokenService {
  factory ValidateTokenService(Dio dio) => _ValidateTokenService(dio);

  @POST(ParseEndpoints.validateToken)
  @Headers(ParseHeaders.header)
  Future<void> validateToken(
      @Header(ParseHeaders.sessionTokenTitle) String token);
}
