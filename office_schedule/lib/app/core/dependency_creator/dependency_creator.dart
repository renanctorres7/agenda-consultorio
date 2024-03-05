import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:office_schedule/app/features/auth/data/datasource/dio_login_datasource.dart';
import 'package:office_schedule/app/features/auth/data/service/login_service.dart';
import 'package:office_schedule/app/features/auth/domain/repository/login_repository.dart';
import 'package:office_schedule/app/features/auth/infra/datasources/login_datasource.dart';
import 'package:office_schedule/app/features/auth/infra/repository/login_repository_impl.dart';

import '../../features/auth/domain/usecases/login_usecase.dart';

final s1 = GetIt.instance;

class DependencyCreator {
  static init() {
    _loginInjection();
  }
}

_loginInjection() {
  s1.registerSingleton<Dio>(Dio());
  s1.registerFactory<LoginService>(() => LoginService(s1<Dio>()));

  s1.registerSingleton<LoginDatasource>(DioLoginDatasource(loginService: s1()));
  s1.registerSingleton<LoginRepository>(LoginRepositoryImpl(s1()));
  s1.registerSingleton<LoginUsecase>(LoginUsecaseImpl(s1()));
}
