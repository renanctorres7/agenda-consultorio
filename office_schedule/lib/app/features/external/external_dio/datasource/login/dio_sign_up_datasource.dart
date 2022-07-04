import 'package:dio/dio.dart';
import 'package:office_schedule/app/features/domain/entities/login/sign_up_entity.dart';
import 'package:office_schedule/app/features/external/external_dio/service/login/sign_up_service.dart';
import 'package:office_schedule/app/features/infra/datasources/datasources.dart';
import 'package:office_schedule/app/features/infra/models/sign_up/sign_up_model.dart';

class DioSignUpDatasource implements SignUpDatasource {
  final SignUpService signUpService;

  DioSignUpDatasource(this.signUpService);
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
