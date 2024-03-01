import 'package:dio/dio.dart';

import '../../../users/infra/models/user_model.dart';
import '../../domain/entities/user_update_entity.dart';
import '../../infra/datasources/update_profile_datasource.dart';
import '../../infra/models/user_update_model.dart';
import '../service/update_profile_service.dart';

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
    } on DioException catch (e) {
      throw DioException(
          requestOptions: e.requestOptions, response: e.response);
    }
  }
}
