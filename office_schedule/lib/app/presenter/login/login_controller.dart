import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:office_schedule/app/features/auth/domain/usecases/login_usecase.dart';
import 'package:office_schedule/app/features/auth/infra/models/login/login_model.dart';

class LoginController extends GetxController {
  final LoginUsecase _loginUsecase;

  LoginController() : _loginUsecase = Get.find();

  TabController? tabController;

  RxInt tabIndex = 0.obs;

  Future<void> login({required String email, required String password}) async {
    LoginModel loginModel = LoginModel(email: email, password: password);
    await _loginUsecase.login(loginModel, (value) {
      print(value.company);
    }, (error) {
      print(error);
    });
  }
}
