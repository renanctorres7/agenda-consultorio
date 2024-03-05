import 'package:dartz/dartz.dart';

import 'package:office_schedule/app/core/errors/failure_error.dart';
import 'package:office_schedule/app/features/auth/domain/entities/entities.dart';
import 'package:office_schedule/app/features/auth/domain/repository/login_repository.dart';
import 'package:office_schedule/app/features/auth/infra/datasources/login_datasource.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginDatasource datasource;

  LoginRepositoryImpl(this.datasource);
  @override
  Future<void> login(
      LoginEntity loginEntity,
      Function(SignUpEntity response)? onLoginSuccess,
      Function(String error)? onLoginError) async {
    try {
      await datasource.login(loginEntity, (response) {
        onLoginSuccess!(response);
        return response;
      }, (error) {
        onLoginError!('error');
        return null;
      });
    } catch (e) {
      onLoginError!(e.toString());
    }
  }
}
