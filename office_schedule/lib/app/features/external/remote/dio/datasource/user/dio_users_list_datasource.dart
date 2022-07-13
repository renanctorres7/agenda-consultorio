import 'package:dio/dio.dart';
import 'package:office_schedule/app/features/external/remote/dio/service/user/get_users_list_service.dart';
import 'package:office_schedule/app/features/infra/datasources/user/users_list_datasource.dart';
import 'package:office_schedule/app/features/infra/models/user/model/user_model.dart';

class DioUsersListDatasource implements UsersListDatasource {
  final GetUsersListService getUsersListService;
  final String token;

  DioUsersListDatasource(
      {required this.getUsersListService, required this.token});
  @override
  Future<List<UserModel>?> getUsersList() async {
    try {
      final result = await getUsersListService.getUsersList(token);
      return result ?? <UserModel>[];
    } on DioError catch (e) {
      throw DioError(requestOptions: e.requestOptions, response: e.response);
    }
  }
}
