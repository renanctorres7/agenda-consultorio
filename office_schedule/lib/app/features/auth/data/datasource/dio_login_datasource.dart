import 'package:dio/dio.dart';
import 'package:office_schedule/app/features/auth/infra/datasources/login_datasource.dart';

import '../../domain/entities/entities.dart';

import '../../infra/models/models.dart';
import '../service/login_service.dart';

class DioLoginDatasource implements LoginDatasource {
  @override
  Future<void> login(
      LoginEntity loginEntity,
      Function(SignUpModel response) onLoginSuccess,
      Function(String error) onLoginError) async {
    LoginModel loginModel = LoginModel.fromEntity(loginEntity);
    try {
      await LoginService.login(
        loginModel: loginModel,
        onLoginSuccess: (response) => onLoginSuccess(response),
        onLoginError: (error) => onLoginError(error),
      );
    } on DioException catch (e) {
      onLoginError(e.message ?? 'error');
    }
  }
}
