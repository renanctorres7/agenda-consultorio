import 'package:dio/dio.dart';

import '../../../../core/core.dart';
import '../../../../core/endpoints/parse_endpoints.dart';
import '../../../../core/errors/errors.dart';
import '../../infra/models/models.dart';

class SignUpService {
  static final _dio = Dio(BaseOptions(baseUrl: Environments.baseUrl));

  static Future<void> signUp(
      {required SignUpModel signUpModel,
      required Function(SignUpModel response) onSignUpSuccess,
      required Function(String error) onSignUpError}) async {
    try {
      final response = await _dio.post(
        ParseEndpoints.signUp,
        data: signUpModel.toJson(),
        options: Options(headers: ParseHeaders.header),
      );
      onSignUpSuccess(SignUpModel.fromJson(response.data));
    } on DioException catch (e) {
      final String error = e.response?.data['error'] ?? e.message;
      final int code = e.response?.data['code'] ?? e.response?.statusCode ?? 0;
      ServiceError(error, code);
      onSignUpError('$error, $code');
    }
  }
}
