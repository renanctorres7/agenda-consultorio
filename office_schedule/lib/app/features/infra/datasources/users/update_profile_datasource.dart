import '../../models/models.dart';

abstract class UpdateProfileDatasource {
  Future<UsersModel?> updateProfile(UserUpdateModel userUpdateModel);
}
