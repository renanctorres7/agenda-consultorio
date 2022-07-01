import 'package:dartz/dartz.dart';

import '../../entities/entities.dart';
import '../../errors/errors.dart';

abstract class ListSchedulePeriodUsecase {
  Future<Either<FailureError, List<ScheduleEntity>>> call(
      SchedulePeriodEntity schedulePeriodEntity);
}

class ListSchedulePeriodUsecaseImpl extends ListSchedulePeriodUsecase {
  @override
  Future<Either<FailureError, List<ScheduleEntity>>> call(
      SchedulePeriodEntity schedulePeriodEntity) {
    // TODO: implement call
    throw UnimplementedError();
  }
}
