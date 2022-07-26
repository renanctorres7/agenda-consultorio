import 'package:dartz/dartz.dart';

import '../../../../core/errors/errors.dart';
import '../entities/user_entity.dart';

abstract class UsersListRepository {
  Future<Either<FailureError, List<UserEntity>>> getUsersList(String token);
}
