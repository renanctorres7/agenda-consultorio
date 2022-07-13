import 'package:dio/dio.dart';

import '../../../../../domain/success/success.dart';
import '../../../../../infra/datasources/datasources.dart';
import '../../service/service.dart';

class DioValidateTokenDatasource implements ValidateTokenDatasource {
  final ValidateTokenService validateTokenService;

  DioValidateTokenDatasource({required this.validateTokenService});

  @override
  Future<Success> validateToken(String token) async {
    try {
      await validateTokenService.validateToken(token);
      return SuccessfulResponse();
    } on DioError catch (e) {
      throw DioError(requestOptions: e.requestOptions, response: e.response);
    }
  }
}
