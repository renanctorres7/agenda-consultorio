import 'package:office_schedule/app/features/domain/errors/failure_error.dart';
import 'package:office_schedule/app/features/domain/entities/schedules/schedule_period_entity.dart';
import 'package:office_schedule/app/features/domain/entities/schedules/schedule_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:office_schedule/app/features/domain/repositories/respositories.dart';

class ListScheduleRepositoryImpl extends ListSchedulePeriodRepository {
  @override
  Future<Either<FailureError, List<ScheduleEntity>>> getScheduleListByPeriod(
      SchedulePeriodEntity schedulePeriodEntity) {
    // TODO: implement getScheduleListByPeriod
    throw UnimplementedError();
  }
}
