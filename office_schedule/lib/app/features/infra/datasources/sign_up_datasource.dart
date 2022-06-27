import 'package:office_schedule/app/features/domain/entities/entities.dart';

import '../models/models.dart';

abstract class SignUpDatasource {
  Future<SignUpModel?> signUp(SignUpEntity entity);
}
