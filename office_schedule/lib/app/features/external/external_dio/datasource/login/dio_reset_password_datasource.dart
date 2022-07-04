import 'package:dio/dio.dart';
import 'package:office_schedule/app/features/domain/success/successful_response.dart';
import 'package:office_schedule/app/features/external/external_dio/service/login/reset_password_service.dart';
import 'package:office_schedule/app/features/infra/datasources/datasources.dart';

class DioResetPasswordDatasource implements ResetPasswordDatasource {
  final ResetPasswordService service;

  DioResetPasswordDatasource(this.service);
  @override
  Future<Success> resetPassword(String email) async {
    Map<String, String> mapEmail = {'email': email};
    try {
      await service.resetPassword(mapEmail);
      return SuccessfulResponse();
    } on DioError catch (e) {
      throw DioError(requestOptions: e.requestOptions, response: e.response);
    }
  }
}
