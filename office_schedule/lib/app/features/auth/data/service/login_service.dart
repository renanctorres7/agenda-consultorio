import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:office_schedule/app/core/debug_print_color/debug_print_color.dart';
import 'package:office_schedule/app/core/errors/failure_error.dart';
import 'package:office_schedule/app/features/auth/data/storage/hive_token_storage.dart';
import 'package:office_schedule/app/features/profile/data/storage/hive_user_profile.dart';

import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

import '../../../profile/data/storage/models/hive_user_profile_model.dart';
import '../../infra/models/models.dart';

class LoginService {
  static Future<void> login(
      {required LoginModel loginModel,
      required Function(SignUpModel response) onLoginSuccess,
      required Function(String error) onLoginError}) async {
    Map<String, dynamic> decodedResponse = {};
    final username = loginModel.email;
    final password = loginModel.password;

    final user = ParseUser(username, password, null);

    var response = await user.login();

    if (response.success) {
      decodedResponse =
          jsonDecode(response.result.toString()) as Map<String, dynamic>;

      SignUpModel signUpModel = SignUpModel.fromJson(decodedResponse);

      await HiveTokenStorage(decodedResponse['sessionToken']).writeStorage();
      await HiveUserProfile(HiveUserProfileModel.fromSignUpModel(signUpModel))
          .writeStorage();

      onLoginSuccess(signUpModel);
    } else {
      ServiceError(response.error?.message, response.statusCode);
      onLoginError('${response.error?.message} ${response.statusCode}');
    }
  }
}
