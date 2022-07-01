import '../../models/models.dart';

abstract class UsersListDatasource {
  Future<List<UsersModel>?> getUsersList();
}
