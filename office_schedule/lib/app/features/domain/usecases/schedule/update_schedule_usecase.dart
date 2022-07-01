import 'package:dartz/dartz.dart';
import 'package:office_schedule/app/features/domain/entities/entities.dart';

import '../../errors/errors.dart';
import '../../success/success.dart';

abstract class UpdateScheduleUsecase {
  Future<Either<FailureError, Success>> call(
      ScheduleUpdateEntity scheduleUpdateEntity);
}

class UpdateScheduleUsecaseImpl extends UpdateScheduleUsecase {
  @override
  Future<Either<FailureError, Success>> call(
      ScheduleUpdateEntity scheduleUpdateEntity) {
    // TODO: implement call
    throw UnimplementedError();
  }
}
