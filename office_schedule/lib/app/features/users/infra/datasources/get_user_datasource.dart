import '../models/user_model.dart';

abstract class GetUserDatasource {
  Future<UserModel?> getUserProfile(String token, String objectId);
}
