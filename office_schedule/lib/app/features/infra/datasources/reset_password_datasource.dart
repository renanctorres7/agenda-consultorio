import '../../domain/success/success.dart';

abstract class ResetPasswordDatasource {
  Future<Success> resetPassword(String email);
}
