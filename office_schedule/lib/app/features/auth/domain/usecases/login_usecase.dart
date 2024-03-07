import 'package:dartz/dartz.dart';

import 'package:office_schedule/app/core/errors/failure_error.dart';

import 'package:office_schedule/app/features/auth/domain/entities/entities.dart';
import 'package:office_schedule/app/features/auth/domain/repository/login_repository.dart';

abstract class LoginUsecase {
  Future<void> login(
      LoginEntity entity,
      Function(SignUpEntity response) onLoginSuccess,
      Function(String error) onLoginError);
}

class LoginUsecaseImpl implements LoginUsecase {
  final LoginRepository repository;

  LoginUsecaseImpl(this.repository);
  @override
  Future<void> login(
      LoginEntity entity,
      Function(SignUpEntity response) onLoginSuccess,
      Function(String error) onLoginError) async {
    await repository.login(entity, onLoginSuccess, onLoginError);
  }
}
