import '../models/user_model.dart';

abstract class UsersListDatasource {
  Future<List<UserModel>?> getUsersList(String token);
}
