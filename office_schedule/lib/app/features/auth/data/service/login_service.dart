import 'dart:convert';

import 'package:dio/dio.dart' hide Headers;
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:office_schedule/app/core/endpoints/parse_endpoints.dart';
import 'package:office_schedule/app/features/auth/infra/models/sign_up/sign_up_model.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

import 'package:retrofit/retrofit.dart';

import '../../../../core/core.dart';
import '../../infra/models/models.dart';

part 'login_service.g.dart';

// @RestApi(baseUrl: Environments.baseUrl)
// abstract class LoginService {
//   factory LoginService(Dio dio) => _LoginService(dio);

//   @POST(ParseEndpoints.login)
//   @Headers(ParseHeaders.header)
//   Future<SignUpModel> login(@Body() LoginModel loginModel);
// }

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

      debugPrint('PARSE SERVICE SUCCESS: login');
      onLoginSuccess(SignUpModel.fromJson(decodedResponse));
    } else {
      debugPrint(response.result.toString());
      onLoginError('Usuário ou senha inválidos ${response.statusCode}');
    }
  }
}
