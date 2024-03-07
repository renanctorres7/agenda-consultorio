import 'package:dio/dio.dart';
import 'package:office_schedule/app/features/auth/infra/datasources/login_datasource.dart';

import '../../domain/entities/entities.dart';

import '../../infra/models/models.dart';
import '../service/login_service.dart';

class DioLoginDatasource implements LoginDatasource {
  final LoginService loginService;

  DioLoginDatasource({required this.loginService});
  @override
  Future<void> login(
      LoginEntity loginEntity,
      Function(SignUpModel response)? onLoginSuccess,
      Function(String error)? onLoginError) async {
    LoginModel loginModel = LoginModel.fromEntity(loginEntity);
    try {
      final result = await loginService.login(loginModel);

      onLoginSuccess!(result);
    } on DioException catch (e) {
      onLoginError!(e.message!);
    }
  }
}
