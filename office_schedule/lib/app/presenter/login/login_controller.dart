import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:office_schedule/app/features/auth/domain/usecases/login_usecase.dart';
import 'package:office_schedule/app/features/auth/infra/models/login/login_model.dart';

class LoginController extends GetxController {
  final LoginUsecase _loginUsecase;

  LoginController() : _loginUsecase = Get.find();

  TabController? tabController;

  RxInt tabIndex = 0.obs;

  Future<void> login(String email, String password) async {
    await _loginUsecase.login(LoginModel(email: email, password: password),
        (value) {
      print(value);
    }, (error) {
      print(error);
    });
  }
}
