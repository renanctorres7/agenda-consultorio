import 'package:dartz/dartz.dart';

import '../../entities/entities.dart';
import '../../errors/errors.dart';

abstract class ListScheduleFilterUsecase {
  Future<Either<FailureError, List<ScheduleEntity>>> call(
      ScheduleFilterEntity scheduleFilterEntity);
}

class ListScheduleFilterUsecaseImpl implements ListScheduleFilterUsecase {
  @override
  Future<Either<FailureError, List<ScheduleEntity>>> call(
      ScheduleFilterEntity scheduleFilterEntity) {
    // TODO: implement call
    throw UnimplementedError();
  }
}
