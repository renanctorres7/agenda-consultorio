import 'package:dio/dio.dart';

import 'package:retrofit/retrofit.dart';

import '../../../../domain/entities/entities.dart';

part 'change_password_service.g.dart';

@RestApi(baseUrl: '')
abstract class ChangePasswordService {
  factory ChangePasswordService(Dio dio) => _ChangePasswordService(dio);

  @POST('/change-password-email')
  Future<void> changePasswordEmail(@Body() NewPasswordEntity newPassword);
}
