import 'package:dio/dio.dart';

import '../../../../domain/entities/entities.dart';
import '../../../../infra/datasources/datasources.dart';
import '../../../../infra/models/models.dart';
import '../../external_dio.dart';

class DioLoginDatasource implements LoginDatasource {
  final LoginService loginService;

  DioLoginDatasource(this.loginService);
  @override
  Future<SignUpModel?> login(LoginEntity loginEntity) async {
    try {
      final result = await loginService.login(loginEntity);

      return result;
    } on DioError catch (e) {
      print(e.response!.statusMessage);
      throw Exception(e.response!.statusMessage);
    }
  }
}
