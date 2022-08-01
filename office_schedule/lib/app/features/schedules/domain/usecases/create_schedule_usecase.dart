import 'package:dartz/dartz.dart';

import '../../../../core/errors/errors.dart';
import '../../../../core/success/success.dart';
import '../entities/entities.dart';
import '../repository/repository.dart';

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
