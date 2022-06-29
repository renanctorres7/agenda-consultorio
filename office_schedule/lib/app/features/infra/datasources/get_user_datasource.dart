import '../models/models.dart';

abstract class GetUserDatasource {
  Future<UsersModel?> getUserProfile(String objectId);
}
