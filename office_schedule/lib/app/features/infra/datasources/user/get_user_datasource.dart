import '../../models/models.dart';

abstract class GetUserDatasource {
  Future<UserModel?> getUserProfile(String objectId);
}
