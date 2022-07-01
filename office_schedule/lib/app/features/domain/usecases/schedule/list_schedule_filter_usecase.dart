import 'package:dartz/dartz.dart';

import '../../entities/entities.dart';
import '../../errors/errors.dart';
import '../../repositories/respositories.dart';

abstract class ListScheduleFilterUsecase {
  Future<Either<FailureError, List<ScheduleEntity>>> call(
      ScheduleFilterEntity scheduleFilterEntity);
}

class ListScheduleFilterUsecaseImpl implements ListScheduleFilterUsecase {
  final ListScheduleFilterRepository repository;

  ListScheduleFilterUsecaseImpl(this.repository);
  @override
  Future<Either<FailureError, List<ScheduleEntity>>> call(
      ScheduleFilterEntity scheduleFilterEntity) async {
    final result =
        await repository.getListScheduleByFilter(scheduleFilterEntity);

    return result;
  }
}
