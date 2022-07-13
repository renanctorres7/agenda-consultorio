import 'package:dartz/dartz.dart';

import '../../entities/entities.dart';
import '../../errors/errors.dart';
import '../../repositories/schedule/update_schedule_repository.dart';
import '../../success/success.dart';

abstract class UpdateScheduleUsecase {
  Future<Either<FailureError, Success>> call(
      String token, ScheduleUpdateEntity scheduleUpdateEntity);
}

class UpdateScheduleUsecaseImpl implements UpdateScheduleUsecase {
  final UpdateScheduleRepository repository;

  UpdateScheduleUsecaseImpl(this.repository);
  @override
  Future<Either<FailureError, Success>> call(
      String token, ScheduleUpdateEntity scheduleUpdateEntity) async {
    final result = await repository.updateSchedule(token, scheduleUpdateEntity);
    return result;
  }
}
