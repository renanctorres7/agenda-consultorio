import 'package:dio/dio.dart' hide Headers;
import 'package:office_schedule/app/core/endpoints/parse_endpoints.dart';
import 'package:office_schedule/app/core/environments/environments.dart';
import 'package:office_schedule/app/core/parse_server/parse_headers/parse_headers.dart';

import 'package:retrofit/retrofit.dart';

import '../../infra/models/models.dart';

part 'change_password_service.g.dart';

@RestApi(baseUrl: Environments.baseUrl)
abstract class ChangePasswordService {
  factory ChangePasswordService(Dio dio) => _ChangePasswordService(dio);

  @POST(ParseEndpoints.changePasswordEmail)
  @Headers(ParseHeaders.header)
  Future<void> changePasswordEmail(
      @Header(ParseHeaders.sessionTokenTitle) String token,
      @Body() NewPasswordModel newPassword);
}
