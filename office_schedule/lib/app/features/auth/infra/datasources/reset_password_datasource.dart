


import 'package:office_schedule/app/core/success/successful_response.dart';

abstract class ResetPasswordDatasource {
  Future<Success> resetPassword(String email);
}
