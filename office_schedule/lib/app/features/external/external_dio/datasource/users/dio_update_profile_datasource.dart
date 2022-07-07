import 'package:dio/dio.dart';
import 'package:office_schedule/app/features/domain/entities/login/sign_up_entity.dart';
import 'package:office_schedule/app/features/external/external_dio/external_dio.dart';
import 'package:office_schedule/app/features/infra/datasources/datasources.dart';
import 'package:office_schedule/app/features/infra/models/sign_up/sign_up_model.dart';

class DioUpdateProfileDatasource implements UpdateProfileDatasource {
  final UpdateProfileService updateProfileService;
  final String sessionToken;

  DioUpdateProfileDatasource(
      {required this.updateProfileService, required this.sessionToken});
  @override
  Future<SignUpModel?> updateProfile(SignUpEntity entity) async {
    try {
      final result = await updateProfileService.updateProfile(
          sessionToken, SignUpModel.fromEntity(entity));
      return result;
    } on DioError catch (e) {
      throw DioError(requestOptions: e.requestOptions, response: e.response);
    }
  }
}
