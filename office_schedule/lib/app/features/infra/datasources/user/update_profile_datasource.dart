import '../../../domain/entities/entities.dart';
import '../../models/models.dart';

abstract class UpdateProfileDatasource {
  Future<UserModel?> updateProfile(UserUpdateEntity userUpdateEntity);
}
