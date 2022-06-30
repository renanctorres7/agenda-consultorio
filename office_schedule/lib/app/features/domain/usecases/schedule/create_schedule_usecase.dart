import 'package:dartz/dartz.dart';
import 'package:office_schedule/app/features/domain/repositories/respositories.dart';

import '../../entities/entities.dart';
import '../../errors/errors.dart';
import '../../success/success.dart';

abstract class CreateScheduleUsecase {
  Future<Either<FailureError, Success>> call(
      ScheduleCreateEntity scheduleCreateEntity);
}

class CreateScheduleUsecaseImpl extends CreateScheduleUsecase {
  final CreateScheduleRepository repository;

  CreateScheduleUsecaseImpl(this.repository);
  @override
  Future<Either<FailureError, Success>> call(
      ScheduleCreateEntity scheduleCreateEntity) async {
    final result = await repository.createSchedule(scheduleCreateEntity);
    return result;
  }
}
