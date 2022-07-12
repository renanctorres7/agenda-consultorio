import '../../../domain/entities/entities.dart';
import '../../models/models.dart';

abstract class LoginDatasource {
  Future<SignUpModel?> login(LoginEntity loginEntity);
}
