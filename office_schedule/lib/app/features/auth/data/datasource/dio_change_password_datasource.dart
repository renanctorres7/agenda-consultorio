import 'package:dio/dio.dart';

import '../../../../core/success/success.dart';
import '../../domain/entities/entities.dart';
import '../../infra/datasources/change_password_datasource.dart';
import '../../infra/models/models.dart';
import '../service/change_password_service.dart';

class DioChangePasswordDatasource implements ChangePasswordDatasource {
  final ChangePasswordService changePasswordService;

  DioChangePasswordDatasource({required this.changePasswordService});
  @override
  Future<Success> changePasswordEmail(
      String token, NewPasswordEntity newPassword) async {
    NewPasswordModel newPasswordModel =
        NewPasswordModel.fromEntity(newPassword);
    try {
      await changePasswordService.changePasswordEmail(token, newPasswordModel);
      return SuccessfulResponse();
    } on DioError catch (e) {
      throw DioError(requestOptions: e.requestOptions, response: e.response);
    }
  }
}
