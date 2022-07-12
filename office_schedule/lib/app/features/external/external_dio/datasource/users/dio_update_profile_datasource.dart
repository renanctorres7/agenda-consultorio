import 'package:dio/dio.dart';

import '../../../../domain/entities/entities.dart';
import '../../../../infra/datasources/datasources.dart';
import '../../../../infra/models/models.dart';
import '../../external_dio.dart';

class DioUpdateProfileDatasource implements UpdateProfileDatasource {
  final UpdateProfileService updateProfileService;
  final String sessionToken;

  DioUpdateProfileDatasource(
      {required this.updateProfileService, required this.sessionToken});
  @override
  Future<UsersModel?> updateProfile(UserUpdateEntity userUpdateEntity) async {
    try {
      final result = await updateProfileService.updateProfile(
          sessionToken, UserUpdateModel.fromEntity(userUpdateEntity));
      return result;
    } on DioError catch (e) {
      throw DioError(requestOptions: e.requestOptions, response: e.response);
    }
  }
}
