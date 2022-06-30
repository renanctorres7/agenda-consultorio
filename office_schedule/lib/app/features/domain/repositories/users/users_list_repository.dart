import 'package:dartz/dartz.dart';

import '../../entities/entities.dart';
import '../../errors/errors.dart';

abstract class UsersListRepository {
  Future<Either<FailureError, List<UsersEntity>>> getUsersList();
}
