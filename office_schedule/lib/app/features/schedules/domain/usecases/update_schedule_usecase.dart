import 'package:dartz/dartz.dart';

import '../../../../core/errors/errors.dart';
import '../../../../core/success/success.dart';
import '../entities/entities.dart';
import '../repository/repository.dart';

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
