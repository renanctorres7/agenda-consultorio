import '../../models/models.dart';

abstract class UsersListDatasource {
  Future<List<UserModel>?> getUsersList(String token);
}
