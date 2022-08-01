import 'package:dio/dio.dart';

import '../../infra/datasources/datasources.dart';
import '../../infra/models/user_model.dart';
import '../service/service.dart';

class DioUsersListDatasource implements UsersListDatasource {
  final GetUsersListService getUsersListService;

  DioUsersListDatasource({required this.getUsersListService});
  @override
  Future<List<UserModel>?> getUsersList(String token) async {
    try {
      final result = await getUsersListService.getUsersList(token);
      return result ?? <UserModel>[];
    } on DioError catch (e) {
      throw DioError(requestOptions: e.requestOptions, response: e.response);
    }
  }
}
