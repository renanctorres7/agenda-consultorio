import 'package:dartz/dartz.dart';
import 'package:office_schedule/app/core/errors/failure_error.dart';

import 'package:office_schedule/app/features/auth/domain/entities/entities.dart';

abstract class LoginRepository {
  Future<void> login(
      LoginEntity entity,
      Function(SignUpEntity response)? onLoginSuccess,
      Function(String error)? onLoginError);
}
