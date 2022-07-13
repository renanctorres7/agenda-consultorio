import 'package:dio/dio.dart';

import '../../../../../infra/datasources/datasources.dart';
import '../../../../../domain/entities/entities.dart';

import '../../../../../infra/models/models.dart';
import '../../service/service.dart';

class DioUpdateProfileDatasource implements UpdateProfileDatasource {
  final UpdateProfileService updateProfileService;
  final String sessionToken;

  DioUpdateProfileDatasource(
      {required this.updateProfileService, required this.sessionToken});
  @override
  Future<UserModel?> updateProfile(UserUpdateEntity userUpdateEntity) async {
    try {
      final result = await updateProfileService.updateProfile(
          sessionToken, UserUpdateModel.fromEntity(userUpdateEntity));
      return result;
    } on DioError catch (e) {
      throw DioError(requestOptions: e.requestOptions, response: e.response);
    }
  }
}
