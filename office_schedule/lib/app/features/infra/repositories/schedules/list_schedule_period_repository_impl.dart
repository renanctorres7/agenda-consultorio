import 'package:office_schedule/app/features/domain/errors/failure_error.dart';
import 'package:office_schedule/app/features/domain/entities/schedules/schedule_period_entity.dart';
import 'package:office_schedule/app/features/domain/entities/schedules/schedule_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:office_schedule/app/features/domain/repositories/respositories.dart';

import '../../datasources/schedules/list_schedule_period_datasource.dart';

class ListSchedulePeriodRepositoryImpl extends ListSchedulePeriodRepository {
  final ListSchedulePeriodDatasource datasource;

  ListSchedulePeriodRepositoryImpl(this.datasource);
  @override
  Future<Either<FailureError, List<ScheduleEntity>>> getScheduleListByPeriod(
      SchedulePeriodEntity schedulePeriodEntity) async {
    try {
      final result =
          await datasource.getScheduleListByPeriod(schedulePeriodEntity);
      return result != null ? Right(result) : Left(NullError());
    } catch (e) {
      return Left(DataSourceError());
    }
  }
}
