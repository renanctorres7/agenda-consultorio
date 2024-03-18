import 'package:dio/dio.dart';

import '../../domain/entities/entities.dart';
import '../../infra/datasources/sign_up_datasource.dart';
import '../../infra/models/models.dart';
import '../service/sign_up_service.dart';

class DioSignUpDatasource implements SignUpDatasource {
  @override
  Future<void> signUp(
      SignUpEntity entity,
      Function(SignUpModel response) onSignUpSuccess,
      Function(String error) onSignUpError) async {
    SignUpModel signUpModel = SignUpModel.fromEntity(entity);
    try {
      await SignUpService.signUp(
          signUpModel: signUpModel,
          onSignUpSuccess: (response) => onSignUpSuccess(response),
          onSignUpError: (error) => onSignUpError(error));
    } on DioException catch (e) {
      onSignUpError(e.message ?? e.error.toString());
    }
  }
}
