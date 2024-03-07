import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:office_schedule/app/features/auth/domain/repository/login_repository.dart';
import 'package:office_schedule/app/features/auth/infra/datasources/login_datasource.dart';
import 'package:office_schedule/app/presenter/login/login_controller.dart';

import '../../features/auth/data/datasource/dio_login_datasource.dart';
import '../../features/auth/data/service/login_service.dart';
import '../../features/auth/domain/usecases/login_usecase.dart';
import '../../features/auth/infra/repository/login_repository_impl.dart';

class LoginBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(Dio());
    Get.put(LoginService(Get.find()));

    Get.put<LoginDatasource>(DioLoginDatasource(loginService: Get.find()));
    Get.put<LoginRepository>(LoginRepositoryImpl(Get.find()));
    Get.put<LoginUsecase>(LoginUsecaseImpl(Get.find()));
    Get.put(LoginController());
  }
}
