import 'package:office_schedule/app/features/auth/domain/entities/entities.dart';
import 'package:office_schedule/app/features/auth/infra/models/sign_up/sign_up_model.dart';

abstract class LoginDatasource {
  Future<void> login(
      LoginEntity loginEntity,
      Function(SignUpModel response) onLoginSuccess,
      Function(String error) onLoginError);
}
