import 'package:dio/dio.dart';

import '../../../../../infra/datasources/datasources.dart';

import '../../../../../infra/models/models.dart';
import '../../service/service.dart';

class DioGetUserDatasource implements GetUserDatasource {
  final GetUserService getUserService;

  DioGetUserDatasource({required this.getUserService});
  @override
  Future<UserModel?> getUserProfile(String token, String objectId) async {
    Map<String, String> mapObjectId = {'objectId': objectId};
    try {
      final result = await getUserService.getUserProfile(token, mapObjectId);
      return result;
    } on DioError catch (e) {
      throw DioError(requestOptions: e.requestOptions, response: e.response);
    }
  }
}
