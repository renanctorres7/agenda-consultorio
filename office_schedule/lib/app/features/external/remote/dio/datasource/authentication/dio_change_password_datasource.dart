import 'package:dio/dio.dart';

import '../../../../../infra/datasources/datasources.dart';
import '../../../../../domain/entities/entities.dart';
import '../../../../../domain/success/success.dart';

import '../../../../../infra/models/models.dart';
import '../../service/service.dart';

class DioChangePasswordDatasource implements ChangePasswordDatasource {
  final ChangePasswordService changePasswordService;
  final String sessionToken;

  DioChangePasswordDatasource(
      {required this.changePasswordService, required this.sessionToken});
  @override
  Future<Success> changePasswordEmail(NewPasswordEntity newPassword) async {
    NewPasswordModel newPasswordModel =
        NewPasswordModel.fromEntity(newPassword);
    try {
      await changePasswordService.changePasswordEmail(
          sessionToken, newPasswordModel);
      return SuccessfulResponse();
    } on DioError catch (e) {
      throw DioError(requestOptions: e.requestOptions, response: e.response);
    }
  }
}
