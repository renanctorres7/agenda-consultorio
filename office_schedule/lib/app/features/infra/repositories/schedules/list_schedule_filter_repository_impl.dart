import 'package:office_schedule/app/features/domain/errors/failure_error.dart';
import 'package:office_schedule/app/features/domain/entities/schedules/schedule_filter_entity.dart';
import 'package:office_schedule/app/features/domain/entities/schedules/schedule_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:office_schedule/app/features/domain/repositories/respositories.dart';

class ListScheduleFilterRepositoryImpl extends ListScheduleFilterRepository {
  @override
  Future<Either<FailureError, List<ScheduleEntity>>> getListScheduleByFilter(
      ScheduleFilterEntity scheduleFilterEntity) {
    // TODO: implement getListScheduleByFilter
    throw UnimplementedError();
  }
}
