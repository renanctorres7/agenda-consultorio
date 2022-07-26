import 'package:dio/dio.dart';

import '../../../../core/success/success.dart';
import '../../infra/datasources/validate_token_datasource.dart';
import '../service/validate_token_service.dart';

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
