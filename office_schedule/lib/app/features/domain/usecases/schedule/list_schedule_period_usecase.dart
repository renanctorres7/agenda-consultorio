import 'package:dartz/dartz.dart';
import 'package:office_schedule/app/features/domain/repositories/respositories.dart';

import '../../entities/entities.dart';
import '../../errors/errors.dart';

abstract class ListSchedulePeriodUsecase {
  Future<Either<FailureError, List<ScheduleEntity>>> call(
      SchedulePeriodEntity schedulePeriodEntity);
}

class ListSchedulePeriodUsecaseImpl extends ListSchedulePeriodUsecase {
  final ListSchedulePeriodRepository repository;

  ListSchedulePeriodUsecaseImpl(this.repository);
  @override
  Future<Either<FailureError, List<ScheduleEntity>>> call(
      SchedulePeriodEntity schedulePeriodEntity) async {
    final result =
        await repository.getScheduleListByPeriod(schedulePeriodEntity);

    return result;
  }
}
