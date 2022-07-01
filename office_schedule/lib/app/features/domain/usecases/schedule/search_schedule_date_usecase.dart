import 'package:dartz/dartz.dart';

import '../../entities/entities.dart';
import '../../errors/errors.dart';

abstract class SearchScheduleDateUsecase {
  Future<Either<FailureError, List<ScheduleEntity>>> call(
      ScheduleDateEntity scheduleDateEntity);
}

class SearchScheduleDateUsecaseMock extends SearchScheduleDateUsecase {
  @override
  Future<Either<FailureError, List<ScheduleEntity>>> call(
      ScheduleDateEntity scheduleDateEntity) {
    // TODO: implement call
    throw UnimplementedError();
  }
}
