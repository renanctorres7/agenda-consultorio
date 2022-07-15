import 'package:dartz/dartz.dart';

import '../../entities/entities.dart';
import '../../errors/errors.dart';
import '../../repositories/respositories.dart';

abstract class ListSchedulePeriodUsecase {
  Future<Either<FailureError, List<ScheduleEntity>>> call(
      String token, SchedulePeriodEntity schedulePeriodEntity);
}

class ListSchedulePeriodUsecaseImpl implements ListSchedulePeriodUsecase {
  final ListSchedulePeriodRepository repository;

  ListSchedulePeriodUsecaseImpl(this.repository);
  @override
  Future<Either<FailureError, List<ScheduleEntity>>> call(
      String token, SchedulePeriodEntity schedulePeriodEntity) async {
    final result =
        await repository.getScheduleListByPeriod(token, schedulePeriodEntity);

    return result;
  }
}
