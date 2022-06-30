import 'package:office_schedule/app/features/domain/entities/entities.dart';
import 'package:office_schedule/app/features/infra/models/models.dart';

abstract class LoginDatasource {
  Future<SignUpModel?> login(LoginEntity loginEntity);
}
