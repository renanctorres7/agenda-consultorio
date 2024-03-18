import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:office_schedule/app/features/auth/data/datasource/dio_sign_up_datasource.dart';
import 'package:office_schedule/app/features/auth/data/service/sign_up_service.dart';
import 'package:office_schedule/app/features/auth/domain/repository/login_repository.dart';
import 'package:office_schedule/app/features/auth/domain/repository/sign_up_repository.dart';
import 'package:office_schedule/app/features/auth/domain/usecases/sign_up_usecase.dart';
import 'package:office_schedule/app/features/auth/infra/datasources/login_datasource.dart';
import 'package:office_schedule/app/features/auth/infra/datasources/sign_up_datasource.dart';
import 'package:office_schedule/app/presenter/login/login_controller.dart';

import '../../features/auth/data/datasource/dio_login_datasource.dart';
import '../../features/auth/data/service/login_service.dart';
import '../../features/auth/domain/usecases/login_usecase.dart';
import '../../features/auth/infra/repository/login_repository_impl.dart';
import '../../features/auth/infra/repository/sign_up_repository_impl.dart';

class LoginBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(Dio());

    /// LOGIN
    ///
    Get.put(LoginService());

    Get.put<LoginDatasource>(DioLoginDatasource());
    Get.put<LoginRepository>(LoginRepositoryImpl(Get.find()));
    Get.put<LoginUsecase>(LoginUsecaseImpl(Get.find()));

    /// SIGN UP
    ///
    Get.put(SignUpService());
    Get.put<SignUpDatasource>(DioSignUpDatasource());
    Get.put<SignUpRepository>(SignUpRepositoryImpl(Get.find()));
    Get.put<SignUpUsecase>(UserSignUpUsecaseImpl(Get.find()));

    Get.put(LoginController());
  }
}
