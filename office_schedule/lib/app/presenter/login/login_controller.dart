import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:office_schedule/app/core/debug_print_color/debug_print_color.dart';
import 'package:office_schedule/app/core/parse_server/status_code/status_code.dart';
import 'package:office_schedule/app/core/utils/utils.dart';
import 'package:office_schedule/app/features/auth/domain/usecases/login_usecase.dart';
import 'package:office_schedule/app/features/auth/domain/usecases/sign_up_usecase.dart';
import 'package:office_schedule/app/features/auth/infra/models/login/login_model.dart';
import 'package:office_schedule/app/features/auth/infra/models/models.dart';
import 'package:office_schedule/app/features/auth/infra/models/sign_up/sign_up_model.dart';
import 'package:office_schedule/app/features/profile/infra/models/user_model.dart';

class LoginController extends GetxController {
  final LoginUsecase _loginUsecase = Get.find();
  final SignUpUsecase _signUpUsecase = Get.find();

  TabController? tabController;

  RxInt tabIndex = 0.obs;

  Rx<SignUpModel> signUpModel = Rx<SignUpModel>(SignUpModel());

  Future<void> login(
      {required String email,
      required String password,
      required Function(UserProfileModel userProfileModel) onSuccess,
      required Function(String? error) onError}) async {
    LoginModel loginModel = LoginModel(email: email, password: password);
    await _loginUsecase.login(loginModel, (value) {
      UserProfileModel userProfileModel =
          UserProfileModel.fromSignUpModel(SignUpModel.fromEntity(value));
      onSuccess(userProfileModel);
    }, (error) {
      String message = error;
      String statusCode = Utils.extractNumberString(error);
      if (statusCode != '') {
        message = ParseStatusCode.getMessage(statusCode);
      }
      onError(message);
    });
  }

  Future<void> signUp(
      {required Function() onSuccess,
      required Function(String? error) onError}) async {
    final result = await _signUpUsecase.call(signUpModel.value);
    result.fold((error) {
      String? message;
      if (error.message != null) {
        String statusCode = Utils.extractNumberString(error.message!);
        if (statusCode != '') {
          message = ParseStatusCode.getMessage(statusCode);
        }
      }

      onError(message);
    }, (response) {
      onSuccess();
    });
  }

  setSignUpModel(
      {required String fullName,
      required String email,
      required String password,
      required String phone,
      required String company,
      required String specialty}) {
    signUpModel.value = SignUpModel(
        username: email,
        fullName: fullName,
        email: email,
        password: password,
        phone: phone,
        company: company,
        specialty: specialty);
  }
}
