import 'package:office_schedule/app/features/domain/errors/failure_error.dart';
import 'package:office_schedule/app/features/domain/entities/schedules/schedule_filter_entity.dart';
import 'package:office_schedule/app/features/domain/entities/schedules/schedule_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:office_schedule/app/features/domain/repositories/respositories.dart';
import 'package:office_schedule/app/features/infra/datasources/schedules/list_schedule_filter_datasource.dart';

class ListScheduleFilterRepositoryImpl extends ListScheduleFilterRepository {
  final ListScheduleFilterDatasource datasource;

  ListScheduleFilterRepositoryImpl(this.datasource);
  @override
  Future<Either<FailureError, List<ScheduleEntity>>> getListScheduleByFilter(
      ScheduleFilterEntity scheduleFilterEntity) async {
    try {
      final result =
          await datasource.getListScheduleByFilter(scheduleFilterEntity);

      return result != null ? Right(result) : Left(NullError());
    } catch (e) {
      return Left(DataSourceError());
    }
  }
}
