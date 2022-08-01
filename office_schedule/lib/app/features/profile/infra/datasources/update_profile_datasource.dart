import '../../../users/infra/models/user_model.dart';
import '../../domain/entities/user_update_entity.dart';

abstract class UpdateProfileDatasource {
  Future<UserModel?> updateProfile(
      String token, UserUpdateEntity userUpdateEntity);
}
