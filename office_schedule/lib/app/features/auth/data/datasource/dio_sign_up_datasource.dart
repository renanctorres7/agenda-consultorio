import 'package:dio/dio.dart';

import '../../domain/entities/entities.dart';
import '../../infra/datasources/sign_up_datasource.dart';
import '../../infra/models/models.dart';
import '../service/sign_up_service.dart';

class DioSignUpDatasource implements SignUpDatasource {
  final SignUpService signUpService;

  DioSignUpDatasource({required this.signUpService});
  @override
  Future<SignUpModel?> signUp(SignUpEntity entity) async {
    SignUpModel signUpModel = SignUpModel.fromEntity(entity);
    try {
      final result = await signUpService.signUp(signUpModel);
      return result;
    } on DioException catch (e) {
      throw DioException(
          requestOptions: e.requestOptions, response: e.response);
    }
  }
}
