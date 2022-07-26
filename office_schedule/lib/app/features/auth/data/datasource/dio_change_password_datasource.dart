import 'package:dio/dio.dart';

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
