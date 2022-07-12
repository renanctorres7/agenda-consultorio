import 'package:dio/dio.dart';

import '../../../../domain/entities/entities.dart';
import '../../../../infra/datasources/datasources.dart';
import '../../../../infra/models/models.dart';
import '../../external_dio.dart';

class DioSignUpDatasource implements SignUpDatasource {
  final SignUpService signUpService;

  DioSignUpDatasource({required this.signUpService});
  @override
  Future<SignUpModel?> signUp(SignUpEntity entity) async {
    SignUpModel signUpModel = SignUpModel.fromEntity(entity);
    try {
      final result = await signUpService.signUp(signUpModel);
      return result;
    } on DioError catch (e) {
      throw DioError(requestOptions: e.requestOptions, response: e.response);
    }
  }
}
