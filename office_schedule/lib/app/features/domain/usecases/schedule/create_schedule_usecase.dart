import 'package:dartz/dartz.dart';

import '../../entities/entities.dart';
import '../../errors/errors.dart';
import '../../repositories/respositories.dart';
import '../../success/success.dart';

abstract class CreateScheduleUsecase {
  Future<Either<FailureError, Success>> call(
      String token, ScheduleCreateEntity scheduleCreateEntity);
}

class CreateScheduleUsecaseImpl implements CreateScheduleUsecase {
  final CreateScheduleRepository repository;

  CreateScheduleUsecaseImpl(this.repository);
  @override
  Future<Either<FailureError, Success>> call(
      String token, ScheduleCreateEntity scheduleCreateEntity) async {
    final result = await repository.createSchedule(token, scheduleCreateEntity);
    return result;
  }
}
