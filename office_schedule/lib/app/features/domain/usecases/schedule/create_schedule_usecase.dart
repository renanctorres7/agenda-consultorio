import 'package:dartz/dartz.dart';

import '../../entities/entities.dart';
import '../../errors/errors.dart';
import '../../success/success.dart';

abstract class CreateScheduleUsecase {
  Future<Either<FailureError, Success>> call(
      ScheduleCreateEntity scheduleCreateEntity);
}

class CreateScheduleUsecaseImpl extends CreateScheduleUsecase {
  @override
  Future<Either<FailureError, Success>> call(
      ScheduleCreateEntity scheduleCreateEntity) {
    // TODO: implement call
    throw UnimplementedError();
  }
}
