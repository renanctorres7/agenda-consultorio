import 'package:dio/dio.dart';

import '../../../../../infra/datasources/datasources.dart';
import '../../../../../domain/entities/entities.dart';

import '../../../../../infra/models/models.dart';
import '../../service/service.dart';

class DioUpdateProfileDatasource implements UpdateProfileDatasource {
  final UpdateProfileService updateProfileService;

  DioUpdateProfileDatasource({required this.updateProfileService});
  @override
  Future<UserModel?> updateProfile(
      String token, UserUpdateEntity userUpdateEntity) async {
    try {
      final result = await updateProfileService.updateProfile(
          token, UserUpdateModel.fromEntity(userUpdateEntity));
      return result;
    } on DioError catch (e) {
      throw DioError(requestOptions: e.requestOptions, response: e.response);
    }
  }
}
