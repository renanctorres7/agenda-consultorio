import 'package:office_schedule/app/features/infra/models/models.dart';

abstract class UsersListDatasource {
  Future<List<UsersModel>?> getUsersList();
}
