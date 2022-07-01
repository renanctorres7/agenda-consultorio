import 'package:dartz/dartz.dart';
import 'package:office_schedule/app/features/domain/entities/entities.dart';
import 'package:office_schedule/app/features/domain/errors/errors.dart';

abstract class ListSchedulePeriodUsecase {
  Future<Either<FailureError, List<ScheduleEntity>>> call(
      SchedulePeriodEntity schedulePeriodEntity);
}
