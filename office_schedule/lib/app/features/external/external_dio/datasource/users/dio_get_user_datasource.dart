import 'package:dio/dio.dart';
import 'package:office_schedule/app/features/external/external_dio/external_dio.dart';
import 'package:office_schedule/app/features/infra/datasources/datasources.dart';
import 'package:office_schedule/app/features/infra/models/users/users_model.dart';

class DioGetUserDatasource implements GetUserDatasource {
  final GetUserService getUserService;

  DioGetUserDatasource({required this.getUserService});
  @override
  Future<UsersModel?> getUserProfile(String objectId) async {
    Map<String, String> mapObjectId = {'objectId': objectId};
    try {
      final result = await getUserService.getUserProfile(mapObjectId);
      return result;
    } on DioError catch (e) {
      throw DioError(requestOptions: e.requestOptions, response: e.response);
    }
  }
}
