import 'package:office_schedule/app/features/auth/domain/entities/entities.dart';
import 'package:office_schedule/app/features/auth/infra/models/sign_up/sign_up_model.dart';

abstract class SignUpDatasource {
  Future<void> signUp(
      SignUpEntity entity,
      Function(SignUpModel response) onSignUpSuccess,
      Function(String error) onSignUpError);
}
