import 'package:dio/dio.dart';

import '../../../../core/success/success.dart';

import '../../infra/datasources/reset_password_datasource.dart';
import '../service/reset_password_service.dart';

class DioResetPasswordDatasource implements ResetPasswordDatasource {
  final ResetPasswordService resetPasswordService;

  DioResetPasswordDatasource({required this.resetPasswordService});
  @override
  Future<Success> resetPassword(String email) async {
    Map<String, String> mapEmail = {'email': email};
    try {
      await resetPasswordService.resetPassword(mapEmail);
      return SuccessfulResponse();
    } on DioError catch (e) {
      throw DioError(requestOptions: e.requestOptions, response: e.response);
    }
  }
}
