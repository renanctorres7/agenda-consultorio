import '../../../../domain/entities/entities.dart';
import '../../../../domain/success/success.dart';
import '../../../../infra/datasources/datasources.dart';

class DioChangePasswordDatasource implements ChangePasswordDatasource {
  @override
  Future<Success> changePasswordEmail(NewPasswordEntity newPassword) {
    // TODO: implement changePasswordEmail
    throw UnimplementedError();
  }
}
