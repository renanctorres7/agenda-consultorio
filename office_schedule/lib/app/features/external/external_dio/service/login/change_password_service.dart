import 'package:dio/dio.dart' hide Headers;
import 'package:office_schedule/app/core/keys/parse_server/parse_headers.dart';

import 'package:retrofit/retrofit.dart';

import '../../../../domain/entities/entities.dart';

part 'change_password_service.g.dart';

@RestApi(baseUrl: '')
abstract class ChangePasswordService {
  factory ChangePasswordService(Dio dio) => _ChangePasswordService(dio);

  @POST('/change-password-email')
  @Headers(ParseHeaders.header)
  Future<void> changePasswordEmail(
      @Header(ParseHeaders.sessionTokenTitle) String sessionToken,
      @Body() NewPasswordEntity newPassword);
}
