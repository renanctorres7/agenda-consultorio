import 'package:dio/dio.dart';

import '../../../../../domain/entities/entities.dart';
import '../../../../../infra/datasources/datasources.dart';
import '../../../../../infra/models/models.dart';
import '../../../remote.dart';

class DioLoginDatasource implements LoginDatasource {
  final LoginService loginService;

  DioLoginDatasource({required this.loginService});
  @override
  Future<SignUpModel?> login(LoginEntity loginEntity) async {
    LoginModel loginModel = LoginModel.fromEntity(loginEntity);
    try {
      final result = await loginService.login(loginModel);

      return result;
    } on DioError catch (e) {
      throw DioError(requestOptions: e.requestOptions, response: e.response);
    }
  }
}
